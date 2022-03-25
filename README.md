# AirBnB, the new student hustle?
![Ontwerp zonder titel](https://user-images.githubusercontent.com/98810281/160016819-f0e427ff-1592-42be-9f70-e29ee614af09.png)


In which European city is renting out your private room on Airbnb most attractive?

## Motivation
Nowadays, everything is getting more and more expensive. This phenomenon can be explained by price inflation, which means that prices of goods and services go up in a given period. In the European Union, the inflation rate increased from 1.2% in January 2021 to 5.3% in December 2021 (Eurostat, 2022). Especially the prices of food, gas, and housing went up. Housing had to deal with the most significant rent increase in six years, which caused problems for many people, such as falling behind on their rent and increasing debts (CBS, 2020). Mainly students are struck because students cannot earn much money due to their study load. Most students only have a modest side job to finance their studies, life, and student accommodation. Therefore, the rising prices are a severe problem. It is allowed for students to sublet their student rooms if it does not violate the tenancy agreement (Rijksoverheid, 2022). Therefore, students can earn money to rent out their student room during periods their room is not occupied. 

Airbnb is one of the most popular online marketplaces for renting and leasing accommodation for the night. Most hosts use this platform to earn extra income on their most significant asset, their home. On the one hand, it is possible to rent out entire apartments, but on the other hand, it is also possible to rent out shared or private rooms. Airbnb has been taking the world by storm since 2008, with 4 million hosts and 1 billion guest arrivals worldwide ever since (Guttentag, 2015). Therefore, Airbnb might offer students the opportunity to earn money by subletting their private room to others. 

Furthermore, students have the opportunity to start their studies in a city or country of their choice. There are differences in terms of cost of livings between cities. It is interesting to investigate whether students can benefit more from renting out their room in one city than in another. Therefore, this research investigates different European cities to help and advise students. Hence, the following research question is defined:

**In which European city is renting out a private room on Airbnb most attractive?**

In this research, it is expected that renting out a student room is an opportunity to generate some extra income. However, as cities in Europe differ from each other for example in terms of cost of living, it is expected that there are also differences in terms of coverage, satisfaction and estimated income for private rooms between European cities. Therefore, it is important to examine these differences between European cities. This research examines the differences between the top 10 student cities in Europe; London, Munich, Berlin, Paris, Zurich, Vienna, Edinburgh, Barcelona, Dublin and Manchester. 



------




## Method and results
In order to find out which city is most attractive to rent out your room, several analyses were done. In this research, attractiveness is represented by review scores. It is expected that reviews are influenced by the variables 'price', 'availability' and 'short stays'. Therefore, these variables are further analyzed. 

A linear regression was performed to examine the relationship between different independent variables ‘price’, ‘availability’ and ‘short stays’ and the dependent variable ‘review score’. The output of the linear regression can be found in table below. 

![image](https://user-images.githubusercontent.com/26276634/159989283-2d6b6517-96a7-41fa-8f2f-0e8e57615d64.png)

*Table 1*

The results of the linear regression showed that the variables price and availability have a significant influence on the review of the listing. The regression coefficient of price shows that price has a positive influence on reviews per listing, indicating that if the price increases the review score per listing also significantly increases. This makes sense as generally, the higher the price, the higher the ‘quality’ of the room. Therefore, if the price for a listing increases, the higher the review score as this generally reflects the quality of the stay.  

Regarding availability, the regression coefficient tells us that if the availability per listing increases, the reviews per listing significantly decreases. A reason for this could be that if a room is booked more often because it is more available, its furniture is used more often, which might negatively influence its condition. This might have a negative influence on the review per listing. 

Furthermore, the results showed that short stay does not have a significant impact on review scores. Therefore, no conclusions can be made. Additionally, all the student cities significantly influences the review scores. The relations described above are visually represented in the plots in Figure 1.

![image](https://user-images.githubusercontent.com/26276634/159989437-226d0bee-0591-45e2-8fda-7c10589ec76c.png)

*Figure 1*

*R-squared*
Worthwhile to mention is that it can be stated that the model poorly explained the variation as the coefficient of determination is close to 0 (R2 = .088). This means that the independent variables explains only 8.8% of the variance in review score per listing. 

To find out which city is most attractive, further analysis and calculations are needed. First the mean price and mean availability are needed. Together with the coefficients in Table 1, the reviews per student city can be calculated. This results in the following formula:

*Intercept + (price * mean price per city) + (availability * mean availability per city) + coefficient short stay + coefficient per city*

The intercept coefficient in Table 1 represents Barcelona. Based on the above mentioned formula, the review score per student city can be calculated. The results per city can be found in Table 2. The table shows that Edinburgh has the highest score. Based on this score, it can be stated that Edinburgh is the most attractive student city to rent out your room. 

![image](https://user-images.githubusercontent.com/26276634/159989673-0446c53d-dcb0-4c4f-8c18-5aefd321785f.png)

*Table 2*

To conclude, based on the data of Airbnb, it can be stated that it is most attractive to rent out your private room on Airbnb in Edinburgh. 

**Please note that more detailed information about the analyses and calculations can be found in the paper and R Markdown, which can be found in the folder of this repository.**

## Repository overview
This project contains the following files and folders:

- data > this folder contains all our raw data files which we found on [this link](http://insideairbnb.com/). 
- gen > this file shows the input and output of our code. This is also a place where we store our temporary data, which is not relevant to the final results. 
- src > this is called the source file. It contains the different elements of our code. Here you could find the analysis that was made and the data preparations. Also, the final paper is in this folder.
- README.md > this file are you currently reading

## Running instructions

**Needed software:**
- [Make](https://tilburgsciencehub.com/building-blocks/configure-your-computer/automation-and-workflows/make/) 
- [R and Rstudio](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/r/)
- [Pandoc](https://pandoc.org/installing.html) version 1.12.1502 or higher required

**Running code:**
- Copye the repository code
- Open the terminal
- Run: git clone _paste repository code_
- Run: cd student-hustle
- Run: make

Make will generated different files which can be find in:
student-hustle/gen/analysis/output



## More resources
We found some more interesting resources about renting out your student room:

More information about the legal part of renting out your student room in [this link](https://www.slimmecentenvoorstudenten.nl/je-studentenkamer-verhuren-via-airbnb-dit-zijn-de-regels/) and [this link](https://www.kamer.nl/blog/studentenkamer-op-airbnb-regels/)

Some tips on renting out your student room in [this link](https://financialpanther.com/making-money-airbnb-rent-guest-room/)


## About 
This project is conducted by 5 ambitious Marketing Analytics students; Henk-Jan Klijsen, Marije  Kok, Max van der Meulen, Romée Hoeks and Thomas Hemrica for the course Data preparation. During this project, the learned skills will be put in practice to find out in which European city it is most attractive to rent out your student room. 

