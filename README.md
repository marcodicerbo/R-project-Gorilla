# R-project-Gorilla
INTRODUCTION  
  
This project builds on the scientific paper "Social groups buffer maternal loss in mountain gorillas," using a smaller dataset and simplified analyses compared to those reported in the original paper. Mountain gorilla orphans remain in stable, cohesive social groups, strengthening relationships after maternal loss.
Most mammals are entirely dependent on their mothers after birth, providing them with nourishment, thermoregulation, and protection. Maternal loss at a young age has dramatic consequences for survival. Furthermore, when orphaned individuals reach adulthood, they often suffer negative effects, such as reduced reproductive success or lower social status, as, in some species (especially social species with slow life histories), mothers continue to provide benefits to their co-resident offspring. In humans, if a child loses its mother, relatives, friends, and the wider community may take over. This doesn't tend to happen in nature. Even our closest relatives, chimpanzees, are much less likely to survive if their mothers die before they reach adolescence. 
While orphan survival is not the norm for mammals, humans may not be entirely unique.
Mountain gorillas (Gorilla beringei beringei Matschie, 1914, one of two subspecies of the eastern gorilla) generally live in stable family groups, usually with a dominant male and one or more females who care for their offspring for 8 to 15 years.
This study explored the possibility that gorillas provide community support to orphans, which could cushion the costs of maternal loss, much as occurs in humans.
It is possible that the tendency to care for young orphans has its origins in our evolutionary past. Understanding this more deeply could provide clues to the social mechanisms that help overcome early life adversities and positively impact future health and survival.  
<img width="200" height="320" alt="image" src="https://github.com/user-attachments/assets/f8a677b5-62bf-4cec-ad3e-80684ba3ea06" />

The article hypothesized that gorillas may face greater fitness costs if they experience maternal loss at an early age, and that males may face greater costs from maternal loss than females due to their longer periods of mother-offspring co-residence (approximately 7 years longer for gorillas that disperse). Alternatively, cohesive and stable social groups of mountain gorillas may allow group members to socially buffer the social costs of maternal loss. In particular, dominant males may play crucial roles in buffering the social adversities faced by maternal orphans, as past research has demonstrated the strong bond between dominant males and young orphans.

My research, scaled down from the article in terms of both questions and analyses, focused on four main points:
1. To analyze whether there were differences in two different variables (ContactChange and ProximityChange, explained below) related to the sex of the orphans.
2. Analyze any differences, with respect to the same variables, among other individuals in the group related to social rank and age.
3. Verify whether there was a correlation between the variables and the kinship between orphans and other individuals in the group.
4. Verify whether there was a correlation between the variables and the orphans' agemates, that is, other individuals in the group with a comparable age to the orphans (within 2 years of age difference).

DATASET DESCRIPTION (metadata)  
  
Focal data, collected daily from each group, were used to construct social networks based on (a) affiliative contact (resting, play, or feeding in close contact, and grooming, but excluding physical aggression) and (b) 2-meter proximity, for the 6 months preceding an incident of maternal loss and the 6 months immediately following it.
The main dataset consisted of n = 755 observations, each representing an individual from different gorilla groups. Each observation was based on the relationship between the orphan(s) from each group and the individuals belonging to the same group. The relationship was observed based on the Contact Change variable (a) and the Proximity Change variable (b). Additionally, for points 3 and 4, two columns with binary values ​​0 and 1 were considered: one representing the "Sibling" variable, indicating the presence or absence of kinship, and the other representing the "Age-mate" variable, indicating the orphan's age-mate companions.
For point 1, instead of the main dataset, two additional datasets were used, each related to one of the two relationship variables (a and b). Both datasets had n = 31 observations (15 males and 16 females). Each observation was the average of the observations from the main dataset for each orphan, allowing for the variables to be discriminated solely by sex, as there were multiple observations for each orphan.

For points 2, 3, and 4, individuals in the groups were classified into different categories based on social rank, sex, and age.
The 8 categories identified are:
- DSB (dominant silverback male)
- SB (subordinate silverback male)
- AF (adult female)
- BB (blackback male)
- SAM (subadult male)
- SAF (subadult female)
- JUV (juvenile)
- INF (newborn)
  
DISCUSSION AND CONCLUSION  
For point 1, it can be stated that the ContactChange and ProximityChange variables do not significantly depend on the orphan's sex.
For point 2, the greatest increases in relational strength, particularly for ContactChange, after maternal loss were found with the dominant male of the group, regardless of whether he was the genetic father or not, as also observed for point 3. Furthermore, the most evident differences in ContactChange, related to kinship, were found for the SAF (subadult female) and SB (subordinate male silverback) categories, with an increase in affiliative contact with younger orphaned siblings compared to non-siblings. For Proximity (point 4), a slight overall increase can be observed for AgeMate, particularly for the INF (infants) category.
In conclusion, social support provided by other group members within cohesive mountain gorilla social groups, particularly dominant males, certain siblings, and close-in-age members, appears to buffer the negative consequences of maternal loss. 
  
Reference  
Robin E Morrison, Winnie Eckardt, Fernando Colchero, Veronica Vecellio, Tara S. Stoinski (2021).  Social groups buffer maternal loss in mountain gorillas. eLife https://doi.org/10.7554/eLife.62939
