STRO     invitMsg,d                                    ;Invite de commande pour rentrer la clé du décalage (nb).
         DECI nb,d				
STRO     saisCar,d				       ;Invite pour rentrer le text à coder (trait).
loop:    CHARI               trait,d		       ;Boucle générale pour le traitement du caractére
         LDA                 0,i                       
         LDBYTEA             trait,d
         CPA                 '\n',i		       ;Fin de boucle si usager à rentrer un retour de chariot.
         BREQ                stop
         LDBYTEA             trait,d		       
         CPA                 96,i			;Traitement pour les lettres miniscule dont la valeur ASCII >96
         BRGE                born96D				
         CPA                 64,i
         BRGE                born64D			;Traitement pour les lettres Majuscules
         BR                  affich

letMaju: LDA                 0,i			
         LDBYTEA             trait,d
         SUBA                65,i
         ADDA                nb,d         
         CPA                 0,i			; On compare à zero pour voir si on a besoin de faire le modulo.
         BRLT                ajust2  			; Si on dépasse 26 donc le modulo est nécessaire et en branche avec le modulo.
         ADDA                65,i			; Sinon on ajouter 65 supprimer initalement et on affiche le caractére
         STBYTEA             trait,d
         BR                  affich       

born64D: CPA                 born91,i			;Traitement pour lettre Majuscules.
         BRGT                affich			;Si plus grand que 123 on affiche le caracté ASCI
         LDA                 nb,d
         CPA                 0,i
         BRLE                letMaju                    ;si la clé de décalage est >0 on branche avec LetMaju
         LDBYTEA             trait,d
         SUBA                65,i 
         ADDA                nb,d			;Ajout du décalage
         CPA                 26,i 			;Si plus grand que 26 on fait modulo
         BRGE                modPos2
         ADDA                65,i			;Sinon on ajoute 65 soustrait initalement et on affiche avec le décalage.
         STBYTEA             trait,d      
         CHARO               trait,d 
         BR                  loop

modPos2: SUBA                26,i			  
         CPA                 26,i			;On vérifie si on déborde plus que 26 
         BRGE                modPos2			;Si plus grand on soustrait encore 26
         ADDA                65,i
         STBYTEA             trait,d 
         CHARO               trait,d 			;Affichage du décalage
         BR                  loop

ajust2:  CPA                 -26,i			;Traitment nécaissaire si on a besoin du modulo
         BRLT                modNeg2 
         ADDA                26,i
         ADDA                65,i
         STBYTEA             trait,d 
         CHARO               trait,d 
         BR                  loop     


modNeg2: ADDA                26,i			;Modulo Quand le décalage est une clé négative
         CPA                 -26,i 			;Comparge a -26 pour trouver le reste.
         BRLE                modNeg2
         CPA                 0,i			;traitement du cas spécifique ou modulo=0
         BREQ                suite    
         ADDA                26,i
suite:   ADDA                65,i
         STBYTEA             trait,d 
         CHARO               trait,d 
         BR                  loop

letMins: LDA                 0,i			;traitement des miniscules. MEME CODE QUE MAJUSCULE.
         LDBYTEA             trait,d			
         SUBA                97,i
         ADDA                nb,d         
         CPA                 0,i
         BRLT                ajust1  
         ADDA                97,i
         STBYTEA             trait,d
         BR                  affich


born96D: CPA                 born123,i 
         BRGT                affich
         LDA                 nb,d
         CPA                 0,i
         BRLE                letMins
         LDBYTEA             trait,d
         SUBA                97,i 
         ADDA                nb,d    
         CPA                 26,i 
         BRGE                modPos1
         ADDA                97,i
         STBYTEA             trait,d      
         CHARO               trait,d 
         BR                  loop

modPos1: SUBA                26,i
         CPA                 26,i 
         BRGE                modPos1
         ADDA                97,i
         STBYTEA             trait,d 
         CHARO               trait,d 
         BR                  loop

ajust1:  CPA                 -26,i
         BRLT                modNeg1
         ADDA                26,i
         ADDA                97,i
         STBYTEA             trait,d 
         CHARO               trait,d 
         BR                  loop     


modNeg1: ADDA                26,i
         CPA                 -26,i 
         BRLE                modNeg1
         CPA                 0,i
         BREQ                suite1    
         ADDA                26,i
suite1:  ADDA                97,i 
         STBYTEA             trait,d 
         CHARO               trait,d 
         BR                  loop

ponct2:  LDA                 table,x   
         STA                 case,d    
         STRO                case,n
         STBYTEA             nb,d
         
         BR                  loop

ponct:   LDA                 nb,d 
         CPA                 0,i
         BRGE                ponct2
          
affich:  CHARO               trait,d
         BR                  loop

stop:    STOP

nb:              .BLOCK 2 
return:          .byte 0
trait:           .byte 0
invitMsg:        .ASCII         "Entrez un nombre: \x00" 
saisCar:         .ASCII         "Entrez un Caractère: \x00"
born96:          .WORD        96
born123:         .WORD        123 
born64:          .WORD        64
born91:          .WORD        91
Born1:           .ASCII         ">96 && <123 \x00" 
                   
                 .END