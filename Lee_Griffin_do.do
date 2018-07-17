*****Hi! so below is the entire do file from my master’s thesis, *****

*****the beginning is just collapsing and relabeling variables (22 - 139)*****
*****the middle is mostly cleaning data and setting things up 140 - 217)*****
*****the end are my regressions (217 - 304)*****

use "Standard QOG Dateset Here", clear

egen comb_gini5 = rmean( ds_gini wdi_gini)
label var comb_gini5 "Averaged Gini Scores"

gen gle_fullpop = gle_pop*1000
gen gle_gdp2 = gle_cgdpc* gle_fullpop
gen wdi_realgdp = wdi_gdpcapcur * wdi_pop

local startyear "1946"

*****I collapsed my original dataset into 5-year panels, I only started with 5 or so variables*****
*****...but little by little that grew to 76 variables, and now I look like a crazy person for relabeling them all*****

gen year5 = 5*floor(year/5) if year >= `startyear'

collapse comb_gini5 aid_crsc aid_crsio ds_gini wdi_gini ajr_settmort ///
wbgi_gen wdi_empagr wdi_exphpu wdi_expmil eiu_cl eiu_fog eiu_pp ///
wdi_gdpgr wdi_gnicur wdi_gnigr wef_dpf bci_bci p_autoc ffp_ued gd_ptss ///
wdi_poprul wdi_popden wdi_mortu5 wef_chiv wdi_incsh10h fh_rol gd_ptsa ///
wdi_incsh10l wdi_incsh20h wdi_incsh20l wdi_unemp wdi_trade hf_corrupt ///
ti_cpi icrg_qog vdem_corr fao_fe fe_cultdiv fe_etfra fh_ipolity2 gle_pop ///
ht_colonial p_democ p_durable gle_trade  wdi_gdpcapcur gle_gdp2 ///
wdi_realgdp wbgi_cce fh_fotpsc ross_oil_prod wdi_acis hf_financ wdi_inflation ///
wdi_armimp cspv_civwar wdi_pop bmr_demdur wdi_tele wdi_refasy wdi_powcon ///
wdi_oilrent wdi_mortinf wdi_lifexp wdi_internet wdi_export wdi_co2 uds_mean ///
ross_oil_exp ictd_taxexsc dr_sg dr_pg dr_ig dr_eg wdi_gdpind wdi_gdpser ///
ht_region dpi_cemo arda_chprtpct, by (ccode year5)

*****Creating my Panel Var*****

gen panel = 0
replace panel =1 if year == 1945
replace panel =2 if year == 1950
replace panel =3 if year == 1955
replace panel = 4 if year == 1960
replace panel = 5 if year == 1965
replace panel = 6 if year == 1970
replace panel = 7 if year == 1975
replace panel = 8 if year == 1980
replace panel = 9 if year == 1985
replace panel = 10 if year == 1990
replace panel = 11 if year == 1995
replace panel = 12 if year == 2000
replace panel = 13 if year == 2005
replace panel = 14 if year == 2010
replace panel = 15 if year == 2015

rename ds_gini ds_gini5
rename wdi_gini wdi_gini5
rename aid_crsc aid_crsc5
rename aid_crsio aid_crsio5

*****Relabeling Vars*****-->(Its a little excessive)

label var arda_chprtpct "% of pop is prodestent"
label var dpi_cemo "is chief exutive a military officer?"
label var ht_region "region"
label var wdi_gdpind "% of gdp that comes from industy"
label var wdi_gdpser "% of gdp that comes from services"
label var wdi_export "% of gdp that is exports"
label var wdi_co2 "metric tons per captia"
label var uds_mean "Unified Democracy score"
label var ross_oil_exp "oil exports, thosends barrels daily"
label var ictd_taxexsc "taxes paid"
label var dr_sg "social globlization"
label var dr_pg "political globlization"
label var dr_ig "globlization"
label var dr_eg "economic globlization"
label var wdi_oilrent "maybe differnce in oil prices"
label var wdi_mortinf "infant mortaily"
label var wdi_lifexp "life expiticy at birth"
label var wdi_internet "internet uses in the year %"
label var wdi_powcon "power consumtion per captia"
label var wdi_refasy "Refugee poulation by country"
label var wdi_tele "% of fixed telephone subscriptions"
label var bmr_demdur "Concutive years of reiume type"
label var wdi_armimp "arm imports"
label var wdi_inflation "indexed inflation? or somthing"
label var cspv_civwar "magnitude of civil war"
label var hf_financ "Finacal freedom"
label var wdi_acis "percent access to sanitation"
label var ross_oil_prod "oil produced in metric tons"
label var ht_colonial "ever a colony"
label var fh_fotpsc "Freedom of the Press"
label var wbgi_cce "WGI corruption index"
label var gle_gdp2 "GLE real GDP in current prices"
label var  wdi_gdpcapcur "GDP current US dollars" 
label var gle_trade "total trade"
label var hf_corrupt "Freedom house Corrupt index"
label var ti_cpi "corruption prepcetion index"
label var icrg_qog "icrg quaility of governece index"
label var vdem_corr "the fourth corruption index"
label var comb_gini5 "combine Gini"
label var aid_crsc "Sum of commitments from donors"
label var aid_crsio "Sum of Commitments from international org."
label var ds_gini "DS gini index"
label var wdi_gini "world devlopment index Gini"
label var ajr_settmort "AJR settler mortailty"
label var wbgi_gen "index of gov effectivness WB"
label var wdi_empagr "% of enployed in agriculture"
label var wdi_exphpu "% of GDP that goes towards public health"
label var wdi_expmil "% of GDP towards military"
label var eiu_cl "maybe index of civil liberties"
label var eiu_fog "Seems index of gov funtioning"
label var eiu_pp "index of policital particapation"
label var wdi_gdpgr "growth rate of gdp"
label var wdi_gnicur "WB mesure of current GNI"
label var wdi_gnigr "GNI growth rate"
label var wef_dpf "diversion of public funds index"
label var bci_bci "Bayesian Corruption indicator"
label var p_autoc "insitutionalized autocracy"
label var ffp_ued "Uneven Economic Development"
label var gd_ptss "politcal terror scale- US state department"
label var wdi_poprul "Rural pop %"
label var wdi_popden "population density"
label var wdi_mortu5 "under five mortiality rate"
label var wef_chiv "HIV prevalence % 15 - 49"
label var wdi_incsh10h "Income share held by top 10%"
label var wdi_incsh10l "Income share held by lowest 10%"
label var wdi_incsh20h "Income share held by top 20%"
label var wdi_incsh20l "Income share held by lowest 20%"
label var wdi_unemp "% of total unemplymemt"
label var wdi_trade "% of GDP that comes from trade"
label var fao_fe "fish exports in tons"
label var fe_cultdiv "cultural diveristy"
label var fe_etfra "ethnic fractionization"
label var fh_ipolity2 "level of democrcy"
label var gle_pop "pop in 1000's"
label var ht_colonial "colonial origians"
label var p_democ "Institionlized democarcies"
label var p_durable "regeium durabilty"

*****save "Optional Save of Base Dataset", replace*****

*****creating new independent variables***** -->(These are my foreign aid varibles (aid as a % of GDP))

gen pctaidIO_wdi = aid_crsio/wdi_realgdp
gen pctaidIO_gle = aid_crsio/gle_gdp2
gen pctaidC_gle = aid_crsc/gle_gdp2
gen pctaidC_wdi = aid_crsc/wdi_realgdp

label var pctaidIO_wdi "IO precent of aid of GDP from WDI"
label var pctaidIO_gle "IO precent of aid of GDP from GLE"
label var pctaidC_gle "C precent of aid of GDP from GLE"
label var pctaidC_wdi "C precent of aid of GDP from WDI"

save "Save Base Dataset", replace

*****Merging the country names to my data set (Yeah this probably could have been done an easier way)*****
*****The reason that I did this ugly merge is that for some reason I could not collapse a string and a intger at the same time*****

use "Base Date Set", clear
keep ccode cname year
gen year5 = 5*floor(year/5) if year >= 1946 
drop year
collapse (last) cname, by (ccode year) 
save "Merge Data set"
merge 1:1 ccode year5 using "Merge Data Set"

save "Base Dataset2", replace

*****editing/ scaling my variables****

replace ht_colonial = 1 if ht_colonial >= 1
replace icrg_qog = (icrg/-1)
replace icrg_qog = (icrg + 1)
replace ti = (ti/100)
replace bci = (bci/100)
replace wbgi_cce = (wbgi_cce + 2.1)
replace wbgi_cce = (wbgi_cce/4.5)
sum ti bci_bci wbgi_cce icrg vdem
replace wdi_acis = (wdi_acis/100)
replace fh_fotpsc = (fh_fotpsc/100)
replace p_dem = (p_dem/10)
replace gd_ptss = (gd_ptss/5)
replace wdi_poprul = (wdi_poprul/ 100)
gen lnwdi_trade = (ln(wdi_trade))
replace wdi_mortu5 = (ln(wdi_mortu5))
replace wdi_realgdp = (ln(wdi_realgdp))
gen wdi_armimplag1 = wdi_armimp[_n-1]
replace wdi_inflation = (ln(wdi_inflation))
replace cspv_civwar = (cspv_civwar/7)
replace wdi_tele = (wdi_tele/100)
replace wdi_powcon = ln(wdi_powcon)
replace wdi_internet = (wdi_internet/100)
gen lnpop = ln(wdi_pop)
replace wdi_gdpser = (wdi_gdpser/100)
gen wdi_gdpnonser = (1 - wdi_gdpser)
tab ht_region, gen (region)
gen wdi_lngdpcap = ln(wdi_gdpcapcur)
gen wdi_lngdp = ln(wdi_realgdp)
replace ti_cpi = ti_cpi*-1
replace wbgi_cce = wbgi_cce*-1
replace wbgi_cce = wbgi_cce + 0.0251
replace ti_cpi = ti_cpi+1
replace wbgi_cce = wbgi_cce+1


label var wdi_gdpnonser "% of GDP that does not come from services"
label var lnpop "ln of wdi_pop"
label var region1 "Eastern Europe and post Soviet Union"
label var region2 "Latin America"
label var region3 "North Africa & the Middle East"
label var region4 "Sub-Saharan Africa"
label var region5 "Western Europe and North America"
label var region6 "East Asia"
label var region7 "South-East Asia"
label var region8 "South Asia"
label var region9 "The Pacific"
label var region10 "The Caribbean"

*****If you are using the final data that was included, then you can start here*****

*****regressions (tables 1 and 2 are sum stats/descriptive stats)*****

xtset ccode panel

*****might have to install some stuff*****
ssc install outreg2 
ssc install xtabond2
ssc install ivreg2

*****you can take the outreg2's, they are edited for my paper*****

*****table3***** (Just a standard OLS)

xtreg bci pctaidIO_wdi gd_ptss fe_etfra wdi_lngdpcap p_durable , robust
*outreg2 using E:\auto.doc, replace drop(time* region*) ctitle(BCI IO) 
xtreg ti_cpi pctaidIO_wdi  gd_ptss fe_etfra wdi_lngdpcap p_durable , robust
*outreg2 using E:\auto.doc, append drop(time* region*) ctitle(CPI IO)  
xtreg wbgi_cce pctaidIO_wdi  gd_ptss fe_etfra wdi_lngdpcap p_durable , robust
*outreg2 using E:\auto.doc, append drop(time* region*) ctitle(CCE IO)  
xtreg bci pctaidC_wdi  gd_ptss fe_etfra wdi_lngdpcap p_durable,  robust
*outreg2 using E:\auto.doc, append drop(time* region*) ctitle(BCI C)  
xtreg ti_cpi pctaidC_wdi  gd_ptss fe_etfra wdi_lngdpcap p_durable ,  robust
*outreg2 using E:\auto.doc, append drop(time* region*) ctitle(CPI C) 
xtreg wbgi_cce pctaidC_wdi  gd_ptss fe_etfra wdi_lngdpcap p_durable , robust
*outreg2 using E:\auto.doc, append drop(time* region*) ctitle(CCE C)  

*****table4***** (Fixed Effect Model)

xtreg bci pctaidIO_wdi gd_ptss wdi_lngdpcap p_durable  time* , fe 
*outreg2 using E:\auto2.doc, replace drop(time*) ctitle(BCI IO)  addtext(Hanson J P-value, ".", Frist Stage F-Stat, ".", Counrty Fixed Effects, "Yes",Time Fixed Effects, "Yes")
xtreg ti_cpi pctaidIO_wdi gd_ptss  wdi_lngdpcap p_dur time*, fe
*outreg2 using E:\auto2.doc, append drop(time*) ctitle(CPI IO)  addtext(Hanson J P-value, ".", Frist Stage F-Stat, ".", Counrty Fixed Effects, "Yes",Time Fixed Effects, "Yes")
xtreg wbgi_cce pctaidIO_wdi gd_ptss wdi_lngdpcap p_dur time*, fe
*outreg2 using E:\auto2.doc, append drop(time*) ctitle(CCE IO)  addtext(Hanson J P-value, ".", Frist Stage F-Stat, ".", Counrty Fixed Effects, "Yes",Time Fixed Effects, "Yes")
xtreg bci pctaidC_wdi  gd_ptss  wdi_lngdpcap p_dur time*, fe
*outreg2 using E:\auto2.doc, append drop(time*) ctitle(BCI C)  addtext(Hanson J P-value, ".", Frist Stage F-Stat, ".", Counrty Fixed Effects, "Yes",Time Fixed Effects, "Yes")
xtreg ti_cpi pctaidC_wdi  gd_ptss  wdi_lngdpcap p_dur time*, fe
*outreg2 using E:\auto2.doc, append drop(time*) ctitle(CPI C)  addtext(Hanson J P-value, ".", Frist Stage F-Stat, ".", Counrty Fixed Effects, "Yes",Time Fixed Effects, "Yes")
xtreg wbgi_cce pctaidC_wdi  gd_ptss  wdi_lngdpcap p_dur time*, fe
*outreg2 using E:\auto2.doc, append drop(time*) ctitle(CCE C)  addtext(Hanson J P-value, ".", Frist Stage F-Stat, ".", Counrty Fixed Effects, "Yes",Time Fixed Effects, "Yes")

*****table5***** (Random Effects)

xtreg bci pctaidIO_wdi gd_ptss fe_etfra wdi_lngdpcap p_durable region* time* , re robust
*outreg2 using E:\auto3.doc, replace drop(time* region*) ctitle(BCI IO)  addtext(Regional Contorls, "Yes", Random Effects, "Yes",Time Effects, "Yes")
xtreg ti_cpi pctaidIO_wdi  gd_ptss fe_etfra wdi_lngdpcap p_durable region* time* , re robust
*outreg2 using E:\auto3.doc, append drop(time* region*) ctitle(CPI IO)  addtext(Regional Contorls, "Yes", Random Effects, "Yes",Time Effects, "Yes")
xtreg wbgi_cce pctaidIO_wdi  gd_ptss fe_etfra wdi_lngdpcap p_durable region* time* , re robust
*outreg2 using E:\auto3.doc, append drop(time* region*) ctitle(CCE IO)  addtext(Regional Contorls, "Yes", Random Effects, "Yes",Time Effects, "Yes")
xtreg bci pctaidC_wdi  gd_ptss fe_etfra wdi_lngdpcap p_durable region* time* , re robust
*outreg2 using E:\auto3.doc, append drop(time* region*) ctitle(BCI C)  addtext(Regional Contorls, "Yes", Random Effects, "Yes",Time Effects, "Yes")
xtreg ti_cpi pctaidC_wdi  gd_ptss fe_etfra wdi_lngdpcap p_durable region* time* , re robust
*outreg2 using E:\auto3.doc, append drop(time* region*) ctitle(CPI C)  addtext(Regional Contorls, "Yes", Random Effects, "Yes",Time Effects, "Yes")
xtreg wbgi_cce pctaidC_wdi  gd_ptss fe_etfra wdi_lngdpcap p_durable region* time* , re robust
*outreg2 using E:\auto3.doc, append drop(time* region*) ctitle(CCE C)  addtext(Regional Contorls, "Yes", Random Effects, "Yes",Time Effects, "Yes")

*****table6***** (IV 2SLS (No fixed effects))

ivreg2 bci gd_ptss fe_etfra wdi_lngdpcap p_dur region* time* (pctaidIO_wdi = ht_co lnpop wdi_trade), robust
*outreg2 using E:\auto4.doc, replace drop(time* region*) ctitle(BCI IO)  addtext(Regional Contorls, "Yes",Time Effects, "Yes", Cragg_Donald F Stat, "19.814")
ivreg2 ti_cpi gd_ptss  fe_etfra wdi_lngdpcap  p_dur region* time* (pctaidIO_wdi = ht_co lnpop wdi_trade), robust 
*outreg2 using E:\auto4.doc, append drop(time* region*) ctitle(CPI IO)  addtext(Regional Contorls, "Yes",Time Effects, "Yes", Cragg_Donald F Stat, "16.234")
ivreg2 wbgi_cce gd_ptss  fe_etfra wdi_lngdpcap  p_dur region* time* (pctaidIO_wdi = ht_co lnpop wdi_trade), robust 
*outreg2 using E:\auto4.doc, append drop(time* region*) ctitle(CCE IO)  addtext(Regional Contorls, "Yes",Time Effects, "Yes", Cragg_Donald F Stat, "16.234")
ivreg2 bci gd_ptss  fe_etfra wdi_lngdpcap  p_dur region* time* (pctaidC_wdi = ht_co lnpop wdi_trade), robust 
*outreg2 using E:\auto4.doc, append drop(time* region*) ctitle(BCI C)  addtext(Regional Contorls, "Yes",Time Effects, "Yes", Cragg_Donald F Stat, "16.234")
ivreg2 ti_cpi gd_ptss  fe_etfra wdi_lngdpcap  p_dur region* time* (pctaidC_wdi = ht_co lnpop wdi_trade), robust 
*outreg2 using E:\auto4.doc, append drop(time* region*) ctitle(CPI C)  addtext(Regional Contorls, "Yes",Time Effects, "Yes", Cragg_Donald F Stat, "16.234")
ivreg2 wbgi_cce gd_ptss  fe_etfra wdi_lngdpcap  p_dur region* time* (pctaidC_wdi = ht_co lnpop wdi_trade), robust 
*outreg2 using E:\auto4.doc, append drop(time* region*) ctitle(CCE C)  addtext(Regional Contorls, "Yes",Time Effects, "Yes", Cragg_Donald F Stat, "16.234")

*****table7***** (Two-stage GMM)

xtabond2 bci  pctaidIO_wdi gd_ptss fe_etfra wdi_lngdpcap  p_dur  region*,iv( region* ) gmm( fe_etfra wdi_lngdpcap gd_ptss p_dur, lag( 1 .)collapse) gmm(pctaidIO_wdi, lag(2 .)) two robust orthogonal
*outreg2 using E:\auto5.doc, replace drop(time* region*) ctitle(BCI IO)  addtext(Regional Contorls, "Yes",Time Effects, "Yes", GMM?, "GMM fo dizzle")
xtabond2 ti_cpi pctaidIO_wdi gd_ptss fe_etfra wdi_lngdpcap  p_dur  region*,iv( region* ) gmm(fe_etfra wdi_lngdpcap gd_ptss p_dur, lag( 1 .)collapse) gmm(pctaidIO_wdi, lag(2 .)) two robust orthogonal
*outreg2 using E:\auto5.doc, append drop(time* region*) ctitle(CPI IO)  addtext(Regional Contorls, "Yes",Time Effects, "Yes", GMM?, "GMM fo sho")
xtabond2 wbgi_cce pctaidIO_wdi gd_ptss fe_etfra wdi_lngdpcap  p_dur  region*,iv( region* ) gmm(fe_etfra wdi_lngdpcap gd_ptss p_dur, lag( 1 .)collapse) gmm(pctaidIO_wdi, lag(2 .)) two robust orthogonal
*outreg2 using E:\auto5.doc, append drop(time* region*) ctitle(CCCE IO)  addtext(Regional Contorls, "Yes",Time Effects, "Yes", GMM?, "GMM yo dizzle")
xtabond2 bci pctaidC_wdi gd_ptss fe_etfra wdi_lngdpcap  p_dur  region*,iv( region* ) gmm(fe_etfra wdi_lngdpcap gd_ptss p_dur, lag( 1 .)collapse) gmm(pctaidC_wdi, lag(2 .)) two robust orthogonal
*outreg2 using E:\auto5.doc, append drop(time* region*) ctitle(BCI C)  addtext(Regional Contorls, "Yes",Time Effects, "Yes", GMM?, "GMM fo shizzle")
xtabond2 ti_cpi pctaidC_wdi gd_ptss fe_etfra wdi_lngdpcap  p_dur  region*,iv( region* ) gmm(fe_etfra wdi_lngdpcap gd_ptss p_dur, lag( 1 .)collapse) gmm(pctaidC_wdi, lag(2 .)) two robust orthogonal
*outreg2 using E:\auto5.doc, append drop(time* region*) ctitle(CPI C)  addtext(Regional Contorls, "Yes",Time Effects, "Yes", GMM?, "GMM fo hizzle")
xtabond2 wbgi_cce pctaidC_wdi gd_ptss fe_etfra wdi_lngdpcap  p_dur  region*,iv( region* ) gmm(fe_etfra wdi_lngdpcap gd_ptss p_dur, lag( 1 .)collapse) gmm(pctaidC_wdi, lag(2 .)) two robust orthogonal
*outreg2 using E:\auto5.doc, append drop(time* region*) ctitle(CCE C)  addtext(Regional Contorls, "Yes",Time Effects, "Yes", GMM?, "GMM for real")


*****table8***** (Two-stage GMM)

xtabond2 pctaidIO_wdi bci_bci wdi_lngdpcap  wdi_mortinf ht_co wdi_trade region* ,iv(ht_co region*) gmm( wdi_lngdpcap, lag(2 .))  gmm(wdi_mortinf,lag(1 .)) gmm(wdi_trade, lag(1 .)) gmm(bci_bci, lag(2 .)) two robust orthogonal
outreg2 using E:\auto6.doc, replace drop(time* region*) ctitle(BCI IO)  addtext(Regional Contorls, GMM?, "GMM for real")
xtabond2 pctaidIO_wdi ti_cpi wdi_lngdpcap  wdi_mortinf ht_co wdi_trade region* ,iv(ht_co region*) gmm( wdi_lngdpcap, lag(2 .))  gmm(wdi_mortinf,lag(1 .)) gmm(wdi_trade, lag(1 .)) gmm(ti_cpi, lag(2 .)) two robust orthogonal
outreg2 using E:\auto6.doc, append drop(time* region*) ctitle(CPI IO)  addtext(Regional Contorls, "Yes", GMM?, "GMM for real")
xtabond2 pctaidIO_wdi wbgi_cce wdi_lngdpcap  wdi_mortinf ht_co wdi_trade region* ,iv(ht_co region*) gmm( wdi_lngdpcap, lag(2 .))  gmm(wdi_mortinf,lag(1 .)) gmm(wdi_trade, lag(1 .)) gmm(wbgi_cce, lag(2 .)) two robust orthogonal
outreg2 using E:\auto6.doc, append drop(time* region*) ctitle(CCE IO)  addtext(Regional Contorls, "Yes", GMM?, "GMM for real")
xtabond2 pctaidC_wdi bci_bci wdi_lngdpcap  wdi_mortinf ht_co wdi_trade region* ,iv(ht_co region*) gmm( wdi_lngdpcap, lag(2 .))  gmm(wdi_mortinf,lag(1 .)) gmm(wdi_trade, lag(1 .)) gmm(bci_bci, lag(2 .)) two robust orthogonal
outreg2 using E:\auto6.doc, append drop(time* region*) ctitle(BCI D)  addtext(Regional Contorls, GMM?, "No")
xtabond2 pctaidC_wdi ti_cpi wdi_lngdpcap  wdi_mortinf ht_co wdi_trade region* ,iv(ht_co region*) gmm( wdi_lngdpcap, lag(2 .))  gmm(wdi_mortinf,lag(1 .)) gmm(wdi_trade, lag(1 .)) gmm(ti_cpi, lag(2 .)) two robust orthogonal
outreg2 using E:\auto6.doc, append drop(time* region*) ctitle(CPI D)  addtext(Regional Contorls, "Yes", GMM?, "its just")
xtabond2 pctaidC_wdi wbgi_cce wdi_lngdpcap  wdi_mortinf ht_co wdi_trade region* ,iv(ht_co region*) gmm( wdi_lngdpcap, lag(2 .))  gmm(wdi_mortinf,lag(1 .)) gmm(wdi_trade, lag(1 .)) gmm(wbgi_cce, lag(2 .)) two robust orthogonal
outreg2 using E:\auto6.doc, append drop(time* region*) ctitle(CCE D)  addtext(Regional Contorls, "Yes", GMM?, "endogiety")





