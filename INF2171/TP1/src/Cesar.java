
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
       for(int i=0; i<text.length(); i++){
           char traitement = text.charAt(i);
           char code =0;
           if(traitement > 96 && traitement < 123){
               if(num>0 && (traitement -97 + num >26)){
                   code += ((traitement + num - 97) % 26) + 97;
                   System.out.print(code);

               }else if (num>0 && (traitement -97 + num <26)){
                   code+= traitement+num;
                   System.out.print(code);
               }else if (num<0 && (traitement -97 + num <=0)){
                  // int h = traitement -97 +num;
                  // int modulo =(26+(h%26))+97;
                 //  System.out.println(h);
                  // System.out.println(modulo);
                   code +=  (traitement -97 +num % 26)+97;
                   System.out.print(code);

               } else if (num<0  && (traitement -97 + num >=0)){
                   code += traitement +num;
                   System.out.print(code);
               }
           }if(traitement > 64 && traitement <91){
               if(num>0 && (traitement -65 + num >26)){
                   code += ((traitement + num - 65) % 26) + 65;
                   System.out.print(code);

               }else if (num>0 && (traitement -65 + num <26)){
                   code+= traitement+num;
                   System.out.print(code);
               }else if (num<0 && (traitement -65 + num <0)){
                   code +=  (26+(traitement -65 +num % 26)+65);
                   System.out.print(code);

               } else if (num<0  && (traitement -65 + num >0)){
                   code += traitement +num;
                   System.out.print(code);
               }
           }
           }
       }
    }


