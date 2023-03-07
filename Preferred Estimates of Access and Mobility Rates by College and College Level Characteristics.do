*********************************************************************************************************************************** 
* Preferred Estimates of Access and Mobility Rates by College and College Level Characteristics
***********************************************************************************************************************************
*Open Master dataset in Stata
use "C:\Users\22031\Desktop\Econometrics do files\Task 1\College Level Characteristics.dta"
**Describe datasets using describe command***
 describe
*Check if Insitution OPEID is uniquely indentify in both datasets: Thus both are uniquely identify in both datasets
isid super_opeid
*Drop duplicates for name using the master dataset to make it uniquely identify
duplicates drop name, force
* Merge the two datasets  on Insitution OPEID, only keeping colleges that are present in both datasets
merge 1:1  super_opeid name using "C:\Users\22031\Desktop\Econometrics do files\Task 1\Preferred Estimates of Access and Mobility Rates by College.dta"

*******************************************************************************************************
                   *Univariate regressions using College Characteristic
*******************************************************************************************************
*outreg command is used to tranfer regression tables from Stata to word
//Mobility rate on instrucional expenditure  per student
reg mr_kq5_pq1 exp_instr_pc_2013 [iw=count]
outreg2 using myreg.doc, replace ctitle(Model 1) label
//Mobility Rate on Percentage of students Graduating within 150% of normal time in 2013
reg mr_kq5_pq1 grad_rate_150_p_2013 [iw=count]
outreg2 using myreg.doc, append  ctitle(Model 2) label
//Mobility Rate on Average faculty salary in 2013
reg mr_kq5_pq1 avgfacsal_2013  [iw=count]
outreg2 using myreg.doc, append  ctitle(Model 3) label
// Mobility Rate on Average SAT scores in 2013
reg mr_kq5_pq1 sat_avg_2013  [iw=count]
outreg2 using myreg.doc, append ctitle(Model 4) label
//Mobility Rate on Rejection Rate
reg mr_kq5_pq1 scorecard_rej_rate_2013 [iw=count]
outreg2 using myreg.doc, append  ctitle(Model 5) label
//Mobility Rate on Endowment Assets per student in 2000
reg mr_kq5_pq1 endowment_pc_2000  [iw=count]
outreg2 using myreg.doc, append  ctitle(Model 6) label
//Mobility Rate on Arts and Humanities major share in 2000
reg mr_kq5_pq1 pct_arthuman_2000 [iw=count]
outreg2 using myreg.doc, append  ctitle(Model 7) label
//Mobility Rate on 	Business Major Share in 2000
reg mr_kq5_pq1 pct_business_2000 [iw=count]
outreg2 using myreg.doc, append ctitle(Model 8) label
// Mobility Rate on STEM major Share in 2000
reg mr_kq5_pq1 pct_stem_2000  [iw=count]
outreg2 using myreg.doc, append ctitle(Model 9) label
//Mobility Rate on Social Sciences major share in 2000
reg mr_kq5_pq1 pct_socialscience_2000  [iw=count]
outreg2 using myreg.doc, append ctitle(Model 10) label

*****Bonferroni test for adjustment of p-values*****


// Run a regression of Mobilty on all of the independent variables in our study
reg mr_kq5_pq1 exp_instr_pc_2013 grad_rate_150_p_2013 avgfacsal_2013 sat_avg_2013  scorecard_rej_rate_2013 endowment_pc_2000 pct_arthuman_2000 pct_business_2000 pct_stem_2000 pct_socialscience_2000 

//Perform test to determine the Bonferroni adjusted P-values 
test exp_instr_pc_2013 grad_rate_150_p_2013 avgfacsal_2013 sat_avg_2013  scorecard_rej_rate_2013 endowment_pc_2000 pct_arthuman_2000 pct_business_2000 pct_stem_2000 pct_socialscience_2000, mtest(b)