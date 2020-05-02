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
public class ProntuarioBlockchain {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Blockchain bc = new Blockchain();
        bc.createBlock("med", "pac", "Proc");
        bc.createBlock("med2", "pac2", "Proc2");
        bc.createBlock("med3", "pac3", "Proc3");
        bc.listAllBlocks();
    }
    
}
