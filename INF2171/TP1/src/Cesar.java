

public class Cesar {
    public static void main(String[] args) {

        char traitement;
        System.out.print("Entrez la clé : ");
        int num = Pep8.deci();
        System.out.print("Entrez le message : ");
        Pep8.chari();

        char[] ponctuation = {' ', '.', '\'', '-', '!', '?'};


        do {

            traitement = Pep8.chari();
            char code = 0;
            if (traitement > 96 && traitement < 123) {
                if (num > 0 && (traitement - 97 + num > 26)) {
                    code += ((traitement + num - 97) % 26) + 97;
                    System.out.print(code);
                } else if (num > 0 && (traitement - 97 + num < 26)) {
                    code += traitement + num;
                    System.out.print(code);
                } else if (num < 0 && (traitement - 97 + num <= 0)) {
                    int h = traitement - 97 + num;
                    int modulo = (h % 26);
                    if (modulo != 0) {
                        code += 26 + modulo + 97;
                    } else {
                        code += modulo + 97;
                    }
                    System.out.print(code);
                } else if (num < 0 && (traitement - 97 + num >= 0)) {
                    code += traitement + num;
                    System.out.print(code);
                }
            } else if (traitement > 64 && traitement < 91) {
                if (num > 0 && (traitement - 65 + num > 26)) {
                    code += ((traitement + num - 65) % 26) + 65;
                    System.out.print(code);
                } else if (num > 0 && (traitement - 65 + num < 26)) {
                    code += traitement + num;
                    System.out.print(code);
                } else if (num < 0 && (traitement - 65 + num < 0)) {
                    code += (26 + (traitement - 65 + num % 26) + 65);
                    System.out.print(code);
                } else if (num < 0 && (traitement - 65 + num > 0)) {
                    code += traitement + num;
                    System.out.print(code);
                }
            } else if (traitement == ' ' | traitement == '.' | traitement == '\'' | traitement == '-' | traitement == '!' | traitement == '?') {
                if (traitement == 32) {
                    if (num >= 0) {
                        code += (traitement + num - 32) % 6;
                        System.out.print(ponctuation[code]);
                    } else {
                        int h = traitement + num - 32;
                        int modulo = 6 + (h % 6);
                        code += ponctuation[modulo];
                        System.out.println(code);
                    }
                } else if (traitement == 46) {
                    if (num >= 0) {
                        code += (traitement + num - 46) % 6;
                        System.out.print(ponctuation[code]);
                    } else {
                        int h = traitement + num - 46;
                        int modulo = 5 + (h % 6);
                        code += ponctuation[modulo];
                        System.out.println(code);
                    }
                } else if (traitement == 39) {
                    if (num >= 0) {
                        code += (traitement + num - 39) % 6;
                        System.out.print(ponctuation[code]);
                    } else {
                        int h = traitement + num - 39;
                        int modulo = 5 + (h % 6);
                        code += ponctuation[modulo];
                        System.out.println(code);
                    }
                } else if (traitement == 45) {
                    if (num >= 0) {
                        code += (traitement + num - 45) % 6;
                        System.out.print(ponctuation[code]);
                    } else {
                        int h = traitement + num - 45;
                        int modulo = 5 + (h % 6);
                        code += ponctuation[modulo];
                        System.out.println(code);
                    }
                } else if (traitement == 33) {
                    if (num >= 0) {
                        code += (traitement + num - 33) % 6;
                        System.out.print(ponctuation[code]);
                    } else {
                        int h = traitement + num - 33;
                        int modulo = 5 + (h % 6);
                        code += ponctuation[modulo];
                        System.out.println(code);
                    }
                } else if (traitement == 63) {
                    if (num >= 0) {
                        code += (traitement + num - 63) % 6;
                        System.out.print(ponctuation[code]);
                    } else {
                        int h = traitement + num - 63;
                        int modulo = 5 + (h % 6);
                        code += ponctuation[modulo];
                        System.out.println(code);
                    }
                }
            } else {
                code += traitement;
                System.out.println(code);
            }

        } while (traitement != '\n');
        Pep8.stop();
    }
}





