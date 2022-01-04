# Fitting Support Vector Classifier on Orange Juice Dataset
## Dataset 

### Description:
The data contains 1070 purchases where the customer either purchased Citrus Hill or Minute Maid Orange Juice. A number of characteristics of the customer and product are recorded.

### Format:
A data frame with 1070 observations on the following 18 variables.

Purchase: 
A factor with levels CH and MM indicating whether the customer purchased Citrus Hill or Minute Maid Orange Juice

WeekofPurchase: 
Week of purchase

StoreID: 
Store ID

PriceCH: 
Price charged for CH

PriceMM: 
Price charged for MM

DiscCH: 
Discount offered for CH

DiscMM: 
Discount offered for MM

SpecialCH: 
Indicator of special on CH

SpecialMM: 
Indicator of special on MM

LoyalCH: 
Customer brand loyalty for CH

SalePriceMM: 
Sale price for MM

SalePriceCH: 
Sale price for CH

PriceDiff: 
Sale price of MM less sale price of CH

Store7: 
A factor with levels No and Yes indicating whether the sale is at Store 7

PctDiscMM:
Percentage discount for MM

PctDiscCH:
Percentage discount for CH

ListPriceDiff:
List price of MM less list price of CH

STORE:
Which of 5 possible stores the sale occured at.

## Libraries:
-- ISLR <br/>
-- corrplot <br/>
-- MASS <br/>
-- klaR <br/>
-- leaps <br/>
-- lattice <br/>
-- ggplot2 <br/>
-- corrplot <br/>
-- car <br/>
-- caret <br/>
-- class <br/>
-- e1071 <br/>

## Support Vector Machine:
Support vectors are data points that are closer to the hyperplane and influence the position and orientation of the hyperplane. Using these support vectors, we maximize the margin of the classifier.

Support Vector classifier to the training data using “cost” = 0.01: Support vector classifier creates 435 support vectors out of 800 training points.
Out of these, 216 belong to level MM and remaining 219 belong to level CH.

#### Test Error:
I get the testing error of linear support vector machine classifier to be 17.7%

### Tuning the classifier to find the optimal cost values.
For this i considered value cost value from 0.01 to 0.10.

The best optimal cost is 1.778279.

## Support Vector Machine (Radial Kernel):
When we need to do some nonlinear transformations on the features Xi which transforms them into a higher dimensional space we can generate non-linear decision boundaries with
the help of radial kernel.

Support Vector classifier with radial kernel to the training data using “cost” = 0.01:  Support vector classifier with radial kernel creates 634 support vectors out of 800
training points. Out of these, 315 belong to level MM and remaining 319 belong to level CH.

#### Test Error:
I get the testing error of linear support vector machine classifier with radial kernel to be 37.77778%

### Tuning the classifier to find the optimal cost values.
For this i considered value cost value from 0.01 to 0.10.

The best optimal cost is  0.5623413.

## Support Vector Machine (Polynomial Kernel):
Support Vector classifier with Polynomial kernel of degree = 2 to the training data using “cost” = 0.01: Support vector classifier of polynomial kernel of degree = 2 creates 333 support vectors out of 800 training points. Out of these, 167 belong to level MM and remaining 166 belong to level CH.

#### Test Error: 
I get the testing error of linear support vector machine classifier with polynomial kernel cost to be 15.92593%

### Tuning the classifier to find the optimal cost values.
For this i considered value cost value from 0.01 to 0.10.

The best optimal cost is  10.





 



