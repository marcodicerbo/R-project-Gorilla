library(readxl)
data_sex_cc <- read_excel("C:/Users/Windows/Desktop/data__sex_cc.xlsx")
View(data_sex_cc)
my_data <- head(data_sex_cc, n = nrow(data_sex_cc) - 3)
names(data_sex_cc) = c("Sesso", "ContactChange")
names(my_data) = c("Sesso", "ContactChange")
boxplot(ContactChange ~ Sesso, 
        data = data_sex_cc[data_sex_cc$Sesso == "F"|data_sex_cc$Sesso == "M",])
dati_sesso_M <- subset(my_data, Sesso == "M")
dati_sesso_F <- subset(my_data, Sesso == "F")
names(dati_sesso_M) = c("Maschi", "Media Contact Change M")
names(dati_sesso_F) = c("Femmine", "Media Contact Change F")
risultato_t.test <- t.test(dati_sesso_F$`Media Contact Change F`, dati_sesso_M$`Media Contact Change M`)
p_value_cc<- risultato_t.test$p.value
View(p_value_cc) # p-value = 0.545 non rigetto l'ipotesi nulla, quindi il contact change non dipende dal sesso
 
