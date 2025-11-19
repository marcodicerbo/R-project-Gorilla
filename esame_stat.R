
### Verifico se le variabili dipendono dal sesso degli orfani
# CONTACT CHANGE

library(readxl)
data_sex_cc <- read_excel("C:/Users/Windows/Desktop/proj_esame_stat/dati_mod/data__sex_cc.xlsx")  ## Carico il dataset tramite 
View(data_sex_cc)                                                                                 #  Import Dataset

my_data <- head(data_sex_cc, n = nrow(data_sex_cc) - 3)   ## Elimino le ultime 3 righe della tabella perché contengono valori 
                                                           # che rappresentano il totale

names(data_sex_cc) = c("Sesso", "ContactChange")          ## Cambio i nomi delle colonne di entrambe le tabelle
names(my_data) = c("Sesso", "ContactChange")
data_hist <- data_sex_cc[data_sex_cc$Sesso == "F"|data_sex_cc$Sesso == "M",]   ## modifico il dataset in modo da utilizzare solo  
                                                                                # valori associati al sesso

### Verifico che i dati abbiano una distribuzione normale mediante un Q-Q plot (se i punti dei dati si allineano approssimativamente  
#   lungo la linea di riferimento, ciò suggerisce che i dati seguono approssimativamente una distribuzione normale; al contrario,   
#   se i punti deviano significativamente dalla linea di riferimento, ciò potrebbe indicare una deviazione dalla normalità)

qqnorm(data_hist$ContactChange)                       ## crea un grafico quantile-quantile 
qqline(data_hist$ContactChange)                       ## aggiunge la linea di riferimento

library(ggplot2)

ggplot(data = data_hist, aes(x = ContactChange)) +   ## creo un istogramma per osservare la distribuzione
  geom_histogram(fill = "blue", color = "black") +
  labs(x = "ContactChange", y = "Frequenza", title = " Affiliative Contact") +
  geom_density(color = "red", fill = "transparent")  ## aggiungo una curva che stima la densità della distribuzione

## Dall'istogramma e dalla curva non sembra che i miei dati seguano una distribuzione normale, inoltre si notano due picchi per cui 
#  potrebbe essere al più bimodale. 

shapiro.test(data_hist$ContactChange)                 ## verifico ulteriormente la distribuzione tramite un test di normalità
                                                      #  W = 0.88013, p-value = 0.002385; l'ipotesi nulla (H0) è che i dati 
                                                      #  seguano una distribuzione normale, dato che il p-value è significativo 
                                                      #  rigetto H0, per cui i miei dati non seguono una distribuzione normale!

boxplot(ContactChange ~ Sesso, 
        data = data_hist, col = c("pink", "lightblue"))  
                                                                                  
                                                                                 ## Creo un boxplot per confrontare valori 
                                                                                  # associati a orfani maschi e femmine

## Dai boxplot si può osservare come le mediane siano quasi identiche, nonostante i maschi mostrino una variabilità leggermente 
# maggiore rispetto alle femmine (distanza interquartile più ampia), data la maggiore altezza sia della scatola che del "baffo" 
# superiore. Sono presenti alcuni outliers (valori anomali), oltre il limite inferiore e superiore del boxplot, 3 per le femmine e 1 
# per i maschi. Nel complesso, osservando i due boxplot, sembra che non ci siano sostanziali differenze tra le due distribuzioni.

dati_sesso_M <- subset(my_data, Sesso == "M")             ## Creo due nuovi dataset, ognuno associato ad un sesso, in modo
dati_sesso_F <- subset(my_data, Sesso == "F")             #  da poter confrontare le mediane tramite un test di Mann-Whitney

names(dati_sesso_M) = c("Maschi", "Contact Change M")
names(dati_sesso_F) = c("Femmine", "Contact Change F")

risultato_Mann_Whitney_cc <- wilcox.test(dati_sesso_M$`Contact Change M`, dati_sesso_F$`Contact Change F`)
View(risultato_Mann_Whitney_cc)            ## utilizzo un test non parametrico in alternativa al t.test; W = 117 e p-value = 0.922, 
                                         # siccome H0 è che le due distribuzioni sono identiche, e il 
                                         # p-value non è significativo, non posso affermare che esistono differenze tra i due gruppi
                                         # per cui la variabile contact change non dipende dal sesso!

### Eseguo la medesima analisi per la seconda variabile
# PROXIMITY CHANGE

library(readxl)
data_sex_pc <- read_excel("C:/Users/Windows/Desktop/proj_esame_stat/dati_mod/data_sex_pc.xlsx")
View(data_sex_pc)

my_data2 <- head(data_sex_pc, n = nrow(data_sex_pc) - 1)    # Elimino l'ultima riga della tabella

names(data_sex_pc) = c("Sesso", "ProximityChange")
names(my_data2) = c("Sesso", "ProximityChange")
data_hist2 <- data_sex_pc[data_sex_pc$Sesso == "F"|data_sex_pc$Sesso == "M",]

qqnorm(data_hist2$ProximityChange)                       
qqline(data_hist2$ProximityChange)

ggplot(data = data_hist2, aes(x = ProximityChange)) +   
  geom_histogram(fill = "blue", color = "black") +
  labs(x = "ProximityChange", y = "Frequenza", title = "Proximity") + 
  geom_density(color = "red", fill = "transparent")  

## Rispetto alla variabile precedente, questa curva sembra poter essere più approssimabile ad una normale, nonostante 
# avere soltanto 31 osservazioni potrebbe comunque distorcere la reale distribuzione.

shapiro.test(data_hist2$ProximityChange)       ## W = 0.934 p-value = 0.076, differentemente dalla variabile precedente, 
   #la distribuzione della var Proximity può essere approssimata a una normale, dato che il p-value non è significativo.

boxplot(ProximityChange ~ Sesso, 
        data = data_hist2, col = c("pink", "lightblue"))

## Anche in questo caso, le mediane dei due boxplot sono molto simili. L'ampiezza dei box sembra essere comparabile tra le due 
# distribuzioni; mentre per le femmine l'ampiezza dei baffi è abbastanza maggiore rispetto a quella dei maschi. Differentemente dalla 
# var Contact, qui non abbiamo outliers. Ad ogni modo, le due distribuzioni sembrano essere comparabili anche per la Proximity.

dati_sesso_M2 <- subset(my_data2, Sesso == "M")       ## creo due nuovi dataset per confrontare le medie tramite un t.test
dati_sesso_F2 <- subset(my_data2, Sesso == "F")

names(dati_sesso_M2) = c("Maschi", "Proximity Change M")
names(dati_sesso_F2) = c("Femmine", "Proximity Change F")

risultato_t_test <- t.test(dati_sesso_M2$`Proximity Change M`, dati_sesso_F2$`Proximity Change F`)
View(risultato_t_test)

## utilizzo il test di Student; p-value = 0.744, quindi non rigetto l'ipotesi nulla                      
## La proximity non dipende dal sesso!




### Procedo a verificare se esistono differenze significative riguardo al cambiamento dell'affiliative contact (rappresentato 
# dalla var ContactChange) e della proximity (var ProximityChange) rispetto alle classi di età degli altri individui del gruppo

# CONTACT CHANGE



### Il primo passaggio è osservare i dati graficamente 


ggplot(data = data_princ, aes(x = ContactChange)) +               ## Utilizzo un istogramma per visualizzare la var ContactChange
  geom_histogram(fill = "blue", color = "black") +
  labs(x = "ContactChange", y = "Frequenza", title = " Affiliative Contact") 
 

shapiro.test(data_princ$ContactChange)               ## W = 0.6189, p-value < 2.2e-16; la distribuzione non è normale

ggplot(data_princ, aes(x = Cat, y = ContactChange)) +                  ## Utilizzo geom_boxplot per creare boxplot  
                                                                        # per le diverse classi di età
       geom_boxplot() +
       labs(x = "Classe di età", y = "ContactChange", title = "Boxplot per le classi di età")

## Dai boxplot si può osservare come per la variabile ContactChange le mediane siano simili e tutte prossime allo zero, con la presenza 
# di numerosi outliers. L'unico boxplot che presenta una distribuzione più chiara è quello della categoria DSB (maschio dominante), 
# dove sono presenti solo 5 outliers sopra il limite superiore, ed in generale, rispetto alle altre categorie, sembra esserci un 
# aumento del contatto affiliativo.

### Prima di effettuare l'ANOVA verifico l'omogeneità delle varianze (uno dei suoi assunti) tra i diversi gruppi (Classi di 
#   età, rappresentate dalla var Cat)

install.packages("car")
library(car)
leveneTest(ContactChange ~ Cat, data = data_princ)       ## Utilizzo il test di Levene (tramite il pacchetto car e la funzione 
                                                          # leveneTest) per verificare l'omogeneità delle varianze

### F-value del test di Levene è 9.2425, mentre il p-value è 5.347e-11 ***, da cui deduco che esistono differenze significative nelle 
# varianze tra i gruppi; per cui non posso utilizzare l'ANOVA, ma dovrò utilizzare un'alternativa non parametrica

install.packages("dunn.test")
library(dunn.test)
dunn.test(data_princ$ContactChange, data_princ$Cat, method = "bonferroni", list = T)   ## verifico quali gruppi sono   
                                                                                       #  differenti tramite il test di Dunn
 

### Nel test di Dunn, i risultati sono basati sulla valutazione degli z-score e dei valori p corrispondenti alle coppie di confronto. 
#   Considerando un livello di significatività alpha di 0.05, è possibile determinare quali coppie di gruppi sono significativamente diverse 
#   confrontando i valori p con alpha/2 (0.025). In questo caso, le coppie di gruppi significativamente diverse sono:

# BB e DSB (z-score è -3.030455, con un valore p di 0.0342 *)
# DSB e INF (z-score è 2.980812, con un valore p di 0.0402 *)
# SAF e SAM (z-score è 3.431443, con un valore p di 0.0084 *)

### Includo una nuova variabile che indica la parentela degli orfani(tutti i fratelli e sorelle di diverse classi di età,   
  # indicati dalla var Sibling) e li confronto con gli altri individui non imparentati
   

            ## Creo dei nuovi boxplot mettendo a confronto individui imparentati e non imparentati per ogni
            #  classe di età, aggiungendo alla funzione aes "fill = factor()", che in questo caso consente di
            #  discriminare i boxplot in base al valore della var Sibling, che può essere 0 (non fratelli) 
            #  oppure 1 (fratelli)

   ggplot(data_princ, aes(x = Cat, y = ContactChange, fill = factor(Sibling))) +
     geom_boxplot() +
     labs(x = "Classe di età", y = "ContactChange") +
     scale_fill_discrete(name = "Presenza/Assenza\n di Parentela", labels = c("Maternal Sibling 0", "Maternal Sibling 1"))
   
   ## Per quanto riguarda le differenze legate alla parentela, il contatto affiliativo non sembra essere aumentato nei fratelli 
   # rispetto ai non fratelli per la maggior parte delle categorie. Le uniche che mostrano una differenza più marcata sono SAF 
   # (femmina subadulta) e SB (maschio silverback subordinato), con un aumento dei contatti affiliativi verso i fratelli orfani più 
   # piccoli. La categoria DSB mostra comunque un aumento dei contatti affiliativi come osservato precedentemente, ma ciò non dipende 
   # dalla parentela (ovvero si occupano di tutti gli orfani indistintamente se siano imparentati o meno).
  
   dati_parentela_cc <- data_princ[data_princ$Sibling == 1, ]               ## Effettuo un nuovo test di Dunn prendendo in 
                                                                             # considerazione solo i fratelli e le sorelle
   
    dunn.test(dati_parentela_cc$ContactChange, dati_parentela_cc$Cat, method = "bonferroni", list = T) # nessun gruppo è risultato essere significativamente diverso

### Riproduco un'analisi analoga per la Proximity

#PROXIMITY CHANGE

ggplot(data = data_princ, aes(x = ProximityChange)) +           ## Utilizzo un istogramma per visualizzare la var ProximityChange
      geom_histogram(fill = "blue", color = "black") +
      labs(x = "Proximity Change", y = "Frequenza", title = "Proximity") 
      

shapiro.test(data_princ$ProximityChange)    ## W = 0.89592, p-value < 2.2e-16; la distribuzione non è normale

 ggplot(data_princ, aes(x = Cat, y = ProximityChange)) +   
           geom_boxplot() +
           labs(x = "Classe di età", y = "ProximityChange", title = "Boxplot per le classi di età")
 ## Nel caso della proximity non sembrano esserci differenze significative tra le diverse categorie.
install.packages("car")
 library(car)
    leveneTest(ProximityChange ~ Cat, data = data_princ)
    

    dunn.test(data_princ$ProximityChange, data_princ$Cat, method = "bonferroni", list = T)
    ## per la proximity sono risultati significativamente differenti i gruppi:
    #  BB - INF  : -3.337493 (0.0118)*
    #  BB - JUV  : -3.884303 (0.0014)*
    #  JUV - SB  :  3.685832 (0.0032)*
 
      
    
    ggplot(data_princ, aes(x = Cat, y = ProximityChange, fill = factor(Sibling))) +
      geom_boxplot() +
      labs(x = "Classe di età", y = "ProximityChange") +
      scale_fill_discrete(name = "Presenza/Assenza\n di Parentela", labels = c("Maternal Sibling 0", "Maternal Sibling 1"))
    
    ## Anche in questo caso per la maggior parte delle categorie non si notano differenze significative legate alla parentela. 
    # Per le categorie JUV, SAF e SAM è difficile verificare in modo appropriato le eventuali differenze nelle relazioni legate alla 
    # parentela, in quanto per JUV è presente un'unica osservazione per i fratelli, mentre per SAF e SAM ne sono presenti soltanto 2. 
    # Per la classe INF sembra esserci un leggero aumento nelle relazioni rispetto ai fratelli, mentre per la categoria SB sembra 
    # avvenire il contrario. 
    
    dati_parentela_pc <- data_princ[data_princ$Sibling == 1, ]
    dunn.test(dati_parentela_pc$ContactChange, dati_parentela_pc$Cat, method = "bonferroni", list = T) # nessun gruppo significativamente diverso
    
### Includo nell'analisi la variabile Age-mate, sostituendola a Sibling, per verificare come si comportano le variabili 
  # ContactChange e ProximityChange a seconda che Age-Mate (che indica individui che hanno un'età non maggiore di 2 anni 
  # rispetto agli orfani) sia 1 o 0 
  
# CONTACT CHANGE
    
     ggplot(data_princ, aes(x = Cat, y = ContactChange, fill = factor(AgeMate))) +
       geom_boxplot() +
       labs(x = "Classe di età", y = "ContactChange") +
       scale_fill_discrete(name = "Compagni di età", labels = c("Non AgeMate 0", "AgeMate 1"))
     
  ## Per i compagni d'età, dove presenti, non sembrano esserci differenze significative rispetto agli altri membri del gruppo. 
  # La categoria DSB continua a mostrare l'aumento maggiore della ContactChange indipendentemente dalla parentela (visto in precedenza) e dall'età.
    
    dati_agemate_cc <- data_princ[data_princ$AgeMate == 1, ]
       dunn.test(dati_agemate_cc$ContactChange, dati_agemate_cc$Cat, method = "bonferroni", list = T) # nessun gruppo significativamente diverso
    
# PROXIMITY CHANGE
      
        ggplot(data_princ, aes(x = Cat, y = ProximityChange, fill = factor(AgeMate))) +
         geom_boxplot() +
         labs(x = "Classe di età", y = "ProximityChange") +
         scale_fill_discrete(name = "Compagni di età", labels = c("Non AgeMate 0", "AgeMate 1"))
       
         ## Per la variabile Proximity sembra esserci un leggero aumento tra gli AgeMate (dove presenti), specialmente per la 
        #  classe INF, rispetto agli individui di età molto maggiore o molto minore rispetto all'orfano (Non AgeMate)
       
       dati_agemate_pc <- data_princ[data_princ$AgeMate == 1, ]
         dunn.test(dati_agemate_pc$ContactChange, dati_agemate_pc$Cat, method = "bonferroni", list = T) # nessun gruppo significativamente diverso
    