
import java.util.Scanner;
public class Cesar {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.print("Entrez la clé : ");
        int num = scan.nextInt();
        System.out.print("Entrez le message : ");
        String text = scan.next();
        scan.close();
        String code ="";


        for(int i=0; i < text.length(); i++){
            char traitement = text.charAt(i );

            code += String.valueOf(traitement + num);



        }
        System.out.println(code);
    }
}

