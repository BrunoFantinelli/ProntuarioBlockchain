pragma solidity >=0.4.11 <0.7.0;
pragma experimental ABIEncoderV2;

contract ProntuarioDistribuido {
   
   
    struct Role {
        string nome;
        bool exist;
    }
    
    struct Usuarios {
        string nome;
        bool exist;
        Role role;
    }
    
    
    struct Prontuario {
        address medico;
        address paciente;
        string procedimento;
    }
    


    mapping(uint => Role) Roles;
    mapping(address => Usuarios) ListaUsuarios;
    mapping(uint => Prontuario) prontuarios;

    uint idProntuario = 0;
    uint idRoles = 1;
    uint idUsuarios = 1;


    modifier onlyAdmin(){
        require(keccak256(bytes(ListaUsuarios[msg.sender].role.nome)) == keccak256(bytes("Admin")));
        _;
    }
    
    modifier onlyMedico(){
        require(keccak256(bytes(ListaUsuarios[msg.sender].role.nome)) == keccak256(bytes("Medico")));
        _;
    }
   
    modifier MedicoAndAdmin(){
        require(keccak256(bytes(ListaUsuarios[msg.sender].role.nome)) == keccak256(bytes("Medico")) || keccak256(bytes(ListaUsuarios[msg.sender].role.nome)) == keccak256(bytes("Admin")) );
        _;
    }
   

   constructor(string memory _nome) public{
        Roles[0].nome = "Admin";
        Roles[0].exist = true;
        ListaUsuarios[msg.sender].nome = _nome;
        ListaUsuarios[msg.sender].role = Roles[0];
        ListaUsuarios[msg.sender].exist = true;
        newRole("Medico");
        newRole("Paciente");
        
    }

    
    function newRole(string memory nome) public onlyAdmin {
        Roles[idRoles].nome = nome;
        Roles[idRoles].exist = true;
        idRoles++;
    }
    
    function deleteRole(uint id) public onlyAdmin {
        Roles[id].exist = false;   
    }


    function newUsuario(address _endereco, string memory _nome, uint idRole) public onlyAdmin {
        ListaUsuarios[_endereco].nome = _nome;
        ListaUsuarios[_endereco].role = Roles[idRole];
        ListaUsuarios[_endereco].exist = true;
        idUsuarios++;
    }
 

    function getPaciente(address paciente)public MedicoAndAdmin view returns (bool aux) {
        if(ListaUsuarios[paciente].exist && keccak256(bytes(ListaUsuarios[paciente].role.nome)) == keccak256(bytes("Paciente"))){
            return true;
        }
        return false;
    }

    function newProntuario(address paciente, string memory procedimento) public onlyMedico {
        bool pacienteExiste = getPaciente(paciente);
        if(pacienteExiste){
            prontuarios[idProntuario] = Prontuario(msg.sender, paciente, procedimento);
            idProntuario++;
        }
    }

    function getProntuario(uint id) public MedicoAndAdmin view returns (Prontuario memory){
            return prontuarios[id];
    }
}
