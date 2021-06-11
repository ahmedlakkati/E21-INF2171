
import java.util.Scanner;

import static java.net.IDN.toASCII;

public class Cesar {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.print("Entrez la clé : ");
        int num = scan.nextInt();

        System.out.print("Entrez le message : ");
        String text = scan.next();
        scan.close();
        if (num >0){
        for(int i=0; i < text.length(); i++) {
            char traitement = text.charAt(i);
            if (traitement > 96 && traitement < 123) {
                char code = 0;
                code += ((traitement + num - 97) % 26) + 97;
                char ch = (char) code;
                System.out.print(code);
            } else if (traitement > 64 && traitement < 91) {
                char code = 0;
                code += ((traitement + num - 65) % 26) + 65;
                char ch = (char) code;
                System.out.print(code);
            }
        }
        }else if (num <0){
            System.out.println("work in progress");

        }
    }
}


