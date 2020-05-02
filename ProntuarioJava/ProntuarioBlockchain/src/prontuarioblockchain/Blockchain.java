/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prontuarioblockchain;

import java.security.MessageDigest;
import java.util.ArrayList;

/**
 *
 * @author bruno
 */
public class Blockchain {

    ArrayList<Block> blocos = new ArrayList<>();

    private void insertBlock(Block bloco) {
        if (blocos.isEmpty()) {
            bloco.setId(0);
            bloco.setHashAterior("0000000000000000000000000000000000000000000000000000000000000000");
        }else{
            bloco.setId(blocos.get(blocos.size() - 1).getId() + 1);
            bloco.setHashAterior(blocos.get(blocos.size() - 1).getHashAtual());
        }
        bloco.setHashAtual(toSha256(String.valueOf(bloco.getId()) + bloco.getEndMedico() + bloco.getEndPaciente() + bloco.getProcedimento() + bloco.getHashAterior()));
        blocos.add(bloco);
    }

    public void createBlock(String med, String pac, String Proc) {
        Block aux = new Block();
        aux.setEndMedico(med);
        aux.setEndPaciente(pac);
        aux.setProcedimento(Proc);
        insertBlock(aux);
    }

    public static String toSha256(String base) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(base.getBytes("UTF-8"));
            StringBuffer hexString = new StringBuffer();

            for (int i = 0; i < hash.length; i++) {
                String hex = Integer.toHexString(0xff & hash[i]);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }
    
    public void listAllBlocks(){
        for(int i = 0; i < blocos.size(); i++){
            System.out.println("Id: " + blocos.get(i).getId());
            System.out.println("Medico: " + blocos.get(i).getEndMedico());
            System.out.println("Paciente: " + blocos.get(i).getEndPaciente());
            System.out.println("Procedimento: " + blocos.get(i).getProcedimento());
            System.out.println("Hash Anterior: " + blocos.get(i).getHashAterior());
            System.out.println("Hash Atual: " + blocos.get(i).getHashAtual());
            System.out.println("");
        }
    }
}
