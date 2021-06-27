/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Access_Control_Scheme;

/**
 *
 * @author JAVA-JP
 */
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import sun.misc.BASE64Encoder;



public class Encryption 
{

public String encrypt(String text,SecretKey secretkey)
{
    String plainData=null,cipherText=null;
	try
	{
    	 plainData=text;
    
            
        Cipher aesCipher = Cipher.getInstance("AES");//getting AES instance
	aesCipher.init(Cipher.ENCRYPT_MODE,secretkey);//initiating ciper encryption using secretkey
                     
        byte[] byteDataToEncrypt = plainData.getBytes();
	byte[] byteCipherText = aesCipher.doFinal(byteDataToEncrypt);//encrypting data 
	
          //  System.out.println("ciper text:"+byteCipherText);
        
        cipherText = new BASE64Encoder().encode(byteCipherText);//converting encrypted data to string 
    
        System.out.println("\n Given text : "+plainData+" \n Cipher Data : "+cipherText);
	       
        }
	catch(Exception e)
	{
	           System.out.println(e);	
	}
    return cipherText;
}

}