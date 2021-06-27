/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Networks;

import java.io.File;
import java.io.FileInputStream;
import org.apache.commons.net.ftp.FTPClient;

/**
 *
 * @author Lenovo
 */
public class DRIVE_Network {
    
FTPClient client = new FTPClient();
    FileInputStream fis = null;
    boolean status;

    /**
     *
     * @param file
     * @return
     */
    public boolean upload(File file) {
        try {
            
            client.connect("ftp.drivehq.com");
            client.login("crypt", "cryptoo");
            System.out.print("\nLogin Success");
            client.enterLocalPassiveMode();
            fis = new FileInputStream(file);
            status = client.storeFile("/" + file.getName(), fis);
            System.out.print("\nUploaded");
            
            //file path of drive storage
            client.logout();
            fis.close();

        } catch (Exception e) {
            System.out.println(e);
        }
        if (status) {
            System.out.println("success");
            return true;
        } else {
            System.out.println("failed");
            return false;

        }

    }
}
