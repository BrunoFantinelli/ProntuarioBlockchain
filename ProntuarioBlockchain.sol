pragma solidity >=0.4.11 <0.7.0;
pragma experimental ABIEncoderV2;

contract ProntuarioDistribuido {


    struct Prontuario {
        address medico;
        address paciente;
        string procedimento;
    }


    mapping(uint => address) public listaMedicos;
    mapping(uint => address) public listaPacientes;
    mapping(uint => Prontuario) prontuarios;

    uint idProntuario = 0;
    uint idMedico = 0;
    uint idPaciente = 0;

    public function cadastrarNovoMedico(address medico){
        listaMedicos[idMedico] = medico;
        idMedico++;
    }
    
    public function cadastrarNovoPaciente(address paciente){
        listaPacientes[idPaciente] = paciente;
        idPaciente++;
    }

    function newProntuario(address medico, address paciente, string memory procedimento) public  {
        prontuarios[idProntuario] = Prontuario(medico, paciente, procedimento);
        idProntuario++;
    }

    function getProntuario(uint id) public view returns (Prontuario memory){
        return prontuarios[id];
    }
}


