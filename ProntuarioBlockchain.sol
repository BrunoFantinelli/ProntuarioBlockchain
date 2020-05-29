pragma solidity >=0.4.11 <0.7.0;
pragma experimental ABIEncoderV2;

contract ProntuarioDistribuido {


    struct Prontuario {
        address medico;
        address paciente;
        string procedimento;
    }

    struct Medico{
        address endereco;
        string nome;
        bool exist;
    }

    struct Paciente{
        address endereco;
        string nome;
        bool exist;
    }

    mapping(address => Medico) private listaMedicos;
    mapping(address => Paciente) private listaPacientes;
    mapping(uint => Prontuario) prontuarios;

    uint idProntuario = 0;

    constructor(string memory _nome) public{
        listaMedicos[msg.sender].endereco = msg.sender;
        listaMedicos[msg.sender].nome = _nome;
        listaMedicos[msg.sender].exist = true;
    }

    function cadastrarNovoMedico(address medico, string memory nome) public {
        bool medicoExiste = getMedico(msg.sender);
        if(medicoExiste){
            listaMedicos[medico].endereco = medico;
            listaMedicos[medico].nome = nome;
            listaMedicos[medico].exist = true;
        }
    }

    function cadastrarNovoPaciente(address paciente, string memory nome) public {
        bool medicoExiste = getMedico(msg.sender);
        if(medicoExiste){
            listaPacientes[paciente].endereco = paciente;
            listaPacientes[paciente].nome = nome;
            listaPacientes[paciente].exist = true;
        }
    }

    function getPaciente(address paciente)public view returns (bool aux){
        bool medicoExiste = getMedico(msg.sender);
        if(medicoExiste){
            aux = listaPacientes[paciente].exist;
            return aux;
        }
    }

    function getMedico(address medico)private view returns (bool aux){
        aux = listaPacientes[medico].exist;
        return aux;
    }

    function newProntuario(address paciente, string memory procedimento) public  {
        bool medicoExiste = getMedico(msg.sender);
        bool pacienteExiste = getPaciente(paciente);
        if(medicoExiste && pacienteExiste){
            prontuarios[idProntuario] = Prontuario(msg.sender, paciente, procedimento);
            idProntuario++;
        }
    }

    function getProntuario(uint id) public view returns (Prontuario memory){
        bool medicoExiste = getMedico(msg.sender);
        if(medicoExiste){
            return prontuarios[id];
        }
    }
}


