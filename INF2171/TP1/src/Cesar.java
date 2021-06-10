
import java.util.Scanner;
public class Cesar {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.print("Entrez la clé : ");
        int num = scan.nextInt();
        System.out.print("Entrez le message : ");
        String text = scan.next();
        scan.close();
        char code = 0;

        for(int i=0; i < text.length(); i++){
            int traitement = text.charAt(i);
            code +=(traitement + num);
            traitement++;



        }
        System.out.println(code);

    }
}

