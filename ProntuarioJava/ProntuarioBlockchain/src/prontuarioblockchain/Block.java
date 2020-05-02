/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prontuarioblockchain;

/**
 *
 * @author bruno
 */
public class Block {

    
    private int id;
    private String endMedico;
    private String endPaciente;
    private String Procedimento;
    private String hashAterior;
    private String hashAtual;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEndMedico() {
        return endMedico;
    }

    public void setEndMedico(String endMedico) {
        this.endMedico = endMedico;
    }

    public String getEndPaciente() {
        return endPaciente;
    }

    public void setEndPaciente(String endPaciente) {
        this.endPaciente = endPaciente;
    }

    public String getProcedimento() {
        return Procedimento;
    }

    public void setProcedimento(String Procedimento) {
        this.Procedimento = Procedimento;
    }

    public String getHashAterior() {
        return hashAterior;
    }

    public void setHashAterior(String hashAterior) {
        this.hashAterior = hashAterior;
    }

    public String getHashAtual() {
        return hashAtual;
    }

    public void setHashAtual(String hashAtual) {
        this.hashAtual = hashAtual;
    }
    
}
