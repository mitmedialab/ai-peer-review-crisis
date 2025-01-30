
clear
cd "/Users/nattavudhpowdthavee/Library/CloudStorage/Dropbox/AI journal project/Data/Final data/" 

 import excel final_final_combined_data.xlsx, sheet("final_final_combined_data") firstrow

 **Clean data
 encode name_category, gen(name_cat_n)
 encode institution, gen(institute_n)
 encode gender, gen(gender_n)
 encode pub_quality, gen(pubqual)
 gen lgcitation = log(citation_impact_mean)
 encode author, gen(author_n)
 
 gen  top5_accept_mean_n = (top5_accept_1 + top5_accept_2 + top5_accept_3)/3
 gen nobel_potential_mean_n = (nobel_potential_1 + nobel_potential_2 + nobel_potential_3)/3

 
gen reordered_name_category = .
replace reordered_name_category = 1 if name_category == "Bottom"
replace reordered_name_category = 2 if name_category == "Top"
replace reordered_name_category = 3 if name_category == "Random"
replace reordered_name_category = 4 if name_category == "Retracted Name"

* Define labels for the reordered variable
label define name_category_labels 1 "Bottom" ///
                                  2 "Top" ///
                                  3 "Random" ///
                                  4 "Blind"
								  
* Apply the labels to the new variable
label values reordered_name_category name_category_labels 
label var reordered_name_category "Name of authors"


gen reordered_institute = .
replace reordered_institute = 1 if institute_n == 6 // Retracted Institution
replace reordered_institute = 2 if institute_n == 2 // Harvard University
replace reordered_institute = 3 if institute_n == 4 // Massachusetts Institute of Technology
replace reordered_institute = 4 if institute_n == 3 // London School of Economics
replace reordered_institute = 5 if institute_n == 10 // University of Warwick
replace reordered_institute = 6 if institute_n == 5 // Nanyang Technological University
replace reordered_institute = 7 if institute_n == 9 // University of Tokyo
replace reordered_institute = 8 if institute_n == 7 // Universiti Malaya
replace reordered_institute = 9 if institute_n == 1 // Chulalongkorn University
replace reordered_institute = 10 if institute_n == 8 // University of Cape Town

* Define the labels for the reordered values
label define institute_labels 1 "Retracted Institution" ///
                              2 "Harvard University" ///
                              3 "Massachusetts Institute of Technology" ///
                              4 "London School of Economics" ///
                              5 "University of Warwick" ///
                              6 "Nanyang Technological University" ///
                              7 "University of Tokyo" ///
                              8 "Universiti Malaya" ///
                              9 "Chulalongkorn University" ///
                              10 "University of Cape Town"

* Apply the labels to the variable
label values reordered_institute institute_labels

label var reordered_institute "Affiliation"

gen reordered_pub_quality = .
replace reordered_pub_quality = 1 if pub_quality == "Low"
replace reordered_pub_quality = 2 if pub_quality == "Medium"
replace reordered_pub_quality = 3 if pub_quality == "High"
replace reordered_pub_quality = 4 if pub_quality == "Fake AI Paper"

* Define labels for the reordered variable
label define pub_quality_labels 1 "Low" ///
                               2 "Medium" ///
                               3 "High" ///
                               4 "Fake AI Paper"

* Apply the labels to the new variable
label values reordered_pub_quality pub_quality_labels
label var reordered_pub_quality "Publication quality"

gen reordered_gender = .
replace reordered_gender = 1 if gender == "male"
replace reordered_gender = 2 if gender == "female"
replace reordered_gender = 3 if gender == "Retracted Name"

* Define labels for the reordered variable
label define gender_labels 1 "male" ///
                          2 "female" ///
                          3 "Retracted Name"
						  

* Apply the labels to the new variable
label values reordered_gender gender_labels
lab var reordered_gender "Gender"


gen reordered_original_publication = .
replace reordered_original_publication = 1 if original_publication == "Econometrica"
replace reordered_original_publication = 2 if original_publication == "The Quarterly Journal of Economics"
replace reordered_original_publication = 3 if original_publication == "Journal of Political Economy"
replace reordered_original_publication = 4 if original_publication == "European Economic Review"
replace reordered_original_publication = 5 if original_publication == "Economica"
replace reordered_original_publication = 6 if original_publication == "Oxford Bulletin of Economics and Statistics"
replace reordered_original_publication = 7 if original_publication == "Asian Economic and Financial Review (AEFR)"
replace reordered_original_publication = 8 if original_publication == "Journal of Applied Economics and Business"
replace reordered_original_publication = 9 if original_publication == "Business and Economics Journal"
replace reordered_original_publication = 10 if original_publication == "GPT-o1"

* Define labels for the reordered variable
label define original_publication_labels 1 "Econometrica" ///
                                         2 "The Quarterly Journal of Economics" ///
                                         3 "Journal of Political Economy" ///
                                         4 "European Economic Review" ///
                                         5 "Economica" ///
                                         6 "Oxford Bulletin of Economics and Statistics" ///
                                         7 "Asian Economic and Financial Review (AEFR)" ///
                                         8 "Journal of Applied Economics and Business" ///
                                         9 "Business and Economics Journal" ///
                                         10 "GPT-o1" 
										 
* Apply the labels to the new variable
label values reordered_original_publication original_publication_labels
label var reordered_original_publication "Publication source"

gen review_outcome = .
replace review_outcome = 1 if top5_accept_rating_criteria_mean < 2 // Definitely reject
replace review_outcome = 2 if top5_accept_rating_criteria_mean >= 2 & top5_accept_rating_criteria_mean < 3 // Reject with option to resubmit
replace review_outcome = 3 if top5_accept_rating_criteria_mean >= 3 & top5_accept_rating_criteria_mean < 4 // Major revision
replace review_outcome = 4 if top5_accept_rating_criteria_mean >= 4 & top5_accept_rating_criteria_mean < 5 // Minor revision
replace review_outcome = 5 if top5_accept_rating_criteria_mean >= 5 & top5_accept_rating_criteria_mean < 6 // Very minor revision
replace review_outcome = 6 if top5_accept_rating_criteria_mean == 6 // Accept as it is

* Define labels for the review outcomes
label define review_labels 1 "Definitely reject" ///
                           2 "Reject with option to resubmit" ///
                           3 "Major revision" ///
                           4 "Minor revision" ///
                           5 "Very minor revision" ///
                           6 "Accept as it is"

* Apply the labels to the new variable
label values review_outcome review_labels

* Create a new variable for combined categories
gen review_criteria_combined = .

* Combine categories 1 and 2 into category 1
replace review_criteria_combined = 1 if top5_accept_rating_criteria_mean < 3 // Includes "Definitely reject" and "Reject with option to resubmit"

* Combine categories 3 and 4 into category 2
replace review_criteria_combined = 2 if top5_accept_rating_criteria_mean >= 3 & top5_accept_rating_criteria_mean < 5 // Includes "Major revision" and "Minor revision"

* Combine categories 5 and 6 into category 3
replace review_criteria_combined = 3 if top5_accept_rating_criteria_mean >= 5 // Includes "Very minor revision" and "Accept as it is"

* Define labels for the combined review outcomes
label define review_criteria_combined_labels 1 "Reject (1 & 2)" ///
                                             2 "Revision needed (3 & 4)" ///
                                             3 "Accept (5 & 6)"

* Apply the labels to the new variable
label values review_criteria_combined review_criteria_combined_labels

* Apply the original label for publication source
label values reordered_original_publication original_publication_labels
label var reordered_original_publication "Publication source"


gen review_wo_criteria = .
replace review_wo_criteria = 1 if top5_accept_rating_mean < 2 // Definitely reject
replace review_wo_criteria = 2 if top5_accept_rating_mean >= 2 & top5_accept_rating_mean < 3 // Reject with option to resubmit
replace review_wo_criteria = 3 if top5_accept_rating_mean >= 3 & top5_accept_rating_mean < 4 // Major revision
replace review_wo_criteria = 4 if top5_accept_rating_mean >= 4 & top5_accept_rating_mean < 5 // Minor revision
replace review_wo_criteria = 5 if top5_accept_rating_mean >= 5 & top5_accept_rating_mean < 6 // Very minor revision
replace review_wo_criteria = 6 if top5_accept_rating_mean == 6 // Accept as it is

* Define labels for the review outcomes
label define review_wo_criteria_labels 1 "Definitely reject" ///
                                       2 "Reject with option to resubmit" ///
                                       3 "Major revision" ///
                                       4 "Minor revision" ///
                                       5 "Very minor revision" ///
                                       6 "Accept as it is"

* Apply the labels to the new variable
label values review_wo_criteria review_wo_criteria_labels


* Create a new variable for combined categories
gen review_wo_combined = .

* Combine categories 1 and 2 into category 1
replace review_wo_combined = 1 if top5_accept_rating_mean < 3 // Includes "Definitely reject" and "Reject with option to resubmit"

* Combine categories 3 and 4 into category 2
replace review_wo_combined = 2 if top5_accept_rating_mean >= 3 & top5_accept_rating_mean < 5 // Includes "Major revision" and "Minor revision"

* Combine categories 5 and 6 into category 3
replace review_wo_combined = 3 if top5_accept_rating_mean >= 5 // Includes "Very minor revision" and "Accept as it is"

* Define labels for the combined review outcomes
label define review_wo_combined_labels 1 "Reject (1 & 2)" ///
                                       2 "Revision needed (3 & 4)" ///
                                       3 "Accept (5 & 6)"

save journal_discrim.dta, replace
									   
* Apply the labels to the new variable
label values review_wo_combined review_wo_combined_labels


**Correlation matrix

asdocx pwcorr reordered_institute reordered_name_category reordered_gender reordered_pub_quality, save(corr.docx) label replace

*Table 1: Top 5 desk reject + top 5 accept mean 
 
asdocx   reg top5_desk_mean  i.reordered_pub_quality i.reordered_institute  i.reordered_name_category i.reordered_gender    , vce(bootstrap, reps(1000)) replace save(Table1.docx) label  nest  dec(3)

asdocx   reg top5_desk_mean  i.b7.reordered_original_publication i.reordered_institute  i.reordered_name_category i.reordered_gender    , vce(cluster author)append save(Table1.docx) label  nest  dec(3)
 
asdocx   reg top5_accept_mean_n i.reordered_gender  i.reordered_pub_quality i.reordered_institute  i.reordered_name_category   , vce(bootstrap, reps(1000)) append save(Table1.docx) label  nest  dec(3)

asdocx   reg top5_accept_mean_n  i.b7.reordered_original_publication i.reordered_institute  i.reordered_name_category i.reordered_gender     , vce(bootstrap, reps(1000)) append save(Table1.docx) label  nest  dec(3)
 

**Paper fixed effects 
asdocx   areg top5_desk_mean   i.reordered_institute  i.reordered_name_category i.reordered_gender   , absorb(paper_id) vce(bootstrap, reps(1000)) replace save(Table2A_2.docx) label  nest  dec(3) 
 
asdocx   areg top5_accept_mean_n   i.reordered_institute  i.reordered_name_category i.reordered_gender    ,  absorb(paper_id) vce(bootstrap, reps(1000)) append save(Table2A_2.docx) label  nest  dec(3) 

 
**Sub-sample analysis

*By publication quality
*Low quality
asdocx reg top5_accept_mean_n i.reordered_institute  i.reordered_name_category i.reordered_gender  if reordered_pub_quality==1, vce(bootstrap, reps(1000)) replace save(Tabl1A.docx) label  nest  

margins reordered_institute,  noestimcheck saving(inst_low, replace)
margins reordered_name_category,  noestimcheck saving(name_low, replace)
margins reordered_gender,  noestimcheck saving(gender_low, replace)

asdocx reg top5_accept_mean_n i.reordered_institute  i.reordered_name_category i.reordered_gender  if reordered_pub_quality==2, vce(bootstrap, reps(1000)) append save(Tabl1A.docx) label  nest  

margins reordered_institute,  noestimcheck saving(inst_mid, replace)
margins reordered_name_category,  noestimcheck saving(name_mid, replace)
margins reordered_gender,  noestimcheck saving(gender_mid, replace)

asdocx reg top5_accept_mean_n i.reordered_institute  i.reordered_name_category i.reordered_gender  if reordered_pub_quality==3, vce(bootstrap, reps(1000)) append save(Tabl1A.docx) label  nest  

margins reordered_institute,  noestimcheck saving(inst_hi, replace)
margins reordered_name_category,  noestimcheck saving(name_hi, replace)
margins reordered_gender,  noestimcheck saving(gender_hi, replace)


asdocx reg top5_accept_mean_n i.reordered_institute  i.reordered_name_category i.reordered_gender  if reordered_pub_quality==4, vce(bootstrap, reps(1000)) append save(Tabl1A.docx) label  nest  

margins reordered_institute,  noestimcheck saving(inst_fake, replace)
margins reordered_name_category,  noestimcheck saving(name_fake, replace)
margins reordered_gender,  noestimcheck saving(gender_fake, replace)

combomarginsplot inst_low  inst_mid inst_hi inst_fake, /// lists the different models
file1opts(color(blue%50)) fileci1opts(color(blue%50)) file2opts(color(red%50)) fileci2opts(color(red%50)) file3opts(color(green%50)) fileci3opts(color(green%90)) file4opts(color(sand)) fileci4opts(color(sand)) ///
labels("Low-ranked journals" "Med-tier journals" "Top five journals" "Fake AI papers") /// specifies the labels we want in the legend
xlabel(1 "RI" 2 "HU" 3 "MIT" 4 "LSE" 5 "UW" 6 "NT" 7 "UT" 8 "UM" 9 "CU" 10 "UCT", labsize(small))  ///
legend(order(1 "Low-ranked journals" 2 "Med-tier journals" 3 "Top five journals" 4 "Fake AI papers")  size(small) row(1) pos(6)) title("Adjusted prediction of affiliation with 95% CIs", size(small))  
 
graph save "inst_pubqual.gph" , replace
 
combomarginsplot name_low  name_mid name_hi name_fake, /// lists the different models
file1opts(color(blue%50)) fileci1opts(color(blue%50)) file2opts(color(red%50)) fileci2opts(color(red%50)) file3opts(color(green%50)) fileci3opts(color(green%90)) file4opts(color(sand)) fileci4opts(color(sand)) ///
labels("Low" "Medium" "High" "Fake AI") /// specifies the labels we want in the legend
xlabel(1 "Bottom" 2 "Top" 3 "Random" 4 "Blind", labsize(small))  ///
legend(order(1 "Low-ranked journals" 2 "Med-tier journals" 3 "Top five journals" 4 "Fake AI papers")  size(small) row(1) pos(6)) title("Adjusted prediction of author's name with 95% CIs", size(small))

graph save "name_pubqual.gph" , replace
  
combomarginsplot gender_low  gender_mid gender_hi gender_fake, /// lists the different models
file1opts(color(blue%50)) fileci1opts(color(blue%50)) file2opts(color(red%50)) fileci2opts(color(red%50)) file3opts(color(green%50)) fileci3opts(color(green%90)) file4opts(color(sand)) fileci4opts(color(sand)) ///
labels("Low" "Medium" "High" "Fake AI") /// specifies the labels we want in the legend
xlabel(1 "Male" 2 "Female" 3 "Blind", labsize(small))  ///
legend(order(1 "Low-ranked journals" 2 "Med-tier journals" 3 "Top five journals" 4 "Fake AI papers")  size(small) row(1) pos(6)) title("Adjusted prediction of author's gender with 95% CIs", size(small))

graph save "gender_pubqual.gph" , replace   
 
 grc1leg "inst_pubqual.gph" "name_pubqual.gph" "gender_pubqual.gph", leg("inst_pubqual.gph")   pos(6)  row(1) ycommon
	 graph export "Fig2combined.png", replace 
	 

**No low-ranked journals
combomarginsplot   inst_mid inst_hi inst_fake, /// lists the different models
 file1opts(color(red%50)) fileci1opts(color(red%50)) file2opts(color(green%50)) fileci2opts(color(green%90)) file3opts(color(sand)) fileci3opts(color(sand)) ///
labels("Low-ranked journals" "Med-tier journals" "Top five journals" "Fake AI papers") /// specifies the labels we want in the legend
xlabel(1 "RI" 2 "HU" 3 "MIT" 4 "LSE" 5 "UW" 6 "NT" 7 "UT" 8 "UM" 9 "CU" 10 "UCT", labsize(small))  ///
legend(order(1 "Med-tier journals" 2 "Top five journals" 3 "Fake AI papers")  size(small) row(1) pos(6)) title("Adjusted prediction of affiliation with 95% CIs" "(omitting low-ranked papers)", size(small))  
 
graph save "inst_pubqual_nl.gph" , replace
 
combomarginsplot   name_mid name_hi name_fake, /// lists the different models
 file1opts(color(red%50)) fileci1opts(color(red%50)) file2opts(color(green%50)) fileci2opts(color(green%90)) file3opts(color(sand)) fileci3opts(color(sand)) ///
labels("Low" "Medium" "High" "Fake AI") /// specifies the labels we want in the legend
xlabel(1 "Bottom" 2 "Top" 3 "Random" 4 "Blind", labsize(small))  ///
legend(order(1 "Med-tier journals" 2 "Top five journals" 3 "Fake AI papers")  size(small) row(1) pos(6)) title("Adjusted prediction of author's name with 95% CIs" "(omitting low-ranked papers)", size(small))

graph save "name_pubqual_nl.gph" , replace
  
combomarginsplot  gender_mid gender_hi gender_fake, /// lists the different models
 file1opts(color(red%50)) fileci1opts(color(red%50)) file2opts(color(green%50)) fileci2opts(color(green%90)) file3opts(color(sand)) fileci3opts(color(sand)) ///
labels("Low" "Medium" "High" "Fake AI") /// specifies the labels we want in the legend
xlabel(1 "Male" 2 "Female" 3 "Blind", labsize(small))  ///
legend(order(1 "Med-tier journals" 2 "Top five journals" 3 "Fake AI papers")  size(small) row(1) pos(6)) title("Adjusted prediction of author's gender with 95% CIs" "(omitting low-ranked papers)", size(small))

graph save "gender_pubqual_nl.gph" , replace   
 
 grc1leg "inst_pubqual_nl.gph" "name_pubqual_nl.gph" "gender_pubqual_nl.gph", leg("inst_pubqual_nl.gph")   pos(6)  row(1) ycommon
	 graph export "Fig2combined_nl.png", replace 
	 
 grc1leg "inst_pubqual.gph" "name_pubqual.gph" "gender_pubqual.gph" "inst_pubqual_nl.gph" "name_pubqual_nl.gph" "gender_pubqual_nl.gph", leg("inst_pubqual.gph")   pos(6)  row(2)  
	 graph export "Fig2combined_all.png", replace 




 
*Figures 3 and 4: Editor decision 
 
asdocx ologit review_wo_combined i.reordered_pub_quality  i.reordered_institute  i.reordered_name_category i.reordered_gender  , vce(bootstrap, reps(1000)) replace save(Table3A.docx) label  nest  
margins  reordered_pub_quality  ,   noestimcheck    predict(outcome(3))  
marginsplot,     xlabel(1 "Low" 2 "Medium" 3 "High" 4 "Fake AI", labsize(small)) legend(order(1 "Accept/Very minor revision")  size(small)) title("Adjusted prediction of publication quality with 95% CIs", size(medium)) ytitle("Prediction") plotopts(color(red%50)) ciopts(color(red%50))

graph save "Fig3A.gph", replace

margins reordered_institute  ,   noestimcheck   predict(outcome(3))   
marginsplot,     xlabel(1 "RI" 2 "HU" 3 "MIT" 4 "LSE" 5 "UW" 6 "NT" 7 "UT" 8 "UM" 9 "CU" 10 "UCT", labsize(small)) legend(order(1 "Accept/Very minor revision")  size(small)) title("Adjusted prediction of affiliation with 95% CIs", size(medium)) ytitle("Prediction") plotopts(color(red%50)) ciopts(color(red%50))

graph save "Fig3B.gph", replace

margins reordered_name_category,   noestimcheck    predict(outcome(3))   
marginsplot, xlabel(1 "Bottom" 2 "Top" 3 "Random" 4 "Blind", labsize(small)) legend(order(1 "Accept/Very minor revision")  size(small)) title("Adjusted prediction of author's publication record with 95% CIs", size(medium)) ytitle("Prediction") plotopts(color(red%50)) ciopts(color(red%50))

graph save "Fig3C.gph", replace

margins reordered_gender ,   noestimcheck   predict(outcome(3))  
marginsplot, xlabel(1 "Male" 2 "Female" 3 "Blind", labsize(small)) legend(order(1 "Accept/Very minor revision")  size(small)) title("Adjusted prediction of author's gender with 95% CIs", size(medium)) ytitle("Prediction") plotopts(color(red%50)) ciopts(color(red%50))
 
graph save "Fig3D.gph", replace


margins  reordered_pub_quality  ,   noestimcheck   predict(outcome(1))   
marginsplot,     xlabel(1 "Low" 2 "Medium" 3 "High" 4 "Fake AI", labsize(small)) legend(order(1 "Reject/Reject & resubmit" )  size(small)) title("Adjusted prediction of publication quality with 95% CIs", size(medium)) ytitle("Prediction") plotopts(color(blue%50)) ciopts(color(blue%50))

graph save "Fig3E.gph", replace

margins reordered_institute  ,   noestimcheck predict(outcome(1))  
marginsplot,     xlabel(1 "RI" 2 "HU" 3 "MIT" 4 "LSE" 5 "UW" 6 "NT" 7 "UT" 8 "UM" 9 "CU" 10 "UCT", labsize(small)) legend(order(1 "Reject/Reject & Resubmit" )  size(small)) title("Adjusted prediction of affiliation with 95% CIs", size(medium)) ytitle("Prediction") plotopts(color(blue%50)) ciopts(color(blue%50))

graph save "Fig3F.gph", replace

margins reordered_name_category,   noestimcheck  predict(outcome(1))  
marginsplot, xlabel(1 "Bottom" 2 "Top" 3 "Random" 4 "Blind", labsize(small)) legend(order(1 "Reject/Reject & resubmit")  size(small)) title("Adjusted prediction of author's publication record with 95% CIs", size(medium)) ytitle("Prediction") plotopts(color(blue%50)) ciopts(color(blue%50))

graph save "Fig3G.gph", replace

margins reordered_gender ,   noestimcheck predict(outcome(1))  
marginsplot, xlabel(1 "Male" 2 "Female" 3 "Blind", labsize(small)) legend(order(1 "Reject/Reject & resubmit")  size(small)) title("Adjusted prediction of author's gender with 95% CIs", size(medium)) ytitle("Prediction") plotopts(color(blue%50)) ciopts(color(blue%50))
 
graph save "Fig3H.gph", replace


margins  reordered_pub_quality  ,   noestimcheck   predict(outcome(2))   
marginsplot,     xlabel(1 "Low" 2 "Medium" 3 "High" 4 "Fake AI", labsize(small)) legend(order(1 "Major/Minor revision" )  size(small)) title("Adjusted prediction of publication quality with 95% CIs", size(medium)) ytitle("Prediction") plotopts(color(green%50)) ciopts(color(green%50))

graph save "Fig3I.gph", replace

margins reordered_institute  ,   noestimcheck predict(outcome(2))  
marginsplot,     xlabel(1 "RI" 2 "HU" 3 "MIT" 4 "LSE" 5 "UW" 6 "NT" 7 "UT" 8 "UM" 9 "CU" 10 "UCT", labsize(small)) legend(order(1 1 "Major/Minor revision" )  size(small)) title("Adjusted prediction of affiliation with 95% CIs", size(medium)) ytitle("Prediction") plotopts(color(green%50)) ciopts(color(green%50))

graph save "Fig3J.gph", replace

margins reordered_name_category,   noestimcheck  predict(outcome(2))  
marginsplot, xlabel(1 "Bottom" 2 "Top" 3 "Random" 4 "Blind", labsize(small)) legend(order(1 1 "Major/Minor revision")  size(small)) title("Adjusted prediction of author's publication record with 95% CIs", size(medium)) ytitle("Prediction") plotopts(color(green%50)) ciopts(color(green%50))

graph save "Fig3K.gph", replace

margins reordered_gender ,   noestimcheck predict(outcome(2))  
marginsplot, xlabel(1 "Male" 2 "Female" 3 "Blind", labsize(small)) legend(order(1 1 "Major/Minor revision")  size(small)) title("Adjusted prediction of author's gender with 95% CIs", size(medium)) ytitle("Prediction") plotopts(color(green%50)) ciopts(color(green%50))
 
graph save "Fig3L.gph", replace

 
 grc1leg "Fig3A.gph" "Fig3B.gph"  "Fig3C.gph" "Fig3D.gph", pos(6) 
 
 graph export "Fig3combined1.png", replace 
 
  grc1leg "Fig3E.gph" "Fig3F.gph"  "Fig3G.gph" "Fig3H.gph", pos(6) 
  
 graph export "Fig3combined2.png", replace 
 
   grc1leg "Fig3I.gph" "Fig3J.gph"  "Fig3K.gph" "Fig3L.gph", pos(6) 
  
 graph export "Fig3combined3.png", replace 
 
 
asdocx ologit review_criteria_combined i.reordered_pub_quality  i.reordered_institute  i.reordered_name_category i.reordered_gender  , vce(bootstrap, reps(1000)) append save(Table3A.docx) label  nest  

margins  reordered_pub_quality  ,   noestimcheck    predict(outcome(3))  
marginsplot,     xlabel(1 "Low" 2 "Medium" 3 "High" 4 "Fake AI", labsize(small)) legend(order(1 "Accept/Very minor revision")  size(small)) title("Adjusted prediction of publication quality with 95% CIs", size(medium)) ytitle("Prediction") plotopts(color(red%50)) ciopts(color(red%50))

graph save "Fig4A.gph", replace

margins reordered_institute  ,   noestimcheck   predict(outcome(3))   
marginsplot,     xlabel(1 "RI" 2 "HU" 3 "MIT" 4 "LSE" 5 "UW" 6 "NT" 7 "UT" 8 "UM" 9 "CU" 10 "UCT", labsize(small)) legend(order(1 "Accept/Very minor revision")  size(small)) title("Adjusted prediction of affiliation with 95% CIs", size(medium)) ytitle("Prediction") plotopts(color(red%50)) ciopts(color(red%50))

graph save "Fig4B.gph", replace

margins reordered_name_category,   noestimcheck    predict(outcome(3))   
marginsplot, xlabel(1 "Bottom" 2 "Top" 3 "Random" 4 "Blind", labsize(small)) legend(order(1 "Accept/Very minor revision")  size(small)) title("Adjusted prediction of author's publication record with 95% CIs", size(medium)) ytitle("Prediction") plotopts(color(red%50)) ciopts(color(red%50))

graph save "Fig4C.gph", replace

margins reordered_gender ,   noestimcheck   predict(outcome(3))  
marginsplot, xlabel(1 "Male" 2 "Female" 3 "Blind", labsize(small)) legend(order(1 "Accept/Very minor revision")  size(small)) title("Adjusted prediction of author's gender with 95% CIs", size(medium)) ytitle("Prediction") plotopts(color(red%50)) ciopts(color(red%50))
 
graph save "Fig4D.gph", replace


margins  reordered_pub_quality  ,   noestimcheck   predict(outcome(1))   
marginsplot,     xlabel(1 "Low" 2 "Medium" 3 "High" 4 "Fake AI", labsize(small)) legend(order(1 "Reject/Reject & resubmit" )  size(small)) title("Adjusted prediction of publication quality with 95% CIs", size(medium)) ytitle("Prediction") plotopts(color(blue%50)) ciopts(color(blue%50))

graph save "Fig4E.gph", replace

margins reordered_institute  ,   noestimcheck predict(outcome(1))  
marginsplot,     xlabel(1 "RI" 2 "HU" 3 "MIT" 4 "LSE" 5 "UW" 6 "NT" 7 "UT" 8 "UM" 9 "CU" 10 "UCT", labsize(small)) legend(order(1 "Reject/Reject & Resubmit" )  size(small)) title("Adjusted prediction of affiliation with 95% CIs", size(medium)) ytitle("Prediction") plotopts(color(blue%50)) ciopts(color(blue%50))

graph save "Fig4F.gph", replace

margins reordered_name_category,   noestimcheck  predict(outcome(1))  
marginsplot, xlabel(1 "Bottom" 2 "Top" 3 "Random" 4 "Blind", labsize(small)) legend(order(1 "Reject/Reject & resubmit")  size(small)) title("Adjusted prediction of author's publication record with 95% CIs", size(medium)) ytitle("Prediction") plotopts(color(blue%50)) ciopts(color(blue%50))

graph save "Fig4G.gph", replace

margins reordered_gender ,   noestimcheck predict(outcome(1))  
marginsplot, xlabel(1 "Male" 2 "Female" 3 "Blind", labsize(small)) legend(order(1 "Reject/Reject & resubmit")  size(small)) title("Adjusted prediction of author's gender with 95% CIs", size(medium)) ytitle("Prediction") plotopts(color(blue%50)) ciopts(color(blue%50))
 
graph save "Fig4H.gph", replace

margins  reordered_pub_quality  ,   noestimcheck   predict(outcome(2))   
marginsplot,     xlabel(1 "Low" 2 "Medium" 3 "High" 4 "Fake AI", labsize(small)) legend(order(1 "Major/Minor revision" )  size(small)) title("Adjusted prediction of publication quality with 95% CIs", size(medium)) ytitle("Prediction") plotopts(color(green%50)) ciopts(color(green%50))

graph save "Fig4I.gph", replace

margins reordered_institute  ,   noestimcheck predict(outcome(2))  
marginsplot,     xlabel(1 "RI" 2 "HU" 3 "MIT" 4 "LSE" 5 "UW" 6 "NT" 7 "UT" 8 "UM" 9 "CU" 10 "UCT", labsize(small)) legend(order(1 1 "Major/Minor revision" )  size(small)) title("Adjusted prediction of affiliation with 95% CIs", size(medium)) ytitle("Prediction") plotopts(color(green%50)) ciopts(color(green%50))

graph save "Fig4J.gph", replace

margins reordered_name_category,   noestimcheck  predict(outcome(2))  
marginsplot, xlabel(1 "Bottom" 2 "Top" 3 "Random" 4 "Blind", labsize(small)) legend(order(1 1 "Major/Minor revision")  size(small)) title("Adjusted prediction of author's publication record with 95% CIs", size(medium)) ytitle("Prediction") plotopts(color(green%50)) ciopts(color(green%50))

graph save "Fig4K.gph", replace

margins reordered_gender ,   noestimcheck predict(outcome(2))  
marginsplot, xlabel(1 "Male" 2 "Female" 3 "Blind", labsize(small)) legend(order(1 1 "Major/Minor revision")  size(small)) title("Adjusted prediction of author's gender with 95% CIs", size(medium)) ytitle("Prediction") plotopts(color(green%50)) ciopts(color(green%50))
 
graph save "Fig4L.gph", replace

 
 grc1leg "Fig4A.gph" "Fig4B.gph"  "Fig4C.gph" "Fig4D.gph", pos(6) 
 
 graph export "Fig4combined1.png", replace 
 
  grc1leg "Fig4E.gph" "Fig4F.gph"  "Fig4G.gph" "Fig4H.gph", pos(6) 
  
 graph export "Fig4combined2.png", replace 

 
   grc1leg "Fig4I.gph" "Fig4J.gph"  "Fig4K.gph" "Fig4L.gph", pos(6) 
  
 graph export "Fig4combined3.png", replace 
 

**Other outcomes

 
asdocx  reg lgcitation  i.reordered_institute  i.reordered_name_category i.reordered_gender  i.reordered_pub_quality  , vce(bootstrap, reps(1000)) replace save(Table2.docx) label  nest   
 
asdocx  reg grant_mean  i.reordered_institute  i.reordered_name_category i.reordered_gender  i.reordered_pub_quality  , vce(bootstrap, reps(1000)) append save(Table2.docx) label  nest   

asdocx  reg top_conference_mean  i.reordered_institute  i.reordered_name_category i.reordered_gender  i.reordered_pub_quality  , vce(bootstrap, reps(1000)) append save(Table2.docx) label  nest  

asdocx  reg research_award_mean  i.reordered_institute  i.reordered_name_category i.reordered_gender  i.reordered_pub_quality  , vce(bootstrap, reps(1000)) append save(Table2.docx) label  nest  
 
asdocx  reg tenure_eval_mean  i.reordered_institute  i.reordered_name_category i.reordered_gender  i.reordered_pub_quality  , vce(bootstrap, reps(1000)) append save(Table2.docx) label  nest  

asdocx  reg nobel_potential_mean_n  i.reordered_institute  i.reordered_name_category i.reordered_gender  i.reordered_pub_quality  , vce(bootstrap, reps(1000)) append save(Table2.docx) label  nest  


**Multiple hypotheses testing

tabulate reordered_inst, generate(institute_) 
tabulate reordered_name_category, generate(name_) 
tabulate reordered_gender, generate(gender_) 
tabulate reordered_pub_quality, generate(pubqual_) 

drop institute_1 name_1 gender_1 pubqual_1 
 
xi:wyoung top5_desk_mean top5_accept_mean_n lgcitation grant_mean top_conference_mean research_award_mean tenure_eval_mean nobel_potential_mean_n, cmd(reg OUTCOMEVAR institute_2 institute_3 institute_4 institute_5 institute_6 institute_7 institute_8 institute_9 institute_10 name_2 name_3 name_4 gender_2  pubqual_2 pubqual_3 pubqual_4 ) bootstraps(1000) familyp(institute_2 institute_3 institute_4 institute_5 institute_6 institute_7 institute_8 institute_9 institute_10 name_2 name_3 name_4 gender_2  pubqual_2 pubqual_3 pubqual_4) seed(124)  

matrix list r(table)
putexcel set multiple_comparisons.xlsx, replace
putexcel A1=matrix(r(table))  

**Summary statistics
xi: asdocx sum top5_desk_mean top5_accept_mean_n review_wo_combined review_criteria_combined lgcitation grant_mean top_conference_mean research_award_mean tenure_eval_mean nobel_potential_mean_n i.reordered_institute  i.reordered_name_category i.reordered_gender  i.reordered_pub_quality , replace label stat(mean sd min max) dec(3) tzok save(summary.docx) 

sort reordered_pub_quality
xi:by reordered_pub_quality: asdocx sum top5_desk_mean top5_accept_mean_n review_wo_combined review_criteria_combined lgcitation grant_mean top_conference_mean research_award_mean tenure_eval_mean nobel_potential_mean_n  i.reordered_institute  i.reordered_name_category i.reordered_gender  i.reordered_pub_quality , append label stat(mean sd min max) dec(3) tzok save(summary.docx)  


