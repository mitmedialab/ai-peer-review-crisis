import delimited "/Users/nattavudhpowdthavee/Library/CloudStorage/Dropbox/AI journal project/Data/New data/main.csv", clear

cd "/Users/nattavudhpowdthavee/Library/CloudStorage/Dropbox/AI journal project/Data/New data/"

save journal.dta, replace

**Merge fake AI journals 
import delimited "/Users/nattavudhpowdthavee/Library/CloudStorage/Dropbox/AI journal project/Data/New data/fake.csv", clear

gen ai = 1

save ai.dta, replace 

u journal.dta, clear
append using ai.dta, force

**Mean outcomes (anthropic)
gen mean_anthropicscore = (anthropicscore1+ anthropicscore2+ anthropicscore3)/3
gen mean_a_originality = ( anthropicoriginality1 + anthropicoriginality2 + anthropicoriginality3)/3
gen mean_a_rigor = ( anthropicrigor1+ anthropicrigor2+ anthropicrigor3)/3
gen mean_a_scope = ( anthropicscope1+ anthropicscope2+ anthropicscope3)/3
gen mean_a_impact = ( anthropicimpact1 + anthropicimpact2 + anthropicimpact3 )/3
gen mean_a_ai = (anthropicwritten_by_ai1+anthropicwritten_by_ai2+anthropicwritten_by_ai3)/3

**Mean outcomes (GPT)
gen mean_gptscorescore = (openaiscore1+ openaiscore2+ openaiscore3)/3
gen mean_oa_originality = ( openaioriginality1 + openaioriginality2 + openaioriginality3)/3
gen mean_oa_rigor = ( openairigor1+ openairigor2+ openairigor3)/3
gen mean_oa_scope = ( openaiscope1+ openaiscope2+ openaiscope3)/3
gen mean_oa_impact = ( openaiimpact1 + openaiimpact2 + openaiimpact3 )/3
gen mean_oa_ai = (openaiwritten_by_ai1+openaiwritten_by_ai2+openaiwritten_by_ai3)/3

**Mean outcomes (gemma)
gen mean_gemmascore = (gemmascore1+ gemmascore2+ gemmascore3)/3
gen mean_gm_originality = ( gemmaoriginality1 + gemmaoriginality2 + gemmaoriginality3)/3
gen mean_gm_rigor = ( gemmarigor1+ gemmarigor2+ gemmarigor3)/3
gen mean_gm_scope = ( gemmascope1+ gemmascope2+ gemmascope3)/3
gen mean_gm_impact = ( gemmaimpact1 + gemmaimpact2 + gemmaimpact3 )/3
gen mean_gm_ai = (gemmawritten_by_ai1+gemmawritten_by_ai2+gemmawritten_by_ai3)/3

**Mean outcomes (llama)
gen mean_llamascore = (llamascore1+ llamascore2+ llamascore3)/3
gen mean_lm_originality = ( llamaoriginality1 + llamaoriginality2 + llamaoriginality3)/3
gen mean_lm_rigor = ( llamarigor1+ llamarigor2+ llamarigor3)/3
gen mean_lm_scope = ( llamascope1+ llamascope2+ llamascope3)/3
gen mean_lm_impact = ( llamaimpact1 + llamaimpact2 + llamaimpact3 )/3
gen mean_lm_ai = (llamawritten_by_ai1+llamawritten_by_ai2+llamawritten_by_ai3)/3

*Gen repec_ranking 
gen repec_ranking = .
replace repec_ranking = 1 if journal == "Econometrica"
replace repec_ranking = 3 if journal == "Quarterly Journal of Economics"
replace repec_ranking = 4 if journal == "American Economic Review"
replace repec_ranking = 5 if journal == "American Economic Journal-Macro"
replace repec_ranking = 6 if journal == "Journal of Political Economy"
replace repec_ranking = 7 if journal == "Journal of Financial Economics"
replace repec_ranking = 8 if journal == "Journal of Finance"
replace repec_ranking = 10 if journal == "American Economic Journal-Applied Econ"
replace repec_ranking = 11 if journal == "Journal of Economic Growth"
replace repec_ranking = 12 if journal == "Review of Financial Studies"
replace repec_ranking = 13 if journal == "Review of Economic Studies"
replace repec_ranking = 14 if journal == "Journal of Monetary Economics"
replace repec_ranking = 15 if journal == "Journal of Econometrics"
replace repec_ranking = 18 if journal == "Review of Econ and Stats"
replace repec_ranking = 19 if journal == "JEEA"
replace repec_ranking = 21 if journal == "Economic Journal"
replace repec_ranking = 22 if journal == "Journal of Labor Economics"
replace repec_ranking = 23 if journal == "RAND Journal of Economics"
replace repec_ranking = 24 if journal == "Journal of International Economics"
replace repec_ranking = 26 if journal == "Journal of Public Economics"
replace repec_ranking = 27 if journal == "American Economic Journal-Econ Policy"
replace repec_ranking = 28 if journal == "JBES"
replace repec_ranking = 29 if journal == "Journal of Applied Econometrics"
replace repec_ranking = 32 if journal == "Journal of Development Economics"
replace repec_ranking = 32 if journal == "Journal of Development Studies"
replace repec_ranking = 34 if journal == "Journal of Human Resources"
replace repec_ranking = 35 if journal == "JMCB"
replace repec_ranking = 36 if journal == "Journal of Economic Theory"
replace repec_ranking = 38 if journal == "European Econ Review"
replace repec_ranking = 39 if journal == "International Econ Review"
replace repec_ranking = 40 if journal == "Experimental Econ"
replace repec_ranking = 43 if journal == "Journal of Banking and Finance"
replace repec_ranking = 45 if journal == "Journal of Econ Dynamic and Control"
replace repec_ranking = 55 if journal == "Oxford Bulletin of Econ and Stat"
replace repec_ranking = 57 if journal == "JFQA"
replace repec_ranking = 58 if journal == "Journal of Risk and Uncertainty"
replace repec_ranking = 61 if journal == "Journal of Urban Econ"
replace repec_ranking = 62 if journal == "Econometric Theory"
replace repec_ranking = 66 if journal == "Journal of Health Econ"
replace repec_ranking = 70 if journal == "Quantitative Econ"
replace repec_ranking = 71 if journal == "Econometric Journal"
replace repec_ranking = 74 if journal == "Games and Econ Behav"
replace repec_ranking = 75 if journal == "Labour Economics"
replace repec_ranking = 76 if journal == "Journal of Corporate Finance"
replace repec_ranking = 81 if journal == "World Development"
replace repec_ranking = 85 if journal == "JEBO"
replace repec_ranking = 89 if journal == "American Economic Journal-Micoecon"
replace repec_ranking = 90 if journal == "Journal of Empirical Finance"
replace repec_ranking = 94 if journal == "Scandinavian J of Econ"
replace repec_ranking = 112 if journal == "Canadian J of Econ"
replace repec_ranking = 116 if journal == "Econ Inquiry"
replace repec_ranking = 117 if journal == "Regional Science and Urban Econ"
replace repec_ranking = 119 if journal == "Theoretical Economics"
replace repec_ranking = 121 if journal == "American Journal of Agri Econ"
replace repec_ranking = 128 if journal == "Economica"
replace repec_ranking = 137 if journal == "Economic Theory"
replace repec_ranking = 139 if journal == "Public Choice"
replace repec_ranking = 144 if journal == "Regional Studies"
replace repec_ranking = 147 if journal == "International Finance"
replace repec_ranking = 149 if journal == "Econ of Education Review"
replace repec_ranking = 152 if journal == "Journal of Econ Inequality"
replace repec_ranking = 155 if journal == "Journal of Mathematical Econ"
replace repec_ranking = 165 if journal == "Empirical Econ"
replace repec_ranking = 167 if journal == "Journal of Econ Psych"
replace repec_ranking = 170 if journal == "Review of International Econ"
replace repec_ranking = 173 if journal == "Economic Modelling"
replace repec_ranking = 174 if journal == "Review of Income and Wealth"
replace repec_ranking = 182 if journal == "China Economic Review"
replace repec_ranking = 184 if journal == "Macroeconomic Dynamics"
replace repec_ranking = 193 if journal == "Journal of Regional Science"
replace repec_ranking = 194 if journal == "The World Economy"
replace repec_ranking = 196 if journal == "Health Economics"
replace repec_ranking = 200 if journal == "Applied Economics"
replace repec_ranking = 207 if journal == "Journal of Macroeconomics"
replace repec_ranking = 242 if journal == "Kyklos"
replace repec_ranking = 246 if journal == "Journal of African Economics"
replace repec_ranking = 247 if journal == "Journal of Policy Modeling"
replace repec_ranking = 278 if journal == "Review of Development Economics"
replace repec_ranking = 290 if journal == "Quarterly Review of Econ and Finance"
replace repec_ranking = 296 if journal == "Education Economics"
replace repec_ranking = 297 if journal == "Manchester School"
replace repec_ranking = 299 if journal == "Empirica"
replace repec_ranking = 311 if journal == "Papers in Regional Science"
replace repec_ranking = 312 if journal == "Scottish Journal of Pol Econ"
replace repec_ranking = 324 if journal == "Theory and Decision"
replace repec_ranking = 348 if journal == "Journal of Behav and Exp Econ"
replace repec_ranking = 357 if journal == "Journal of Asian Economics"
replace repec_ranking = 375 if journal == "Review of Financial Economics"
replace repec_ranking = 398 if journal == "Asian Economic Papers"
replace repec_ranking = 411 if journal == "Computational Economics"
replace repec_ranking = 424 if journal == "Southern Economic Journal"
replace repec_ranking = 439 if journal == "Journal of Sports Economics"
replace repec_ranking = 442 if journal == "Japanese Economic Review"
replace repec_ranking = 447 if journal == "Pacific Economic Review"
replace repec_ranking = 463 if journal == "Journal of Economics of Ageing"
replace repec_ranking = 466 if journal == "Journal of Benefit-Cost Analysis"
replace repec_ranking = 471 if journal == "Metroeconomica"
replace repec_ranking = 482 if journal == "Journal of Cultural Econ"
replace repec_ranking = 521 if journal == "Journal of Wine Economics"
replace repec_ranking = 531 if journal == "Review of Quant Finance and Accounting"

*Gen journal fields
gen field = ""

// General
replace field = "General" if journal == "Econometrica"
replace field = "General" if journal == "Quarterly Journal of Economics"
replace field = "General" if journal == "American Economic Review"
replace field = "General" if journal == "Journal of Political Economy"
replace field = "General" if journal == "Review of Economic Studies"
replace field = "General" if journal == "Review of Econ and Stats"
replace field = "General" if journal == "Economic Journal"
replace field = "General" if journal == "JEEA"
replace field = "General" if journal == "European Econ Review"
replace field = "General" if journal == "International Econ Review"
replace field = "General" if journal == "Oxford Bulletin of Econ and Stat"
replace field = "General" if journal == "Scandinavian J of Econ"
replace field = "General" if journal == "Canadian J of Econ"
replace field = "General" if journal == "Econ Inquiry"
replace field = "General" if journal == "Economica"
replace field = "General" if journal == "Kyklos"
replace field = "General" if journal == "Manchester School"
replace field = "General" if journal == "Empirica"
replace field = "General" if journal == "Scottish Journal of Pol Econ"
replace field = "General" if journal == "Southern Economic Journal"
replace field = "General" if journal == "Metroeconomica"
replace field = "General" if journal == "Applied Economics"

// Micro
replace field = "Micro" if journal == "Experimental Econ"
replace field = "Micro" if journal == "Journal of Economic Theory"
replace field = "Micro" if journal == "Journal of Risk and Uncertainty"
replace field = "Micro" if journal == "American Economic Journal-Micoecon"
replace field = "Micro" if journal == "Journal of Mathematical Econ"
replace field = "Micro" if journal == "Computational Economics"
replace field = "Micro" if journal == "Journal of Econ Dynamic and Control"
replace field = "Micro" if journal == "RAND Journal of Economics"
replace field = "Micro" if journal == "Theoretical Economics"
replace field = "Micro" if journal == "Economic Theory"
replace field = "Micro" if journal == "Theory and Decision"
replace field = "Micro" if journal == "Games and Econ Behav"

// Macro
replace field = "Macro" if journal == "American Economic Journal-Macro"
replace field = "Macro" if journal == "Journal of Monetary Economics"
replace field = "Macro" if journal == "JMCB"
replace field = "Macro" if journal == "Journal of Macroeconomics"
replace field = "Macro" if journal == "Macroeconomic Dynamics"
replace field = "Macro" if journal == "Review of International Econ"
replace field = "Macro" if journal == "Economic Modelling"
replace field = "Macro" if journal == "Journal of International Economics"
replace field = "Macro" if journal == "Journal of Economic Growth"
replace field = "Macro" if journal == "Journal of Development Economics"
replace field = "Macro" if journal == "Journal of Development Studies"
replace field = "Macro" if journal == "China Economic Review"
replace field = "Macro" if journal == "Review of Development Economics"
replace field = "Macro" if journal == "The World Economy"
replace field = "Macro" if journal == "World Development"
replace field = "Macro" if journal == "Journal of African Economics"
replace field = "Macro" if journal == "Journal of Policy Modeling"

// Finance
replace field = "Finance" if journal == "Journal of Financial Economics"
replace field = "Finance" if journal == "Journal of Finance"
replace field = "Finance" if journal == "Review of Financial Studies"
replace field = "Finance" if journal == "JFQA"
replace field = "Finance" if journal == "Journal of Banking and Finance"
replace field = "Finance" if journal == "Journal of Corporate Finance"
replace field = "Finance" if journal == "Journal of Empirical Finance"
replace field = "Finance" if journal == "Quarterly Review of Econ and Finance"
replace field = "Finance" if journal == "Review of Financial Economics"
replace field = "Finance" if journal == "Review of Quant Finance and Accounting"
replace field = "Finance" if journal == "International Finance"

// Applied Microeconometrics
replace field = "Applied Microeconometrics" if journal == "American Economic Journal-Applied Econ"
replace field = "Applied Microeconometrics" if journal == "American Economic Journal-Econ Policy"
replace field = "Applied Microeconometrics" if journal == "Journal of Labor Economics"
replace field = "Applied Microeconometrics" if journal == "Journal of Human Resources"
replace field = "Applied Microeconometrics" if journal == "Labour Economics"
replace field = "Applied Microeconometrics" if journal == "Journal of Health Econ"
replace field = "Applied Microeconometrics" if journal == "Health Economics"
replace field = "Applied Microeconometrics" if journal == "Econ of Education Review"
replace field = "Applied Microeconometrics" if journal == "Education Economics"
replace field = "Applied Microeconometrics" if journal == "Journal of Sports Economics"
replace field = "Applied Microeconometrics" if journal == "Journal of Economics of Ageing"
replace field = "Applied Microeconometrics" if journal == "Journal of Public Economics"
replace field = "Applied Microeconometrics" if journal == "Public Choice"
replace field = "Applied Microeconometrics" if journal == "Review of Income and Wealth"
replace field = "Applied Microeconometrics" if journal == "Journal of Econ Inequality"
replace field = "Applied Microeconometrics" if journal == "American Journal of Agri Econ"
replace field = "Applied Microeconometrics" if journal == "JEBO"
replace field = "Applied Microeconometrics" if journal == "Journal of Econ Psych"
replace field = "Applied Microeconometrics" if journal == "Empirical Econ"
replace field = "Applied Microeconometrics" if journal == "Journal of Cultural Econ"
replace field = "Applied Microeconometrics" if journal == "Journal of Wine Economics"
replace field = "Applied Microeconometrics" if journal == "Journal of Behav and Exp Econ"
replace field = "Applied Microeconometrics" if journal == "Journal of Asian Economics"
replace field = "Applied Microeconometrics" if journal == "Asian Economic Papers"
replace field = "Applied Microeconometrics" if journal == "Japanese Economic Review"
replace field = "Applied Microeconometrics" if journal == "Pacific Economic Review"
replace field = "Applied Microeconometrics" if journal == "Journal of Benefit-Cost Analysis"
replace field = "Applied Microeconometrics" if journal == "Journal of Urban Econ"
replace field = "Applied Microeconometrics" if journal == "Regional Science and Urban Econ"
replace field = "Applied Microeconometrics" if journal == "Journal of Regional Science"
replace field = "Applied Microeconometrics" if journal == "Regional Studies"
replace field = "Applied Microeconometrics" if journal == "Papers in Regional Science"

// Other (Fallback, just in case)
replace field = "Other" if field == ""

encode field, gen(field_num)

*Gen predatory
gen predatory = .
replace predatory = 0 if repec_ranking~=.
replace predatory = 1 if repec_ranking==.
gen lgrepec = log(repec_ranking)

gen rank_num = real(rank) if !inlist(substr(rank,1,1),"P")

gen rank_band = .
replace rank_band = 1 if rank_num>=1 & rank_num<=25
replace rank_band = 2 if rank_num>25 & rank_num<=50
replace rank_band = 3 if rank_num>50 & rank_num<=75
replace rank_band = 4 if rank_num>75 & rank_num<=100
replace rank_band = 5 if predatory == 1
replace rank_band = 6 if ai==1

lab def rank_band 1 "Top 1-25 ranked journals" 2 "26th-50th ranked" 3 "51st-75th ranked" 4 "76th-100th ranked" 5 "Unranked papers" 6 "AI-generated" , modify
lab val rank_band rank_band 

replace lenanond = lenanond/100
gen lenanond_sq = lenanond^2/100

replace field_num = 1 if strpos(id, "app")
replace field_num = 2 if strpos(id, "fin")
replace field_num = 4 if strpos(id, "mac")
replace field_num = 5 if strpos(id, "min")

*gen rank_norm = (rank_num - 1) / (100 - 1)

**Distinguishing AI-generated papers
gen id2 = id
encode id2, gen(id2_num)

gen rank_band2 = rank_band
replace rank_band2 = . if rank_band2 == 6

replace rank_band2 = 6 if id2_>=451 & id2_<=470
replace rank_band2 = 7 if id2_>=1121 & id2_<=1140
replace rank_band2 = 8 if id2_>=1141 & id2_<=1160
replace rank_band2 = 9 if id2_>=1201 & id2_<=1220
replace rank_band2 = 10 if id2_>=1161 & id2_<=1180
replace rank_band2 = 11 if id2_>=1181 & id2_<=1200


lab def rank_band2 1 "Top 1-25 ranked journals" 2 "26th-50th ranked" 3 "51st-75th ranked" 4 "76th-100th ranked" 5 "Unranked papers" 6 "GPT4o-papers" 7 "Claude-papers" 8 "Deepseek-papers" 9 "GPTo1-papers" 10 "Gemma-papers" 11 "Llama-papers"  , modify

lab val rank_band2 rank_band2
 
encode journal, gen(journal_n)
replace journal_n = 111 if id2_>=451 & id2_<=470
replace journal_n = 112 if id2_>=1121 & id2_<=1140
replace journal_n = 113 if  id2_>=1141 & id2_<=1160
replace journal_n = 114 if id2_>=1161 & id2_<=1180
replace journal_n = 115 if id2_>=1181 & id2_<=1200
replace journal_n = 116 if  id2_>=1201 & id2_<=1220
 
save journal.dta, replace

*******************************************************************

**Analysis

u journal.dta, clear

**Bin scatter regression 
*Figure 1
**With CI
binsreg mean_gptscore rank_num lenanon* i.field_num,  nbins(100) vce(robust) line(1) ci(3)   polyreg(3)  xtitle("Ordinal ranking of journals", size(small)) ytitle("Average top 5 rating") title("GPT", size(small)) polyregplotopt(lcolor(red) lp(dash))  ciplotopt(lc(stblue*.4)) dotsplotopt(mcolor(stblue*.4))    
 
graph save fig1oa.gph, replace

**Top 5 accept - CLAUDE
binsreg mean_anthropicscore rank_num lenanon* i.field_num,  nbins(100) vce(robust) line(1) ci(3)   polyreg(3)   xtitle("Ordinal ranking of journals", size(small)) ytitle("Average top 5 rating") title("CLAUDE", size(small)) polyregplotopt(lcolor(red) lp(dash)) ciplotopt(lc(stblue*.4)) dotsplotopt(mcolor(stblue*.4))

graph save fig1claude.gph, replace

**Top 5 accept - Gemmani
binsreg mean_gemmascore rank_num lenanon* i.field_num,  nbins(100) vce(robust) line(1) ci(3)   polyreg(3)   xtitle("Ordinal ranking of journals", size(small)) ytitle("Average top 5 rating") title("GEMMA", size(small)) polyregplotopt(lcolor(red) lp(dash)) ciplotopt(lc(stblue*.4)) dotsplotopt(mcolor(stblue*.4))

graph save fig1gemma.gph, replace

**Top 5 accept - Llama
binsreg mean_llamascore rank_num lenanon* i.field_num,  nbins(100) vce(robust) line(1) ci(3)   polyreg(3)   xtitle("Ordinal ranking of journals", size(small)) ytitle("Average top 5 rating") title("LLAMA", size(small)) polyregplotopt(lcolor(red) lp(dash)) ciplotopt(lc(stblue*.4)) dotsplotopt(mcolor(stblue*.4))

graph save fig1llama.gph, replace

graph combine "fig1oa.gph" "fig1claude.gph" "fig1gemma.gph" "fig1llama.gph" 
graph save fig1combine.gph, replace
graph export Fig1_PanelA.png, replace

**Binsregtest -- testing the linearity and monotonicity 
**With CI
*Poly(0)
binstest mean_gptscore rank_num lenanon* i.field_num, testmodelpoly(0)     
binstest mean_anthropicscore rank_num lenanon* i.field_num, testmodelpoly(0) 
binstest mean_gemmascore rank_num lenanon* i.field_num, testmodelpoly(0) 
binstest mean_llamascore rank_num lenanon* i.field_num, testmodelpoly(0)  

*Poly(1)
binstest mean_gptscore rank_num lenanon* i.field_num, testmodelpoly(1)     
binstest mean_anthropicscore rank_num lenanon* i.field_num, testmodelpoly(1) 
binstest mean_gemmascore rank_num lenanon* i.field_num, testmodelpoly(1) 
binstest mean_llamascore rank_num lenanon* i.field_num, testmodelpoly(1)  

*Poly(2)
binstest mean_gemmascore rank_num lenanon* i.field_num, testmodelpoly(2) 

**Monotonicity test

binstest mean_gptscore rank_num lenanon* i.field_num, deriv(1) bins(1 1) testshapel(0)  nsims(2000)  simsgrid(50) 
binstest mean_anthropicscore rank_num lenanon* i.field_num, deriv(1) bins(1 1) testshapel(0)  nsims(2000)  simsgrid(50) 
binstest mean_gemmascore rank_num lenanon* i.field_num, deriv(1) bins(1 1) testshapel(0)  nsims(2000)  simsgrid(50) 
binstest mean_llamascore rank_num lenanon* i.field_num, deriv(1) bins(1 1) testshapel(0)  nsims(2000)  simsgrid(50) 

*Cardinal ranking 
**With ci
binsreg mean_gptscore repec_ranking,   nbins(100) vce(robust) line(1) ci(3)   polyreg(3)  xtitle("RePEc Ranking (Feb 2025)", size(small)) ytitle("Average top 5 rating") title("GPT", size(small)) polyregplotopt(lcolor(red) lp(dash)) ciplotopt(lc(stblue*.4)) dotsplotopt(mcolor(stblue*.4))

graph save appendA1oa.gph, replace

**Top 5 accept - CLAUDE
binsreg mean_anthropicscore repec_ranking,  nbins(100) vce(robust) line(1) ci(3)   polyreg(3)   xtitle("RePEc Ranking (Feb 2025)", size(small)) ytitle("Average top 5 rating") title("CLAUDE", size(small)) polyregplotopt(lcolor(red) lp(dash)) ciplotopt(lc(stblue*.4)) dotsplotopt(mcolor(stblue*.4))

graph save appendA1claude.gph, replace

**Top 5 accept - Gemmani
binsreg mean_gemmascore repec_ranking,  nbins(100) vce(robust) line(1) ci(3)   polyreg(3)   xtitle("RePEc Ranking (Feb 2025)", size(small)) ytitle("Average top 5 rating") title("GEMMA", size(small)) polyregplotopt(lcolor(red) lp(dash)) ciplotopt(lc(stblue*.4)) dotsplotopt(mcolor(stblue*.4))

graph save appendA1gemma.gph, replace

**Top 5 accept - Llama
binsreg mean_llamascore repec_ranking,  nbins(100) vce(robust) line(1) ci(3)   polyreg(3)   xtitle("RePEc Ranking (Feb 2025)", size(small)) ytitle("Average top 5 rating") title("LLAMA", size(small)) polyregplotopt(lcolor(red) lp(dash)) ciplotopt(lc(stblue*.4)) dotsplotopt(mcolor(stblue*.4))

graph save appendA1llama.gph, replace

graph combine "appendA1oa.gph" "appendA1claude.gph" "appendA1gemma.gph" "appendA1llama.gph"  
graph save appendA1combine.gph, replace
graph export Fig1_PanelB.png, replace

**********************************

*Fig 2: Binsreg for each of the four domains
**Originality
*With ci 
binsreg mean_oa_originality rank_num lenanon* i.field_num,  nbins(100) vce(robust) line(1) ci(3)   polyreg(3)  xtitle("Ordinal ranking of journals", size(small)) ytitle("Average originality rating") title("GPT", size(small)) polyregplotopt(lcolor(red) lp(dash)) ciplotopt(lc(stblue*.4)) dotsplotopt(mcolor(stblue*.4))

graph save appendixA2oa.gph, replace

**CLAUDE
binsreg mean_a_originality rank_num lenanon* i.field_num,  nbins(100) vce(robust) line(1) ci(3)   polyreg(3)   xtitle("Ordinal ranking of journals", size(small)) ytitle("Average originality rating") title("CLAUDE", size(small)) polyregplotopt(lcolor(red) lp(dash)) ciplotopt(lc(stblue*.4)) dotsplotopt(mcolor(stblue*.4))

graph save appendixA2claude.gph, replace

**Gemmani
binsreg mean_gm_originality rank_num lenanon* i.field_num,  nbins(100) vce(robust) line(1) ci(3)   polyreg(3)   xtitle("Ordinal ranking of journals", size(small)) ytitle("Average originality rating") title("GEMMA", size(small)) polyregplotopt(lcolor(red) lp(dash)) ciplotopt(lc(stblue*.4)) dotsplotopt(mcolor(stblue*.4))

graph save appendixA2gemma.gph, replace

**Llama
binsreg mean_lm_originality rank_num lenanon* i.field_num,  nbins(100) vce(robust) line(1) ci(3)   polyreg(3)   xtitle("Ordinal ranking of journals", size(small)) ytitle("Average originality rating") title("LLAMA", size(small)) polyregplotopt(lcolor(red) lp(dash)) ciplotopt(lc(stblue*.4)) dotsplotopt(mcolor(stblue*.4))

graph save appendixA2llama.gph, replace

graph combine "appendixA2oa.gph" "appendixA2claude.gph" "appendixA2gemma.gph" "appendixA2llama.gph"  
graph save appendixA2combine.gph, replace
graph export Fig2_PanelA.png, replace


**rigor
**OPEN AI
**with ci 
binsreg mean_oa_rigor rank_num lenanon* i.field_num,  nbins(100) vce(robust) line(1) ci(3)   polyreg(3)  xtitle("Ordinal ranking of journals", size(small)) ytitle("Average rigor rating") title("GPT", size(small)) polyregplotopt(lcolor(red) lp(dash)) ciplotopt(lc(stblue*.4)) dotsplotopt(mcolor(stblue*.4))

graph save appendixA3oa.gph, replace

**CLAUDE
binsreg mean_a_rigor rank_num lenanon* i.field_num,  nbins(100) vce(robust) line(1) ci(3)   polyreg(3)   xtitle("Ordinal ranking of journals", size(small)) ytitle("Average rigor rating") title("CLAUDE", size(small)) polyregplotopt(lcolor(red) lp(dash)) ciplotopt(lc(stblue*.4)) dotsplotopt(mcolor(stblue*.4))

graph save appendixA3claude.gph, replace

**Gemmani
binsreg mean_gm_rigor rank_num lenanon* i.field_num,  nbins(100) vce(robust) line(1) ci(3)   polyreg(3)   xtitle("Ordinal ranking of journals", size(small)) ytitle("Average rigor rating") title("GEMMA", size(small)) polyregplotopt(lcolor(red) lp(dash)) ciplotopt(lc(stblue*.4)) dotsplotopt(mcolor(stblue*.4))

graph save appendixA3gemma.gph, replace

**Llama
binsreg mean_lm_rigor rank_num lenanon* i.field_num,  nbins(100) vce(robust) line(1) ci(3)   polyreg(3)   xtitle("Ordinal ranking of journals", size(small)) ytitle("Average rigor rating") title("LLAMA", size(small)) polyregplotopt(lcolor(red) lp(dash)) ciplotopt(lc(stblue*.4)) dotsplotopt(mcolor(stblue*.4))

graph save appendixA3llama.gph, replace

graph combine "appendixA3oa.gph" "appendixA3claude.gph" "appendixA3gemma.gph" "appendixA3llama.gph"  
graph save appendixA3combine.gph, replace
graph export Fig2_PanelB.png, replace

**scope
**OPEN AI
**with ci 
binsreg mean_oa_scope rank_num lenanon* i.field_num,  nbins(100) vce(robust) line(1) ci(3)   polyreg(3)  xtitle("Ordinal ranking of journals", size(small)) ytitle("Average scope rating") title("GPT", size(small)) polyregplotopt(lcolor(red) lp(dash)) ciplotopt(lc(stblue*.4)) dotsplotopt(mcolor(stblue*.4))

graph save appendixA4oa.gph, replace

**CLAUDE
binsreg mean_a_scope rank_num lenanon* i.field_num,  nbins(100) vce(robust) line(1) ci(3)   polyreg(3)   xtitle("Ordinal ranking of journals", size(small)) ytitle("Average scope rating") title("CLAUDE", size(small)) polyregplotopt(lcolor(red) lp(dash)) ciplotopt(lc(stblue*.4)) dotsplotopt(mcolor(stblue*.4))

graph save appendixA4claude.gph, replace

**Gemmani
binsreg mean_gm_scope rank_num lenanon* i.field_num,  nbins(100) vce(robust) line(1) ci(3)   polyreg(3)   xtitle("Ordinal ranking of journals", size(small)) ytitle("Average scope rating") title("GEMMA", size(small)) polyregplotopt(lcolor(red) lp(dash)) ciplotopt(lc(stblue*.4)) dotsplotopt(mcolor(stblue*.4))

graph save appendixA4gemma.gph, replace

**Llama
binsreg mean_lm_scope rank_num lenanon* i.field_num,  nbins(100) vce(robust) line(1) ci(3)   polyreg(3)   xtitle("Ordinal ranking of journals", size(small)) ytitle("Average scope rating") title("LLAMA", size(small)) polyregplotopt(lcolor(red) lp(dash)) ciplotopt(lc(stblue*.4)) dotsplotopt(mcolor(stblue*.4))

graph save appendixA4llama.gph, replace

graph combine "appendixA4oa.gph" "appendixA4claude.gph" "appendixA4gemma.gph" "appendixA4llama.gph" 
graph save appendixA4combine.gph, replace
graph export Fig2_PanelC.png, replace

**impact
**OPEN AI
**with ci 
binsreg mean_oa_impact rank_num lenanon* i.field_num,  nbins(100) vce(robust) line(1) ci(3) polyreg(3)  xtitle("Ordinal ranking of journals", size(small)) ytitle("Average impact rating") title("GPT", size(small)) polyregplotopt(lcolor(red) lp(dash)) ciplotopt(lc(stblue*.4)) dotsplotopt(mcolor(stblue*.4))

graph save appendixA5oa.gph, replace

**CLAUDE
binsreg mean_a_impact rank_num lenanon* i.field_num,  nbins(100) vce(robust) line(1) ci(3) polyreg(3)   xtitle("Ordinal ranking of journals", size(small)) ytitle("Average impact rating") title("CLAUDE", size(small)) polyregplotopt(lcolor(red) lp(dash)) ciplotopt(lc(stblue*.4)) dotsplotopt(mcolor(stblue*.4))

graph save appendixA5claude.gph, replace

**Gemmani
binsreg mean_gm_impact rank_num lenanon* i.field_num,  nbins(100) vce(robust) line(1) ci(3) polyreg(3)   xtitle("Ordinal ranking of journals", size(small)) ytitle("Average impact rating") title("GEMMA", size(small)) polyregplotopt(lcolor(red) lp(dash)) ciplotopt(lc(stblue*.4)) dotsplotopt(mcolor(stblue*.4))

graph save appendixA5gemma.gph, replace

**Llama
binsreg mean_lm_impact rank_num lenanon* i.field_num,  nbins(100) vce(robust) line(1) ci(3) polyreg(3)   xtitle("Ordinal ranking of journals", size(small)) ytitle("Average impact rating") title("LLAMA", size(small)) polyregplotopt(lcolor(red) lp(dash)) ciplotopt(lc(stblue*.4)) dotsplotopt(mcolor(stblue*.4))

graph save appendixA5llama.gph, replace

graph combine "appendixA5oa.gph" "appendixA5claude.gph" "appendixA5gemma.gph" "appendixA5llama.gph"  
graph save appendixA5combine.gph, replace
graph export Fig2_PanelD.png, replace

 
**OLS on four domains
asdocx reg mean_gptscore  mean_oa_originality mean_oa_rigor mean_oa_scope mean_oa_impact , r  save(Table_mech.docx)  title(GPT) label fs(9) nested replace 
asdocx reg mean_anthropicscore mean_a_originality mean_a_rigor mean_a_scope mean_a_impact, r  save(Table_mech.docx)  title(CLAUDE) label fs(9) nested append
asdocx reg mean_gemmascore mean_gm_originality mean_gm_rigor mean_gm_scope mean_gm_impact , r  save(Table_mech.docx)  title(GEMMA) label fs(9) nested append
asdocx reg mean_llamascore mean_lm_originality mean_lm_rigor mean_lm_scope mean_lm_impact, r  save(Table_mech.docx)  title(LLaMA) label fs(9) nested append



***********************************
**Fig 3: Comparing between Ranked and MDPI economics papers and AI papers
*Open AI
cibar mean_gptscore, over(rank_band) ///
ciopts(lcolor(purple) lwidth(medium)) barcolor(%60 %60 %60 %60 %60 %60)  ///
graphopts(ytitle(Average top 5 rating)   /// here is where "graphopts( )" begins
xtitle("Open AI"))   

graph save fig2oa.gph, replace
 

*CLAUDE
cibar mean_anthropicscore, over(rank_band) ///
ciopts(lcolor(purple) lwidth(medium)) barcolor(%60 %60 %60 %60 %60 %60)  ///
graphopts(ytitle(Average top 5 rating)   /// here is where "graphopts( )" begins
xtitle("CLAUDE"))  

graph save fig2claude.gph, replace

*GEMMA
cibar mean_gemmascore, over(rank_band) ///
ciopts(lcolor(purple) lwidth(medium)) barcolor(%60 %60 %60 %60 %60 %60)  ///
graphopts(ytitle(Average top 5 rating)   /// here is where "graphopts( )" begins
xtitle("GEMMA"))  

graph save fig2gemma.gph, replace

*LLAMA
cibar mean_llamascore, over(rank_band) ///
ciopts(lcolor(purple) lwidth(medium)) barcolor(%60 %60 %60 %60 %60 %60)  ///
graphopts(ytitle(Average top 5 rating)   /// here is where "graphopts( )" begins
xtitle("LLAMA"))  

graph save fig2llama.gph, replace

grc1leg2 "fig2oa.gph" "fig2claude.gph" "fig2gemma.gph" "fig2llama.gph" , position(3)
graph save fig2combine.gph, replace
graph export Fig3.png, replace


**Coefplot
est clear
eststo A: reg mean_gptscore b1.rank_band lenanon* i.field_n, vce(robust)  
eststo B: reg mean_anthropicscore b1.rank_band lenanon* i.field_n, vce(robust)  
eststo C: reg mean_gemmascore b1.rank_band lenanon* i.field_n, vce(robust)  
eststo D: reg mean_llamascore b1.rank_band lenanon* i.field_n, vce(robust)  

coefplot (A, label(GPT) bcolor(%60)) (B, label(CLAUDE) bcolor(%60)) ///
(C, label(GEMMA) bcolor(%60)) (D, label(LLAMA) bcolor(%60)), keep(*.rank_band)   ///
    recast(bar) ///
    title("Top 5 Journal Rating", size(small)) ///
    xlabel(, labsize(small)) ///
	ylabel(, labsize(small))  ///
    mlabposition(12) ///
    mlabsize(small) ciopts(recast(rcap)) citop barwidt(0.2) legend(rows(2) size(vsmall)) 

graph save "Fig2A_coefplot.gph", replace
graph export "Fig2A_coefplot.png", replace
	
**Testing AI
*GPT
cibar mean_oa_ai, over(rank_band) ///
ciopts(lcolor(purple) lwidth(medium)) barcolor(%60 %60 %60 %60 %60 %60)  ///
graphopts(ytitle(Average rating written by AI)   /// here is where "graphopts( )" begins
xtitle("Open AI"))   

graph save fig_ai_oa.gph, replace

*CLAUDE
cibar mean_a_ai, over(rank_band) ///
ciopts(lcolor(purple) lwidth(medium)) barcolor(%60 %60 %60 %60 %60 %60)  ///
graphopts(ytitle(Average rating written by AI)   /// here is where "graphopts( )" begins
xtitle("CLAUDE"))  

graph save fig_ai_claude.gph, replace

*GEMMA
cibar mean_gm_ai, over(rank_band) ///
ciopts(lcolor(purple) lwidth(medium)) barcolor(%60 %60 %60 %60 %60 %60)  ///
graphopts(ytitle(Average rating written by AI)   /// here is where "graphopts( )" begins
xtitle("GEMMA"))  

graph save fig_ai_gemma.gph, replace

*LLAMA
cibar mean_lm_ai, over(rank_band) ///
ciopts(lcolor(purple) lwidth(medium)) barcolor(%60 %60 %60 %60 %60 %60)  ///
graphopts(ytitle(Average rating written by AI)   /// here is where "graphopts( )" begins
xtitle("LLAMA"))  

graph save fig_ai_llama.gph, replace

grc1leg2 "fig_ai_oa.gph" "fig_ai_claude.gph" "fig_ai_gemma.gph" "fig_ai_llama.gph", position(3) 
graph save fig_ai_combine.gph, replace
graph export fig_ai_combine.png, replace


est clear
eststo A: reg mean_oa_ai b1.rank_band lenanon* i.field_n, vce(robust)  
eststo B: reg mean_a_ai b1.rank_band lenanon* i.field_n, vce(robust)  
eststo C: reg mean_gm_ai b1.rank_band lenanon* i.field_n, vce(robust)  
eststo D: reg mean_lm_ai b1.rank_band lenanon* i.field_n, vce(robust)  

coefplot (A, label(GPT) bcolor(%60)) (B, label(CLAUDE) bcolor(%60))   ///
(C, label(GEMMA) bcolor(%60)) (D, label(LLAMA) bcolor(%60)), keep(*.rank_band)   ///
    recast(bar)  ///
    title("Written by AI Rating", size(small)) ///
    xlabel(, labsize(small)) ///
	ylabel(, labsize(small)) ///
    mlabposition(12) ///
    mlabsize(small) ciopts(recast(rcap)) citop barwidt(0.2) legend(rows(2) size(vsmall)) 

graph save "Fig2B_coefplot.gph", replace
graph export "Fig2B_coefplot.png", replace

*grc1leg2 "Fig2A_coefplot.gph" "Fig2B_coefplot.gph"   

***********************************************************
*Fig 4: By field
**Top 5 accept - OPEN AI
**Without ci 
binsreg mean_gptscore rank_num lenanon*,  by(field) polyreg(1)  xtitle("Ordinal ranking of journals", size(small)) ytitle("Average top 5 rating") title("GPT", size(small)) legend(rows(2))

graph save fig3oa.gph, replace

binsreg mean_anthropicscore rank_num lenanon*,  by(field) polyreg(1)  xtitle("Ordinal ranking of journals", size(small)) ytitle("Average top 5 rating") title("CLAUDE", size(small))  legend(rows(2)) 

graph save fig3claude.gph, replace

binsreg mean_gemmascore rank_num lenanon*,  by(field) polyreg(1)  xtitle("Ordinal ranking of journals", size(small)) ytitle("Average top 5 rating") title("GEMMA", size(small)) legend(rows(2))  

graph save fig3gemma.gph, replace

binsreg mean_llamascore rank_num lenanon*,  by(field) polyreg(1)  xtitle("Ordinal ranking of journals", size(small)) ytitle("Average top 5 rating") title("LLAMA", size(small)) legend(rows(2))  

graph save fig3llama.gph, replace

grc1leg2 "fig3oa.gph" "fig3claude.gph" "fig3gemma.gph" "fig3llama.gph" 
graph export Fig4.png, replace
 

****************************************

**Figure 5: Robustness Check -- adding different amount of text

**Testing incremental number of words
import delimited "/Users/nattavudhpowdthavee/Library/CloudStorage/Dropbox/AI journal project/Data/New data/partial.csv", clear 

gen rank = floor(v1 / 10) + 1
replace rank = . if rank>=101
*Gen journal fields
gen field = ""

// General
replace field = "General" if journal == "Econometrica"
replace field = "General" if journal == "Quarterly Journal of Economics"
replace field = "General" if journal == "American Economic Review"
replace field = "General" if journal == "Journal of Political Economy"
replace field = "General" if journal == "Review of Economic Studies"
replace field = "General" if journal == "Review of Econ and Stats"
replace field = "General" if journal == "Economic Journal"
replace field = "General" if journal == "JEEA"
replace field = "General" if journal == "European Econ Review"
replace field = "General" if journal == "International Econ Review"
replace field = "General" if journal == "Oxford Bulletin of Econ and Stat"
replace field = "General" if journal == "Scandinavian J of Econ"
replace field = "General" if journal == "Canadian J of Econ"
replace field = "General" if journal == "Econ Inquiry"
replace field = "General" if journal == "Economica"
replace field = "General" if journal == "Kyklos"
replace field = "General" if journal == "Manchester School"
replace field = "General" if journal == "Empirica"
replace field = "General" if journal == "Scottish Journal of Pol Econ"
replace field = "General" if journal == "Southern Economic Journal"
replace field = "General" if journal == "Metroeconomica"
replace field = "General" if journal == "Applied Economics"

// Micro
replace field = "Micro" if journal == "Experimental Econ"
replace field = "Micro" if journal == "Journal of Economic Theory"
replace field = "Micro" if journal == "Journal of Risk and Uncertainty"
replace field = "Micro" if journal == "American Economic Journal-Micoecon"
replace field = "Micro" if journal == "Journal of Mathematical Econ"
replace field = "Micro" if journal == "Computational Economics"
replace field = "Micro" if journal == "Journal of Econ Dynamic and Control"
replace field = "Micro" if journal == "RAND Journal of Economics"
replace field = "Micro" if journal == "Theoretical Economics"
replace field = "Micro" if journal == "Economic Theory"
replace field = "Micro" if journal == "Theory and Decision"
replace field = "Micro" if journal == "Games and Econ Behav"

// Macro
replace field = "Macro" if journal == "American Economic Journal-Macro"
replace field = "Macro" if journal == "Journal of Monetary Economics"
replace field = "Macro" if journal == "JMCB"
replace field = "Macro" if journal == "Journal of Macroeconomics"
replace field = "Macro" if journal == "Macroeconomic Dynamics"
replace field = "Macro" if journal == "Review of International Econ"
replace field = "Macro" if journal == "Economic Modelling"
replace field = "Macro" if journal == "Journal of International Economics"
replace field = "Macro" if journal == "Journal of Economic Growth"
replace field = "Macro" if journal == "Journal of Development Economics"
replace field = "Macro" if journal == "Journal of Development Studies"
replace field = "Macro" if journal == "China Economic Review"
replace field = "Macro" if journal == "Review of Development Economics"
replace field = "Macro" if journal == "The World Economy"
replace field = "Macro" if journal == "World Development"
replace field = "Macro" if journal == "Journal of African Economics"
replace field = "Macro" if journal == "Journal of Policy Modeling"

// Finance
replace field = "Finance" if journal == "Journal of Financial Economics"
replace field = "Finance" if journal == "Journal of Finance"
replace field = "Finance" if journal == "Review of Financial Studies"
replace field = "Finance" if journal == "JFQA"
replace field = "Finance" if journal == "Journal of Banking and Finance"
replace field = "Finance" if journal == "Journal of Corporate Finance"
replace field = "Finance" if journal == "Journal of Empirical Finance"
replace field = "Finance" if journal == "Quarterly Review of Econ and Finance"
replace field = "Finance" if journal == "Review of Financial Economics"
replace field = "Finance" if journal == "Review of Quant Finance and Accounting"
replace field = "Finance" if journal == "International Finance"

// Applied Microeconometrics
replace field = "Applied Microeconometrics" if journal == "American Economic Journal-Applied Econ"
replace field = "Applied Microeconometrics" if journal == "American Economic Journal-Econ Policy"
replace field = "Applied Microeconometrics" if journal == "Journal of Labor Economics"
replace field = "Applied Microeconometrics" if journal == "Journal of Human Resources"
replace field = "Applied Microeconometrics" if journal == "Labour Economics"
replace field = "Applied Microeconometrics" if journal == "Journal of Health Econ"
replace field = "Applied Microeconometrics" if journal == "Health Economics"
replace field = "Applied Microeconometrics" if journal == "Econ of Education Review"
replace field = "Applied Microeconometrics" if journal == "Education Economics"
replace field = "Applied Microeconometrics" if journal == "Journal of Sports Economics"
replace field = "Applied Microeconometrics" if journal == "Journal of Economics of Ageing"
replace field = "Applied Microeconometrics" if journal == "Journal of Public Economics"
replace field = "Applied Microeconometrics" if journal == "Public Choice"
replace field = "Applied Microeconometrics" if journal == "Review of Income and Wealth"
replace field = "Applied Microeconometrics" if journal == "Journal of Econ Inequality"
replace field = "Applied Microeconometrics" if journal == "American Journal of Agri Econ"
replace field = "Applied Microeconometrics" if journal == "JEBO"
replace field = "Applied Microeconometrics" if journal == "Journal of Econ Psych"
replace field = "Applied Microeconometrics" if journal == "Empirical Econ"
replace field = "Applied Microeconometrics" if journal == "Journal of Cultural Econ"
replace field = "Applied Microeconometrics" if journal == "Journal of Wine Economics"
replace field = "Applied Microeconometrics" if journal == "Journal of Behav and Exp Econ"
replace field = "Applied Microeconometrics" if journal == "Journal of Asian Economics"
replace field = "Applied Microeconometrics" if journal == "Asian Economic Papers"
replace field = "Applied Microeconometrics" if journal == "Japanese Economic Review"
replace field = "Applied Microeconometrics" if journal == "Pacific Economic Review"
replace field = "Applied Microeconometrics" if journal == "Journal of Benefit-Cost Analysis"
replace field = "Applied Microeconometrics" if journal == "Journal of Urban Econ"
replace field = "Applied Microeconometrics" if journal == "Regional Science and Urban Econ"
replace field = "Applied Microeconometrics" if journal == "Journal of Regional Science"
replace field = "Applied Microeconometrics" if journal == "Regional Studies"
replace field = "Applied Microeconometrics" if journal == "Papers in Regional Science"

// Other (Fallback, just in case)
replace field = "Other" if field == ""
encode field, gen(field_num)

**0.1%
gen mean_gemma0score = (gemma0score1+ gemma0score2+ gemma0score3)/3
gen mean_gm_0originality = ( gemma0originality1 + gemma0originality2 + gemma0originality3)/3
gen mean_gm_0rigor = ( gemma0rigor1+ gemma0rigor2+ gemma0rigor3)/3
gen mean_gm_0scope = ( gemma0scope1+ gemma0scope2+ gemma0scope3)/3
gen mean_gm_0impact = ( gemma0impact1 + gemma0impact2 + gemma0impact3 )/3
gen mean_gm_0ai = (gemma0written_by_ai1+gemma0written_by_ai2+gemma0written_by_ai3)/3

*1%
gen mean_gemma1score = (gemma1score1+ gemma1score2+ gemma1score3)/3
gen mean_gm_1originality = ( gemma1originality1 + gemma1originality2 + gemma1originality3)/3
gen mean_gm_1rigor = ( gemma1rigor1+ gemma1rigor2+ gemma1rigor3)/3
gen mean_gm_1scope = ( gemma1scope1+ gemma1scope2+ gemma1scope3)/3
gen mean_gm_1impact = ( gemma1impact1 + gemma1impact2 + gemma1impact3 )/3
gen mean_gm_1ai = (gemma1written_by_ai1+gemma1written_by_ai2+gemma1written_by_ai3)/3

*10%
gen mean_gemma10score = (gemma10score1+ gemma10score2+ gemma10score3)/3
gen mean_gm_10originality = ( gemma10originality1 + gemma10originality2 + gemma10originality3)/3
gen mean_gm_10rigor = ( gemma10rigor1+ gemma10rigor2+ gemma10rigor3)/3
gen mean_gm_10scope = ( gemma10scope1+ gemma10scope2+ gemma10scope3)/3
gen mean_gm_10impact = ( gemma10impact1 + gemma10impact2 + gemma10impact3 )/3
gen mean_gm_10ai = (gemma10written_by_ai1+gemma10written_by_ai2+gemma10written_by_ai3)/3

*50%
gen mean_gemma50score = (gemma50score1+ gemma50score2+ gemma50score3)/3
gen mean_gm_50originality = ( gemma50originality1 + gemma50originality2 + gemma50originality3)/3
gen mean_gm_50rigor = ( gemma50rigor1+ gemma50rigor2+ gemma50rigor3)/3
gen mean_gm_50scope = ( gemma50scope1+ gemma50scope2+ gemma50scope3)/3
gen mean_gm_50impact = ( gemma50impact1 + gemma50impact2 + gemma50impact3 )/3
gen mean_gm_50ai = (gemma50written_by_ai1+gemma50written_by_ai2+gemma50written_by_ai3)/3

*100%
gen mean_gemma100score = (gemma100score1+ gemma100score2+ gemma100score3)/3
gen mean_gm_100originality = ( gemma100originality1 + gemma100originality2 + gemma100originality3)/3
gen mean_gm_100rigor = ( gemma100rigor1+ gemma100rigor2+ gemma100rigor3)/3
gen mean_gm_100scope = ( gemma100scope1+ gemma100scope2+ gemma100scope3)/3
gen mean_gm_100impact = ( gemma100impact1 + gemma100impact2 + gemma100impact3 )/3
gen mean_gm_100ai = (gemma100written_by_ai1+gemma100written_by_ai2+gemma100written_by_ai3)/3

 
**Test slopes
binsreg mean_gemma0score rank lenanon* i.field_num,  nbins(100) vce(robust) ci(3)  polyreg(3)  xtitle("Ordinal ranking of journals", size(small)) ytitle("Average impact rating") title("0.1% of text", size(small)) polyregplotopt(lcolor(red) lp(dash)) ciplotopt(lc(stblue*.4)) dotsplotopt(mcolor(stblue*.4))

graph save appendix_increment1.gph, replace

binsreg mean_gemma1score rank lenanon* i.field_num,  nbins(100) vce(robust) ci(3) polyreg(3)  xtitle("Ordinal ranking of journals", size(small)) ytitle("Average impact rating") title("1% of text", size(small)) polyregplotopt(lcolor(red) lp(dash)) ciplotopt(lc(stblue*.4)) dotsplotopt(mcolor(stblue*.4))

graph save appendix_increment2.gph, replace

binsreg mean_gemma10score rank lenanon* i.field_num,  nbins(100) vce(robust) ci(3) polyreg(3)  xtitle("Ordinal ranking of journals", size(small)) ytitle("Average impact rating") title("10% of text", size(small)) polyregplotopt(lcolor(red) lp(dash)) ciplotopt(lc(stblue*.4)) dotsplotopt(mcolor(stblue*.4))

graph save appendix_increment3.gph, replace

binsreg mean_gemma50score rank lenanon* i.field_num,  nbins(100) vce(robust) ci(3) polyreg(3)  xtitle("Ordinal ranking of journals", size(small)) ytitle("Average impact rating") title("50% of text", size(small)) polyregplotopt(lcolor(red) lp(dash)) ciplotopt(lc(stblue*.4)) dotsplotopt(mcolor(stblue*.4))

graph save appendix_increment4.gph, replace

binsreg mean_gemma100score rank lenanon* i.field_num,  nbins(100) vce(robust) ci(3)  polyreg(3)  xtitle("Ordinal ranking of journals", size(small)) ytitle("Average impact rating") title("100% of text", size(small)) polyregplotopt(lcolor(red) lp(dash)) ciplotopt(lc(stblue*.4)) dotsplotopt(mcolor(stblue*.4))

graph save appendix_increment5.gph, replace 

graph combine "appendix_increment1.gph" "appendix_increment2.gph" "appendix_increment3.gph" "appendix_increment4.gph" "appendix_increment5" , ycommon
graph save appendix_increment_combine.gph, replace
graph export Fig5.png, replace

********************************************************
 
**Table 1: Test AI biases 
import delimited "/Users/nattavudhpowdthavee/Library/CloudStorage/Dropbox/AI journal project/Data/New data/bias.csv", clear 

gen ai_bias = 1
replace lenanond = lenanond/100
gen lenanond_sq = lenanond^2/100

save ai_bias.dta, replace

u journal.dta, clear

append using ai_bias.dta, force

sort id 
by id: egen m_ai_bias = max(ai_bias)
drop if m_ai_bias == .

gen rank_bias = real(rank) if !inlist(substr(rank,1,1),"P")

gen male = 0  
replace male = 1 if strpos(author, "ran0") > 0 ///
                | strpos(author, "ran1") > 0 ///
                | strpos(author, "ran2") > 0 ///
                | strpos(author, "ran3") > 0 ///
                | strpos(author, "ran4") > 0 ///
				| strpos(author, "top0") > 0 ///
                | strpos(author, "top1") > 0 ///
                | strpos(author, "top2") > 0 ///
                | strpos(author, "top3") > 0 ///
                | strpos(author, "top4") > 0 
replace male = 2 if strpos(author, "ran5") > 0 ///
				| strpos(author, "ran6") > 0 ///
				| strpos(author, "ran7") > 0 ///
				| strpos(author, "ran8") > 0 ///
				| strpos(author, "ran9") > 0 ///
				| strpos(author, "top5") > 0 ///
				| strpos(author, "top6") > 0 ///
				| strpos(author, "top7") > 0 ///
				| strpos(author, "top8") > 0 ///
				| strpos(author, "top9") > 0
		
		
gen author_name=0
replace author_name = 1 if substr(author, 1, 3) == "top"
replace author_name = 2 if substr(author, 1, 3) == "ran"

lab def author_name 1 "top authors" 2 "random authors"
lab val author_name author_name

gen author_name2 = 0 
replace author_name2 = 1 if author_name == 1 & male==1
replace author_name2 = 2 if author_name == 1 & male==2
replace author_name2 = 3 if author_name == 2 & male==1
replace author_name2 = 4 if author_name == 2 & male==2

lab def author_name2 1 "top male authors" 2 "top female authors" 3 "random male authors" 4 "random female authors"
lab val author_name2 author_name2


gen institution=0
replace institution = 1 if author=="ins0" 
replace institution = 2 if author=="ins1"
replace institution = 3 if author=="ins2"
replace institution = 4 if author=="ins3"
replace institution = 5 if author=="ins4"
replace institution = 6 if author=="ins5"

lab def institution 0 "Blind" 1 "MIT" 2 "Harvard" 3 "LSE" 4 "Capetown" 5 "Nanyang" 6 "Chula"
lab val institution institution
 

drop field_n

// General
replace field = "General" if journal == "Econometrica"
replace field = "General" if journal == "Quarterly Journal of Economics"
replace field = "General" if journal == "American Economic Review"
replace field = "General" if journal == "Journal of Political Economy"
replace field = "General" if journal == "Review of Economic Studies"
replace field = "General" if journal == "Review of Econ and Stats"
replace field = "General" if journal == "Economic Journal"
replace field = "General" if journal == "JEEA"
replace field = "General" if journal == "European Econ Review"
replace field = "General" if journal == "International Econ Review"
replace field = "General" if journal == "Oxford Bulletin of Econ and Stat"
replace field = "General" if journal == "Scandinavian J of Econ"
replace field = "General" if journal == "Canadian J of Econ"
replace field = "General" if journal == "Econ Inquiry"
replace field = "General" if journal == "Economica"
replace field = "General" if journal == "Kyklos"
replace field = "General" if journal == "Manchester School"
replace field = "General" if journal == "Empirica"
replace field = "General" if journal == "Scottish Journal of Pol Econ"
replace field = "General" if journal == "Southern Economic Journal"
replace field = "General" if journal == "Metroeconomica"
replace field = "General" if journal == "Applied Economics"

// Micro
replace field = "Micro" if journal == "Experimental Econ"
replace field = "Micro" if journal == "Journal of Economic Theory"
replace field = "Micro" if journal == "Journal of Risk and Uncertainty"
replace field = "Micro" if journal == "American Economic Journal-Micoecon"
replace field = "Micro" if journal == "Journal of Mathematical Econ"
replace field = "Micro" if journal == "Computational Economics"
replace field = "Micro" if journal == "Journal of Econ Dynamic and Control"
replace field = "Micro" if journal == "RAND Journal of Economics"
replace field = "Micro" if journal == "Theoretical Economics"
replace field = "Micro" if journal == "Economic Theory"
replace field = "Micro" if journal == "Theory and Decision"
replace field = "Micro" if journal == "Games and Econ Behav"

// Macro
replace field = "Macro" if journal == "American Economic Journal-Macro"
replace field = "Macro" if journal == "Journal of Monetary Economics"
replace field = "Macro" if journal == "JMCB"
replace field = "Macro" if journal == "Journal of Macroeconomics"
replace field = "Macro" if journal == "Macroeconomic Dynamics"
replace field = "Macro" if journal == "Review of International Econ"
replace field = "Macro" if journal == "Economic Modelling"
replace field = "Macro" if journal == "Journal of International Economics"
replace field = "Macro" if journal == "Journal of Economic Growth"
replace field = "Macro" if journal == "Journal of Development Economics"
replace field = "Macro" if journal == "Journal of Development Studies"
replace field = "Macro" if journal == "China Economic Review"
replace field = "Macro" if journal == "Review of Development Economics"
replace field = "Macro" if journal == "The World Economy"
replace field = "Macro" if journal == "World Development"
replace field = "Macro" if journal == "Journal of African Economics"
replace field = "Macro" if journal == "Journal of Policy Modeling"

// Finance
replace field = "Finance" if journal == "Journal of Financial Economics"
replace field = "Finance" if journal == "Journal of Finance"
replace field = "Finance" if journal == "Review of Financial Studies"
replace field = "Finance" if journal == "JFQA"
replace field = "Finance" if journal == "Journal of Banking and Finance"
replace field = "Finance" if journal == "Journal of Corporate Finance"
replace field = "Finance" if journal == "Journal of Empirical Finance"
replace field = "Finance" if journal == "Quarterly Review of Econ and Finance"
replace field = "Finance" if journal == "Review of Financial Economics"
replace field = "Finance" if journal == "Review of Quant Finance and Accounting"
replace field = "Finance" if journal == "International Finance"

// Applied Microeconometrics
replace field = "Applied Microeconometrics" if journal == "American Economic Journal-Applied Econ"
replace field = "Applied Microeconometrics" if journal == "American Economic Journal-Econ Policy"
replace field = "Applied Microeconometrics" if journal == "Journal of Labor Economics"
replace field = "Applied Microeconometrics" if journal == "Journal of Human Resources"
replace field = "Applied Microeconometrics" if journal == "Labour Economics"
replace field = "Applied Microeconometrics" if journal == "Journal of Health Econ"
replace field = "Applied Microeconometrics" if journal == "Health Economics"
replace field = "Applied Microeconometrics" if journal == "Econ of Education Review"
replace field = "Applied Microeconometrics" if journal == "Education Economics"
replace field = "Applied Microeconometrics" if journal == "Journal of Sports Economics"
replace field = "Applied Microeconometrics" if journal == "Journal of Economics of Ageing"
replace field = "Applied Microeconometrics" if journal == "Journal of Public Economics"
replace field = "Applied Microeconometrics" if journal == "Public Choice"
replace field = "Applied Microeconometrics" if journal == "Review of Income and Wealth"
replace field = "Applied Microeconometrics" if journal == "Journal of Econ Inequality"
replace field = "Applied Microeconometrics" if journal == "American Journal of Agri Econ"
replace field = "Applied Microeconometrics" if journal == "JEBO"
replace field = "Applied Microeconometrics" if journal == "Journal of Econ Psych"
replace field = "Applied Microeconometrics" if journal == "Empirical Econ"
replace field = "Applied Microeconometrics" if journal == "Journal of Cultural Econ"
replace field = "Applied Microeconometrics" if journal == "Journal of Wine Economics"
replace field = "Applied Microeconometrics" if journal == "Journal of Behav and Exp Econ"
replace field = "Applied Microeconometrics" if journal == "Journal of Asian Economics"
replace field = "Applied Microeconometrics" if journal == "Asian Economic Papers"
replace field = "Applied Microeconometrics" if journal == "Japanese Economic Review"
replace field = "Applied Microeconometrics" if journal == "Pacific Economic Review"
replace field = "Applied Microeconometrics" if journal == "Journal of Benefit-Cost Analysis"
replace field = "Applied Microeconometrics" if journal == "Journal of Urban Econ"
replace field = "Applied Microeconometrics" if journal == "Regional Science and Urban Econ"
replace field = "Applied Microeconometrics" if journal == "Journal of Regional Science"
replace field = "Applied Microeconometrics" if journal == "Regional Studies"
replace field = "Applied Microeconometrics" if journal == "Papers in Regional Science"

// Other (Fallback, just in case)
replace field = "Other" if field == ""

encode field, gen(field_num)

drop rank_num rank_band
gen rank_num = real(rank) if !inlist(substr(rank,1,1),"P")

gen rank_band = .
replace rank_band = 1 if rank_num>=1 & rank_num<=25
replace rank_band = 2 if rank_num>25 & rank_num<=50
replace rank_band = 3 if rank_num>50 & rank_num<=75
replace rank_band = 4 if rank_num>75 & rank_num<=100
replace rank_band = 5 if rank_num==.

lab def rank_band 1 "Top 1-25 ranked journals" 2 "26th-50th ranked" 3 "51st-75th ranked" 4 "76th-100th ranked" 5 "Unranked papers"   , modify
lab val rank_band rank_band  
  
 
**Top 5 rating
asdocx reg openaiscore1 i.rank_band i.author_name2 i.institution lenanond lenanond_sq i.field_n, r cluster(id) save(Table1.docx)  title(GPT) label fs(9) nested replace   
asdocx reg anthropicscore1 i.rank_band i.author_name2 i.institution lenanond lenanond_sq i.field_n, r cluster(id) save(Table1.docx)  title(CLAUDE) label fs(9) nested append  
asdocx reg gemmascore1 i.rank_band i.author_name2 i.institution  lenanond lenanond_sq i.field_n, r cluster(id) save(Table1.docx)  title(GEMMA) label fs(9) nested append    
asdocx reg llamascore1 i.rank_band i.author_name2 i.institution lenanond lenanond_sq i.field_n, r cluster(id) save(Table1.docx)  title(GEMMA) label fs(9) nested append      


******************************************
u journal.dta, clear 

**Appendix C
**IMSE - binsregtest
**With CI
*Ordinal ranking
binsreg mean_gptscore rank_num lenanon* i.field_num,   vce(robust) line(1) ci(3) cb(3)  polyreg(3)  xtitle("Ordinal ranking of journals", size(small)) ytitle("Average top 5 rating") title("GPT", size(small)) polyregplotopt(lcolor(red) lp(dash))  ciplotopt(lc(dknavy)) dotsplotopt(mcolor(dknavy))    
 
graph save fig1oa_extra.gph, replace

**Top 5 accept - CLAUDE
binsreg mean_anthropicscore rank_num lenanon* i.field_num,   vce(robust) line(1) ci(3) cb(3)   polyreg(3)   xtitle("Ordinal ranking of journals", size(small)) ytitle("Average top 5 rating") title("CLAUDE", size(small)) polyregplotopt(lcolor(red) lp(dash)) ciplotopt(lc(dknavy)) dotsplotopt(mcolor(dknavy))    

graph save fig1claude_extra.gph, replace

**Top 5 accept - Gemmani
binsreg mean_gemmascore rank_num lenanon* i.field_num,  vce(robust) line(1) ci(3) cb(3)   polyreg(3)   xtitle("Ordinal ranking of journals", size(small)) ytitle("Average top 5 rating") title("GEMMA", size(small)) polyregplotopt(lcolor(red) lp(dash)) ciplotopt(lc(dknavy)) dotsplotopt(mcolor(dknavy))    

graph save fig1gemma_extra.gph, replace

**Top 5 accept - Llama
binsreg mean_llamascore rank_num lenanon* i.field_num, vce(robust) line(1) ci(3) cb(3)   polyreg(3)   xtitle("Ordinal ranking of journals", size(small)) ytitle("Average top 5 rating") title("LLAMA", size(small)) polyregplotopt(lcolor(red) lp(dash)) ciplotopt(lc(dknavy)) dotsplotopt(mcolor(dknavy))    

graph save fig1llama_extra.gph, replace

graph combine "fig1oa_extra.gph" "fig1claude_extra.gph" "fig1gemma_extra.gph" "fig1llama_extra.gph" 
graph save fig1combine_extra.gph, replace
graph export AppendixC_PanelA.png, replace


**IMSE-optimised
binsreg mean_gptscore repec_ranking,    vce(robust) line(1) ci(3) cb(3)  polyreg(3)  xtitle("RePEc Ranking (Feb 2025)", size(small)) ytitle("Average top 5 rating") title("GPT", size(small)) polyregplotopt(lcolor(red) lp(dash)) ciplotopt(lc(dknavy)) dotsplotopt(mcolor(dknavy))

graph save appendA1oa_extra.gph, replace

**Top 5 accept - CLAUDE
binsreg mean_anthropicscore repec_ranking,   vce(robust) line(1) ci(3) cb(3)   polyreg(3)   xtitle("RePEc Ranking (Feb 2025)", size(small)) ytitle("Average top 5 rating") title("CLAUDE", size(small)) polyregplotopt(lcolor(red) lp(dash)) ciplotopt(lc(dknavy)) dotsplotopt(mcolor(dknavy))


graph save appendA1claude_extra.gph, replace

**Top 5 accept - Gemmani
binsreg mean_gemmascore repec_ranking, vce(robust) line(1) ci(3) cb(3)   polyreg(3)   xtitle("RePEc Ranking (Feb 2025)", size(small)) ytitle("Average top 5 rating") title("GEMMA", size(small)) polyregplotopt(lcolor(red) lp(dash)) ciplotopt(lc(dknavy)) dotsplotopt(mcolor(dknavy))

graph save appendA1gemma_extra.gph, replace

**Top 5 accept - Llama
binsreg mean_llamascore repec_ranking,  vce(robust) line(1) ci(3) cb(3)   polyreg(3)   xtitle("RePEc Ranking (Feb 2025)", size(small)) ytitle("Average top 5 rating") title("LLAMA", size(small)) polyregplotopt(lcolor(red) lp(dash)) ciplotopt(lc(dknavy)) dotsplotopt(mcolor(dknavy))


graph save appendA1llama_extra.gph, replace

graph combine "appendA1oa_extra.gph" "appendA1claude_extra.gph" "appendA1gemma_extra.gph" "appendA1llama_extra.gph"  
graph save appendA1combine_extra.gph, replace
graph export AppendixC_PanelB.png, replace

***********************************

**Appendix D: Comparing between Ranked and MDPI economics papers and AI papers
*Open AI
cibar mean_gptscore, over(rank_band2) ///
ciopts(lcolor(purple) lwidth(medium)) barcolor(%60 %60 %60 %60 %60 %60 %60 %60 %60 %60 %60 %60 %60)  ///
graphopts(ytitle(Average top 5 rating)   /// here is where "graphopts( )" begins
xtitle("Open AI"))   

graph save appendixai1_oa.gph, replace

*CLAUDE
cibar mean_anthropicscore, over(rank_band2) ///
ciopts(lcolor(purple) lwidth(medium)) barcolor(%60 %60 %60 %60 %60 %60 %60 %60 %60 %60 %60 %60 %60)  ///
graphopts(ytitle(Average top 5 rating)   /// here is where "graphopts( )" begins
xtitle("CLAUDE"))  

graph save appendixai1_claude.gph, replace

*GEMMA
cibar mean_gemmascore, over(rank_band2) ///
ciopts(lcolor(purple) lwidth(medium)) barcolor(%60 %60 %60 %60 %60 %60 %60 %60 %60 %60 %60 %60 %60)  ///
graphopts(ytitle(Average top 5 rating)   /// here is where "graphopts( )" begins
xtitle("GEMMA"))  

graph save appendixai1_gemma.gph, replace

*LLAMA
cibar mean_llamascore, over(rank_band2) ///
ciopts(lcolor(purple) lwidth(medium)) barcolor(%60 %60 %60 %60 %60 %60 %60 %60 %60 %60 %60 %60 %60)  ///
graphopts(ytitle(Average top 5 rating)   /// here is where "graphopts( )" begins
xtitle("LLAMA"))  

graph save appendixai1_llama.gph, replace

grc1leg2 "appendixai1_oa.gph" "appendixai1_claude.gph" "appendixai1_gemma.gph" "appendixai1_llama.gph" , position(3)
graph save appendixai1_combine.gph, replace
graph export appendixai1_combine.png, replace

**Coefplot
est clear
eststo A: reg mean_gptscore b1.rank_band2 lenanon* i.field_n, vce(robust)  
eststo B: reg mean_anthropicscore b1.rank_band2 lenanon* i.field_n, vce(robust)  
eststo C: reg mean_gemmascore b1.rank_band2 lenanon* i.field_n, vce(robust)  
eststo D: reg mean_llamascore b1.rank_band2 lenanon* i.field_n, vce(robust)  

coefplot (A, label(GPT) bcolor(%60)) (B, label(CLAUDE) bcolor(%60)) ///
(C, label(GEMMA) bcolor(%60)) (D, label(LLAMA) bcolor(%60)), keep(6.rank_band2 7.rank_band2 8.rank_band2 9.rank_band2 10.rank_band2 11.rank_band2)   ///
    recast(bar) ///
    title("Top 5 Journal Rating", size(small)) ///
    xlabel(, labsize(small)) ///
	ylabel(, labsize(small))  ///
    mlabposition(12) ///
    mlabsize(small) ciopts(recast(rcap)) citop barwidt(0.2) legend(rows(2) size(vsmall)) 

graph save appendix_coefplotA.gph, replace
graph export AppendixD_PanelA.png, replace

**Testing written by AI
*Open AI
cibar mean_oa_ai, over(rank_band2) ///
ciopts(lcolor(purple) lwidth(medium)) barcolor(%60 %60 %60 %60 %60 %60 %60 %60 %60 %60 %60 %60 %60)  ///
graphopts(ytitle(Average rating written by AI)   /// here is where "graphopts( )" begins
xtitle("Open AI"))   

graph save appendixai2_oa.gph, replace

*CLAUDE
cibar mean_a_ai, over(rank_band2) ///
ciopts(lcolor(purple) lwidth(medium)) barcolor(%60 %60 %60 %60 %60 %60 %60 %60 %60 %60 %60 %60 %60)  ///
graphopts(ytitle(Average rating written by AI)   /// here is where "graphopts( )" begins
xtitle("CLAUDE"))  

graph save appendixai2_claude.gph, replace

*GEMMA
cibar mean_gm_ai, over(rank_band2) ///
ciopts(lcolor(purple) lwidth(medium)) barcolor(%60 %60 %60 %60 %60 %60 %60 %60 %60 %60 %60 %60 %60)  ///
graphopts(ytitle(Average rating written by AI)   /// here is where "graphopts( )" begins
xtitle("GEMMA"))  

graph save appendixai2_gemma.gph, replace

*LLAMA
cibar mean_lm_ai, over(rank_band2) ///
ciopts(lcolor(purple) lwidth(medium)) barcolor(%60 %60 %60 %60 %60 %60 %60 %60 %60 %60 %60 %60 %60)  ///
graphopts(ytitle(Average rating written by AI)   /// here is where "graphopts( )" begins
xtitle("LLAMA"))  

graph save appendixai2_llama.gph, replace

grc1leg2 "appendixai2_oa.gph" "appendixai2_claude.gph" "appendixai2_gemma.gph" "appendixai2_llama.gph" , position(3)
graph save appendixai2_combine.gph, replace
graph export appendixai2_combine.png, replace


**Coefplot
est clear
eststo A: reg mean_oa_ai b1.rank_band2 lenanon* i.field_n, vce(robust)  
eststo B: reg mean_a_ai b1.rank_band2 lenanon* i.field_n, vce(robust)  
eststo C: reg mean_gm_ai b1.rank_band2 lenanon* i.field_n, vce(robust)  
eststo D: reg mean_lm_ai b1.rank_band2 lenanon* i.field_n, vce(robust)  

coefplot (A, label(GPT) bcolor(%60)) (B, label(CLAUDE) bcolor(%60)) ///
(C, label(GEMMA) bcolor(%60)) (D, label(LLAMA) bcolor(%60)), keep(6.rank_band2 7.rank_band2 8.rank_band2 9.rank_band2 10.rank_band2 11.rank_band2)   ///
    recast(bar) ///
    title("Written by AI Rating", size(small)) ///
    xlabel(, labsize(small)) ///
	ylabel(, labsize(small))  ///
    mlabposition(12) ///
    mlabsize(small) ciopts(recast(rcap)) citop barwidt(0.2) legend(rows(2) size(vsmall)) 

graph save appendix_coefplotB.gph, replace
graph export AppendixD_PanelB.png, replace
