library(readxl)
data_sex_pc <- read_excel("C:/Users/Windows/Desktop/data_sex_pc.xlsx")
View(data_sex_pc)
my_data2 <- head(data_sex_pc, n = nrow(data_sex_pc) - 1)
names(data_sex_pc) = c("Sesso", "ProximityChange")
names(my_data2) = c("Sesso", "ProximityChange")
boxplot(ProximityChange ~ Sesso, 
        data = data_sex_pc[data_sex_pc$Sesso == "F"|data_sex_pc$Sesso == "M",])
dati_sesso_M2 <- subset(my_data2, Sesso == "M")
dati_sesso_F2 <- subset(my_data2, Sesso == "F")
names(dati_sesso_M2) = c("Maschi", "Media Proximity Change M")
names(dati_sesso_F2) = c("Femmine", "Media Proximity Change F")
risultato_t.test2 <- t.test(dati_sesso_F2$`Media Proximity Change F`, dati_sesso_M2$`Media Proximity Change M`)
p_value_pc<- risultato_t.test2$p.value
View(p_value_pc) # p-value = 0.744 non rigetto l'ipotesi nulla, quindi la proximity change non dipende dal sesso