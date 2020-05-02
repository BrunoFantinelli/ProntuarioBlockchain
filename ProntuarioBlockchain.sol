pragma solidity >=0.4.11 <0.7.0;
pragma experimental ABIEncoderV2;

contract ProntuarioDistribuido {

    struct Prontuario {
        address medico;
        address paciente;
        string procedimento;
    }

    uint idProntuario = 0;
    mapping (uint => Prontuario) prontuarios;

    function newProntuario(address medico, address paciente, string memory procedimento) public  {
        prontuarios[idProntuario] = Prontuario(medico, paciente, procedimento);
        idProntuario++;
    }

    function getProntuario(uint id) view public returns (Prontuario memory){
        return prontuarios[id];
    }
}


