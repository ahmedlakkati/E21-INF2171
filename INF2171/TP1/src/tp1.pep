STRO     invitMsg,d
         DECI nb,d
STRO     saisCar,d
loop:    CHARI               trait,d
         LDA                 0,i
         LDBYTEA             trait,d
         CPA                 '\n',i
         BREQ                stop
         LDBYTEA             trait,d
         CPA                 96,i
         BRGE                born96D
         CPA                 64,i
         BRGE                born64D
         BR                  affich

letMaju: LDA                 0,i
         LDBYTEA             trait,d
         SUBA                65,i
         ADDA                nb,d         
         CPA                 0,i
         BRLT                ajust2  
         ADDA                65,i
         STBYTEA             trait,d
         BR                  affich       

born64D: CPA                 born91,i 
         BRGT                affich
         LDA                 nb,d
         CPA                 0,i
         BRLE                letMaju
         LDBYTEA             trait,d
         SUBA                65,i 
         ADDA                nb,d    
         CPA                 26,i 
         BRGE                modPos2
         ADDA                65,i
         STBYTEA             trait,d      
         CHARO               trait,d 
         BR                  loop

modPos2: SUBA                26,i
         CPA                 26,i 
         BRGE                modPos2
         ADDA                65,i
         STBYTEA             trait,d 
         CHARO               trait,d 
         BR                  loop

ajust2:  CPA                 -26,i
         BRLT                modNeg2 
         ADDA                26,i
         ADDA                65,i
         STBYTEA             trait,d 
         CHARO               trait,d 
         BR                  loop     


modNeg2: ADDA                26,i
         CPA                 -26,i 
         BRLE                modNeg2
         CPA                 0,i
         BREQ                suite    
         ADDA                26,i
suite:   ADDA                65,i
         STBYTEA             trait,d 
         CHARO               trait,d 
         BR                  loop

letMins: LDA                 0,i
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