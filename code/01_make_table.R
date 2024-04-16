install.packages('pacman')
library(pacman)
p_load(tidyverse, rio, here, labelled,
       summarytools, gt, gtsummary, Hmisc)
df <- import('dataset/diabetes.csv')

# Creating table 1 separated by diabetes status
pima_table1 <- df |>
  mutate(OutcomeStatus=case_when(Outcome==0~'Not Diabetic',
                                 TRUE~'Diabetic' ))|>
  tbl_summary(by='OutcomeStatus',
              statistic = all_continuous()~'{mean} ({sd})',
              label = list(BloodPressure ~ 'Blood Pressure (mm Hg)', 
                           SkinThickness ~ 'Skin Thickness (mm)',
                           Insulin ~ 'Insulin (Units/ml)',
                           Age ~ 'Age (yrs)',
                           Glucose ~ 'Plasma Glucose Concentration'),
              include = !Outcome)
saveRDS(pima_table1,
        file=here::here('output/pima_table1.rds'))

        