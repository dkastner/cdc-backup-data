*****************************************************************************************
* FILE NAME:     SASOUT14_LLCP_V1.SAS                                                      *
* DESCRIPTION:   THIS PROGRAM CONVERTS A STATES ASCII DATAFILE OF COMPLETES LOCATED AT  *
*                <DATAIN> FILEREF, INTO A SAS DATABASE STORED AT <DATAOUT> LIBREF       *
* REFERENCES:                                                                           *
* INPUT       DATAIN           FILEREF OF ASCII DATAFILE OF COMPLETES                   *
* FORMATS     FORMATS.SAS7BCAT      SAS FORMATS DATABASE                                *
* OUTPUT      DATAOUT.SASDATA  SAS DATABASE VERSION OF ASCII DATA AS SPECIFIED IN       *
*                              <DATAIN> FILEREF                                         *
* UPDATED - 08/06/2015                                                                  *
*****************************************************************************************;
********************************
* Clear Output and Log Windows *
********************************;
DM OUTPUT 'clear' continue;
DM LOG    'clear' continue;
**********************************
* DEFINE SAS ENVIRONMENT OPTIONS *
**********************************;
OPTIONS PAGENO=1 NOFMTERR;
***************************************
* CLEAR EXISTING TITLES AND FOOTNOTES *
***************************************;
TITLE ;
FOOTNOTE ;
RUN ;
******************************************************************
* INSTRUCTIONS:                                                  *
* SPECIFY PATH OF WHERE ASCII DATAFILE IS STORED                 *
* SPECIFY PATH OF WHERE SAS DATASET IS TO BE STORED              *
* SPECIFY PATH OF WHERE SAS FORMAT LIBRARY IS STORED             *
* SPECIFY PATH OF WHERE THE FORMAT ASSIGNMET STATEMENT IS STORED *
******************************************************************;

*FILENAME DATAIN '<PATH OF INPUT STATE ASCII DATAFILE OF COMPLETES>' LRECL = 2293 ;
*****************************************************************************
* EXAMPLE:                                                                  *
*       FILENAME DATAIN 'C:\BRFSS\2014\LLCP14V1.ASC' LRECL = 2293           *
* NOTE: MAKE SURE THE ASTERISK IS REMOVED BEFORE THE WORD FILENAME AND      *
*       MAKE SURE THAT THE GREATER THAN AND LESS THAN SIGNS < > ARE REMOVED *
*       FROM THE FILENAME STATEMENT                                         *
*****************************************************************************;

*LIBNAME DATAOUT V7 '<PATH OF PERMANENTLY STORED SAS DATASET VERSION OF DATAIN FILEREF>'  ;
*****************************************************************************
* EXAMPLE:                                                                  *
*          LIBNAME DATAOUT 'C:\'                                            *
*          A SAS DATABASE WILL BE STORED AT C:\SASDATA.sas7bdat             *
* NOTE: MAKE SURE THE ASTERISK IS REMOVED BEFORE THE WORD LIBNAME AND       *
*       MAKE SURE THAT THE GREATER THAN AND LESS THAN SIGNS < > ARE REMOVED *
*       FROM THE LIBNAME STATEMENT                                          *
*****************************************************************************;

*LIBNAME LIBRARY '<PATH OF STORED SAS FORMAT14.SAS7BCAT>' ;
*****************************************************************************
* EXAMPLE:                                                                  *
*          LIBNAME LIBRARY 'C:\'                                            *
* NOTE: MAKE SURE THE ASTERISK IS REMOVED BEFORE THE WORD LIBNAME AND       *
*       MAKE SURE THAT THE GREATER THAN AND LESS THAN SIGNS < > ARE REMOVED *
*       FROM THE LIBNAME STATEMENT                                          *
*****************************************************************************;

*FILENAME FORMATIN '<PATH OF FORMAT ASSIGNMENT STATEMENT>' ;
*****************************************************************************
* EXAMPLE:                                                                  *
*          FILENAME FORMATIN 'C:\FORMATSTATEMENT.SAS'                       *
* NOTE: MAKE SURE THE ASTERISK IS REMOVED BEFORE THE WORD FILENAME AND      *
*       MAKE SURE THAT THE GREATER THAN AND LESS THAN SIGNS < > ARE REMOVED *
*       FROM THE FILENAME STATEMENT                                         *
*****************************************************************************;

DATA DATAOUT.SASDATA ;
INFILE DATAIN MISSOVER ;
INPUT
_STATE        1-2                     /* Record Identification */
FMONTH        16-17
IDATE         $18-25
IMONTH        $18-19
IDAY          $20-21
IYEAR         $22-25
DISPCODE      31-34
SEQNO         35-44
_PSU          35-44
CTELENUM      62
PVTRESD1      63
COLGHOUS      64
STATERES      65
LADULT        67
NUMADULT      68-69
NUMMEN        70-71
NUMWOMEN      72-73
GENHLTH       80                      /* Section 1: Health Status */
PHYSHLTH      81-82                   /* Section 2: Healthy Days � Health Related Quality of Life */
MENTHLTH      83-84
POORHLTH      85-86
HLTHPLN1      87                      /* Section 3: Health Care Access */
PERSDOC2      88
MEDCOST       89
CHECKUP1      90
EXERANY2      91                      /* Section 4: Exercise */
SLEPTIM1      92-93                   /* Section 5: Inadequate Sleep */
CVDINFR4      94                      /* Section 6: Chronic Health Conditions */
CVDCRHD4      95
CVDSTRK3      96
ASTHMA3       97
ASTHNOW       98
CHCSCNCR      99
CHCOCNCR      100
CHCCOPD1      101
HAVARTH3      102
ADDEPEV2      103
CHCKIDNY      104
DIABETE3      105
DIABAGE2      106-107
LASTDEN3      108                     /* Section 7: Oral Health */
RMVTETH3      109
VETERAN3      146
MARITAL       147
CHILDREN      148-149
EDUCA         150
EMPLOY1       151
INCOME2       152-153
WEIGHT2       154-157
HEIGHT3       158-161
NUMHHOL2      170
NUMPHON2      171
CPDEMO1       172
CPDEMO4       173-175
INTERNET      176
RENTHOM1      177
SEX           178
PREGNANT      179
QLACTLM2      180
USEEQUIP      181
BLIND         182
DECIDE        183
DIFFWALK      184
DIFFDRES      185
DIFFALON      186
SMOKE100      187                     /* Section 9: Tobacco Use */
SMOKDAY2      188
STOPSMK2      189
LASTSMK2      190-191
USENOW3       192
ALCDAY5       193-195                 /* Section 10: Alcohol Consumption */
AVEDRNK2      196-197
DRNK3GE5      198-199
MAXDRNKS      200-201
FLUSHOT6      202                     /* Section 11: Immunization */
FLSHTMY2      203-208
PNEUVAC3      209
SHINGLE2      210
FALL12MN      211-212                 /* Section 12: Falls */
FALLINJ2      213-214
SEATBELT      215                     /* Section 13: Seatbelt Use */
DRNKDRI2      216-217                 /* Section 14: Drinking and Driving */
HADMAM        218                     /* Section 15: Breast and Cervical Cancer Screening */
HOWLONG       219
PROFEXAM      220
LENGEXAM      221
HADPAP2       222
LASTPAP2      223
HADHYST2      224
PCPSAAD2      225                     /* Section 16: Prostate Cancer Screening */
PCPSADI1      226
PCPSARE1      227
PSATEST1      228
PSATIME       229
PCPSARS1      230
BLDSTOOL      231                     /* Section 17: Colorectal Cancer Screening */
LSTBLDS3      232
HADSIGM3      233
HADSGCO1      234
LASTSIG3      235
HIVTST6       236                     /* Section 18: HIV/AIDS */
HIVTSTD3      237-242
WHRTST10      243-244
PDIABTST      255                     /* Module 1: Pre-Diabetes */
PREDIAB1      256
INSULIN       257                     /* Module 2: Diabetes */
BLDSUGAR      258-260
FEETCHK2      261-263
DOCTDIAB      264-265
CHKHEMO3      266-267
FEETCHK       268-269
EYEEXAM       270
DIABEYE       271
DIABEDU       272
PAINACT2      273-274                 /* Module 3: Healthy Days (Symptoms) */
QLMENTL2      275-276
QLSTRES2      277-278
QLHLTH2       279-280
MEDICARE      281                     /* Module 4: Health Care Access */
HLTHCVR1      282-283
DELAYMED      284
DLYOTHER      $285-309
NOCOV121      310
LSTCOVRG      311
DRVISITS      312-313
MEDSCOST      314
CARERCVD      315
MEDBILL1      316
ASBIALCH      317                     /* Module 5: Alcohol Screening & Brief Intervention (ASBI) */
ASBIDRNK      318
ASBIBING      319
ASBIADVC      320
ASBIRDUC      321
WTCHSALT      322                     /* Module 6: Sodium or Salt-Related Behavior */
LONGWTCH      323-325
DRADVISE      326
ASTHMAGE      327-328                 /* Module 7: Adult Asthma History */
ASATTACK      329
ASERVIST      330-331
ASDRVIST      332-333
ASRCHKUP      334-335
ASACTLIM      336-338
ASYMPTOM      339
ASNOSLEP      340
ASTHMED3      341
ASINHALR      342
IMFVPLAC      343-344                 /* Module 8: Influenza */
TETANUS       345                     /* Module 9: Tetanus Diphtheria (TDAP) (Adults) */
HPVTEST       346                     /* Module 10: Adult Human Papilloma Virus (HPV) - Testing */
HPLSTTST      347
HPVADVC2      348                     /* Module 11: Adult Human Papilloma Virus (HPV) - Vaccination */
HPVADSHT      349-350
CNCRDIFF      351                     /* Module 12: Cancer Survivorship */
CNCRAGE       352-353
CNCRTYP1      354-355
CSRVTRT1      356
CSRVDOC1      357-358
CSRVSUM       359
CSRVRTRN      360
CSRVINST      361
CSRVINSR      362
CSRVDEIN      363
CSRVCLIN      364
CSRVPAIN      365
CSRVCTL1      366
RRCLASS2      367                     /* Module 13: Reactions to Race */
RRCOGNT2      368
RRATWRK2      369
RRHCARE3      370
RRPHYSM2      371
RREMTSM2      372
SCNTMNY1      573                     /* Module 15: Social Context */
SCNTMEL1      574
SCNTPAID      575
SCNTWRK1      576-577
SCNTLPAD      578
SCNTLWK1      579-580
SCNTVOT1      581
SXORIENT      582                     /* Module 16: Sexual Orientation and Gender Identity */
TRNSGNDR      583
RCSGENDR      590
RCSRLTN2      625
CASTHDX2      626                     /* Module 18: Childhood Asthma Prevalence */
CASTHNO2      627
EMTSUPRT      628                     /* Module 19: Emotional Support and Life Satisfaction */
LSATISFY      629
CTELNUM1      632                     /* Cell Phone Introduction */
CELLFON2      633
CADULT        634
PVTRESD2      635
CCLGHOUS      636
CSTATE        637
LANDLINE      640
HHADULT       641-642
QSTVER        645-646                 /* Questionnaire Version */
QSTLANG       647-648                 /* Questionnaire Language */
_STSTR        1357-1362
_STRWT        1363-1372
_RAWRAKE      1393-1402
_WT2RAKE      1403-1412
_AGE80        1417-1418
_IMPRACE      1419-1420
_IMPNPH       1421
_IMPEDUC      1425
_IMPMRTL      1426
_IMPHOME      1427
_CHISPNC      1612                    /* Child Demographic Variables */
_CPRACE       1669-1670
_CRACE1       1671-1672
_IMPCAGE      1673
_IMPCRAC      1674
_IMPCSEX      1675
_CLCWTV1      1827-1836
_DUALUSE      1938
_DUALCOR      1939-1948
_LCPWTV1      2053-2062
_RFHLTH       2155                    /* Section 1: Calculated Variables */
_HCVU651      2156                    /* Section 3: Calculated Variables */
_TOTINDA      2157                    /* Section 4: Calculated Variables */
_LTASTH1      2158                    /* Section 6: Calculated Variables */
_CASTHM1      2159
_ASTHMS1      2160
_DRDXAR1      2161
_EXTETH2      2162                    /* Section 7: Oral Health */
_ALTETH2      2163
_DENVST2      2164
_PRACE1       2221-2222
_MRACE1       2223-2224
_HISPANC      2227
_RACE         2228
_RACEG21      2229
_RACEGR3      2230
_RACE_G1      2231
_AGEG5YR      2232-2233
_AGE65YR      2234
_AGE_G        2235
HTIN4         2236-2238
HTM4          2239-2241
WTKG3         2242-2246
_BMI5         2247-2250
_BMI5CAT      2251
_RFBMI5       2252
_CHLDCNT      2253
_EDUCAG       2254
_INCOMG       2255
_SMOKER3      2256                    /* Section 9: Calculated Variables */
_RFSMOK3      2257
DRNKANY5      2258                    /* Section 10: Calculated Variables */
DROCDY3_      2259-2261
_RFBING5      2262
_DRNKDY4      2263-2266
_DRNKMO4      2267-2270
_RFDRHV4      2271
_RFDRMN4      2272
_RFDRWM4      2273
_FLSHOT6      2274                    /* Section 11: Calculated Variables */
_PNEUMO2      2275
_RFSEAT2      2276                    /* Section 13: Calculated Variables */
_RFSEAT3      2277
_RFMAM2Y      2278                    /* Section 15: Calculated Variables */
_MAM502Y      2279
_MAM5021      2280
_RFPAP32      2281
_RFPAP33      2282
_RFPSA21      2283                    /* Section 16: Calculated Variables */
_RFBLDS2      2284                    /* Section 17: Calculated Variables */
_RFBLDS3      2285
_RFSIGM2      2286
_COL10YR      2287
_HFOB3YR      2288
_FS5YR        2289
_FOBTFS       2290
_CRCREC       2291
_AIDTST3      2292                    /* Section 18: Calculated Variables */
;
*****************************************************************
* TO INCLUDE THE FORMAT ASSIGNEMT STATEMENT REMOVE THE ASTERISK *
* FROM THE BEGINNING OF THE FOLLOWING LINE                      *
*****************************************************************;
* %INCLUDE FORMATIN ;
*************************************************
* THIS SECTION CREATES LABELS FOR THE VARIABLES *
*************************************************;
Label
ADDEPEV2 = 'EVER TOLD YOU HAD A DEPRESSIVE DISORDER'
ALCDAY5 = 'DAYS IN PAST 30 HAD ALCOHOLIC BEVERAGE'
ASACTLIM = 'ACTIVITIES LIMITED DUE TO ASTHMA DURING PAST 12 MONTHS'
ASATTACK = 'ASTHMA DURING PAST 12 MONTHS'
ASBIADVC = 'OFFERED ADVICE ABOUT WHAT LEVEL OF DRINKING IS HARMFUL OR RISKY?'
ASBIALCH = 'ASKED DURING CHECKUP IF YOU DRINK ALCHOHOL'
ASBIBING = 'ASKED WHETHER YOU DRANK [5 FOR MEN /4 FOR WOMEN] OR MORE ALCOHOLIC DRINKS ON AN OCCASION?'
ASBIDRNK = 'ASKED IN PERSON OR BY FORM HOW MUCH YOU DRINK?'
ASBIRDUC = 'WERE YOU ADVISED TO REDUCE OR QUIT YOUR DRINKING?'
ASDRVIST = 'URGENT ASTHMA TREATMENT DURING PAST 12 MONTHS'
ASERVIST = 'EMERGENCY ASTHMA CARE DURING PAST 12 MONTHS'
ASINHALR = 'TIMES USED ASTHMA INHALER DURING AN ATTACK IN PAST 30 DAYS'
ASNOSLEP = 'SLEEP DIFFICULTY DUE TO ASTHMA DURING PAST 30 DAYS'
ASRCHKUP = 'ROUTINE ASTHMA CARE DURING PAST 12 MONTHS'
ASTHMA3 = 'EVER TOLD HAD ASTHMA'
ASTHMAGE = 'AGE AT ASTHMA DIAGNOSIS'
ASTHMED3 = 'DAYS USED PRESCRIBED PREVENTATIVE ASTHMA MED IN PAST 30 DAYS'
ASTHNOW = 'STILL HAVE ASTHMA'
ASYMPTOM = 'ASTHMA SYMPTOMS DURING PAST 30 DAYS'
AVEDRNK2 = 'AVG ALCOHOLIC DRINKS PER DAY IN PAST 30'
BLDSTOOL = 'EVER HAD BLOOD STOOL TEST USING HOME KIT'
BLDSUGAR = 'HOW OFTEN CHECK BLOOD FOR GLUCOSE'
BLIND = 'BLIND OR DIFFICULTY SEEING'
CADULT = 'ARE YOU 18 YEARS OF AGE OR OLDER?'
CARERCVD = 'SATISFIED WITH CARE RECEIVED'
CASTHDX2 = 'HLTH PRO EVER SAID CHILD HAS ASTHMA'
CASTHNO2 = 'CHILD STILL HAVE ASTHMA?'
CCLGHOUS = 'DO YOU LIVE IN COLLEGE HOUSING?'
CELLFON2 = 'IS THIS A CELLULAR TELEPHONE?'
CHCCOPD1 = '(EVER TOLD) YOU HAVE (COPD) CHRONIC OBSTRUCTIVE PULMONARY DISEASE, EMPHYSEMA OR CHRONIC BRONCHITIS?'
CHCKIDNY = '(EVER TOLD) YOU HAVE KIDNEY DISEASE?'
CHCOCNCR = '(EVER TOLD) YOU HAD ANY OTHER TYPES OF CANCER?'
CHCSCNCR = '(EVER TOLD) YOU HAD SKIN CANCER?'
CHECKUP1 = 'LENGTH OF TIME SINCE LAST ROUTINE CHECKUP'
CHILDREN = 'NUMBER OF CHILDREN IN HOUSEHOLD'
CHKHEMO3 = 'TIMES CHECKED FOR GLYCOSYLATED HEMOGLOBIN'
CNCRAGE = 'AGE TOLD HAD CANCER'
CNCRDIFF = 'HOW MANY TYPES OF CANCER?'
CNCRTYP1 = 'TYPE OF CANCER'
COLGHOUS = 'DO YOU LIVE IN COLLEGE HOUSING?'
CPDEMO1 = 'DO YOU HAVE A CELL PHONE FOR PERSONAL USE?'
CPDEMO4 = 'WHAT PERCENT OF ALL CALLS ARE RECEIVED ON YOUR CELL PHONE?'
CSRVCLIN = 'PARTICIPATE IN CLINICAL TRIAL AS PART OF CANCER TREATMENT?'
CSRVCTL1 = 'IS PAIN UNDER CONTROL?'
CSRVDEIN = 'EVER DENIED INSURANCE COVERAGE BECAUSE OF YOUR CANCER?'
CSRVDOC1 = 'WHAT TYPE OF DOCTOR PROVIDES MAJORITY OF YOUR CARE'
CSRVINSR = 'DID HEALTH INSURANCE PAY FOR ALL OF YOUR CANCER TREATMENT'
CSRVINST = 'INSTRUCTIONS WRITTEN OR PRINTED'
CSRVPAIN = 'CURRENTLY HAVE PHYSICAL PAIN FROM CANCER OR TREATMENT?'
CSRVRTRN = 'EVER RECEIVE INSTRUCTIONS FROM A DOCTOR FOR FOLLOW-UP CHECK-UPS'
CSRVSUM = 'DID YOU RECEIVE A SUMMARY OF CANCER TREATMENTS RECEIVED'
CSRVTRT1 = 'CURRENTLY RECEIVING TREATMENT FOR CANCER'
CSTATE = 'ARE YOU A RESIDENT OF [STATE]?'
CTELENUM = 'CORRECT TELEPHONE NUMBER?'
CTELNUM1 = 'CORRECT PHONE NUMBER?'
CVDCRHD4 = 'EVER DIAGNOSED WITH ANGINA OR CORONARY HEART DISEASE'
CVDINFR4 = 'EVER DIAGNOSED WITH HEART ATTACK'
CVDSTRK3 = 'EVER DIAGNOSED WITH A STROKE'
DECIDE = 'DIFFICULTY CONCENTRATING OR REMEMBERING'
DELAYMED = 'DELAYED GETTING MEDICAL CARE'
DIABAGE2 = 'AGE WHEN TOLD DIABETIC'
DIABEDU = 'EVER TAKEN CLASS IN MANAGING DIABETES'
DIABETE3 = '(EVER TOLD) YOU HAVE DIABETES'
DIABEYE = 'EVER TOLD DIABETES HAS AFFECTED EYES'
DIFFALON = 'DIFFICULTY DOING ERRANDS ALONE'
DIFFDRES = 'DIFFICULTY DRESSING OR BATHING'
DIFFWALK = 'DIFFICULTY WALKING OR CLIMBING STAIRS'
DISPCODE = 'FINAL DISPOSITION'
DLYOTHER = 'DELAYED GETTING MEDICAL CARE OTHER RESPONSE'
DOCTDIAB = 'TIMES SEEN HEALTH PROFESSIONAL FOR DIABETES'
DRADVISE = 'DOCTOR ADVISED REDUCED SODIUM/SALT INTAKE'
DRNK3GE5 = 'BINGE DRINKING'
DRNKANY5 = 'DRINK ANY ALCOHOLIC BEVERAGES IN PAST 30 DAYS'
DRNKDRI2 = 'DID YOU DRIVE AFTER HAVING TOO MUCH TO DRINK IN THE PAST 30 DAYS?'
DROCDY3_ = 'COMPUTED DRINK-OCCASIONS-PER-DAY'
DRVISITS = 'DOCTOR VISITS PAST 12 MONTHS'
EDUCA = 'EDUCATION LEVEL'
EMPLOY1 = 'EMPLOYMENT STATUS'
EMTSUPRT = 'HOW OFTEN GET EMOTIONAL SUPPORT NEEDED'
EXERANY2 = 'EXERCISE IN PAST 30 DAYS'
EYEEXAM = 'LAST EYE EXAM WHERE PUPILS WERE DILATED'
FALL12MN = 'HAD FALL PAST TWELVE MONTHS'
FALLINJ2 = 'INJURED IN FALL'
FEETCHK = 'TIMES FEET CHECK FOR SORES/IRRITATIONS'
FEETCHK2 = 'HOW OFTEN CHECK FEET FOR SORES OR IRRITATIONS'
FLSHTMY2 = 'WHEN RECEIVED MOST RECENT SEASONAL FLU SHOT/SPRAY'
FLUSHOT6 = 'ADULT FLU SHOT/SPRAY PAST 12 MOS'
FMONTH = 'FILE MONTH'
GENHLTH = 'GENERAL HEALTH'
HADHYST2 = 'HAD HYSTERECTOMY'
HADMAM = 'HAVE YOU EVER HAD A MAMMOGRAM'
HADPAP2 = 'EVER HAD A PAP TEST'
HADSGCO1 = 'WAS LAST TEST A SIGMOIDOSCOPY OR COLONOSCOPY'
HADSIGM3 = 'EVER HAD SIGMOIDOSCOPY/COLONOSCOPY'
HAVARTH3 = 'TOLD HAVE ARTHRITIS'
HEIGHT3 = 'REPORTED HEIGHT IN FEET AND INCHES'
HHADULT = 'NUMBER OF ADULTS IN HOUSEHOLD'
HIVTST6 = 'EVER TESTED HIV'
HIVTSTD3 = 'MONTH AND YEAR OF LAST HIV TEST'
HLTHCVR1 = 'PRIMARY HEALTH INSURANCE COVERAGE'
HLTHPLN1 = 'HAVE ANY HEALTH CARE COVERAGE'
HOWLONG = 'HOW LONG SINCE LAST MAMMOGRAM'
HPLSTTST = 'HOW LONG SINCE YOUR LAST HPV TEST?'
HPVADSHT = 'NUMBER OF HPV SHOTS RECEIVED'
HPVADVC2 = 'EVER HAD THE HPV VACCINATION?'
HPVTEST = 'HAVE YOU EVER HAD AN HPV TEST?'
HTIN4 = 'COMPUTED HEIGHT IN INCHES'
HTM4 = 'COMPUTED HEIGHT IN METERS'
IDATE = 'INTERVIEW DATE'
IDAY = 'INTERVIEW DAY'
IMFVPLAC = 'WHERE DID YOU GET YOUR LAST FLU SHOT/VACCINE?'
IMONTH = 'INTERVIEW MONTH'
INCOME2 = 'INCOME LEVEL'
INSULIN = 'NOW TAKING INSULIN'
INTERNET = 'INTERNET USE IN THE PAST 30 DAYS?'
IYEAR = 'INTERVIEW YEAR'
LADULT = 'ARE YOU 18 YEARS OF AGE OR OLDER?'
LANDLINE = 'DO YOU ALSO HAVE A LANDLINE TELEPHONE?'
LASTDEN3 = 'LAST VISITED DENTIST OR DENTAL CLINIC'
LASTPAP2 = 'HOW LONG SINCE LAST PAP TEST'
LASTSIG3 = 'TIME SINCE LAST SIGMOIDOSCOPY/COLONOSCOPY'
LASTSMK2 = 'INTERVAL SINCE LAST SMOKED'
LENGEXAM = 'HOW LONG SINCE LAST BREAST PHYSICAL EXAM'
LONGWTCH = 'HOW LONG WATCHING SALT/SODIUM INTAKE'
LSATISFY = 'SATISFACTION WITH LIFE'
LSTBLDS3 = 'TIME SINCE LAST BLOOD STOOL TEST'
LSTCOVRG = 'TIME SINCE LAST HAD HEALTH CARE COVERAGE'
MARITAL = 'MARITAL STATUS'
MAXDRNKS = 'MOST DRINKS ON SINGLE OCCASION PAST 30 DAYS'
MEDBILL1 = 'CURRENTLY HAVE HEALTH CARE BILLS'
MEDCOST = 'COULD NOT SEE DR. BECAUSE OF COST'
MEDICARE = 'DO YOU HAVE MEDICARE?'
MEDSCOST = 'COULD NOT GET MEDICINE DUE TO COST'
MENTHLTH = 'NUMBER OF DAYS MENTAL HEALTH NOT GOOD'
NOCOV121 = 'WITHOUT HEALTH CARE COVERAGE PAST 12 MONTHS'
NUMADULT = 'NUMBER OF ADULTS IN HOUSEHOLD'
NUMHHOL2 = 'HOUSEHOLD TELEPHONES'
NUMMEN = 'NUMBER OF ADULT MEN IN HOUSEHOLD'
NUMPHON2 = 'RESIDENTIAL PHONES'
NUMWOMEN = 'NUMBER OF ADULT WOMEN IN HOUSEHOLD'
PAINACT2 = 'HOW MANY DAYS HARD TO DO USUAL ACTIVITIES IN PAST 30 DAYS'
PCPSAAD2 = 'HAS A HEALTH PROFESSIONAL EVER TALKED WITH YOU ABOUT THE ADVANTAGES OF THE PSA TEST?'
PCPSADI1 = 'HAS A HEALTH PROFESSIONAL EVER TALKED WITH YOU ABOUT THE DISADVANTAGES OF THE PSA TEST?'
PCPSARE1 = 'HAS A DOCTOR EVER RECOMMENDED THAT YOU HAVE A PSA TEST?'
PCPSARS1 = 'WHAT WAS THE MAIN REASON YOU HAD THIS PSA TEST?'
PDIABTST = 'HAD A TEST FOR HIGH BLOOD SUGAR IN PAST THREE YEARS'
PERSDOC2 = 'MULTIPLE HEALTH CARE PROFESSIONALS'
PHYSHLTH = 'NUMBER OF DAYS PHYSICAL HEALTH NOT GOOD'
PNEUVAC3 = 'PNEUMONIA SHOT EVER'
POORHLTH = 'POOR PHYSICAL OR MENTAL HEALTH'
PREDIAB1 = 'EVER BEEN TOLD YOU HAVE PRE-DIABETES OR BORDERLINE DIABETES'
PREGNANT = 'PREGNANCY STATUS'
PROFEXAM = 'EVER HAD BREAST PHYSICAL EXAM BY DOCTOR'
PSATEST1 = 'EVER HAD PSA TEST'
PSATIME = 'TIME SINCE LAST PSA TEST'
PVTRESD1 = 'PRIVATE RESIDENCE?'
PVTRESD2 = 'DO YOU LIVE IN A PRIVATE RESIDENCE?'
QLACTLM2 = 'ACTIVITY LIMITATION DUE TO HEALTH PROBLEMS'
QLHLTH2 = 'HOW MANY DAYS FULL OF ENERGY IN PAST 30 DAYS'
QLMENTL2 = 'HOW MANY DAYS DEPRESSED IN PAST 30 DAYS'
QLSTRES2 = 'HOW MANY DAYS FELT ANXIOUS IN PAST 30 DAYS'
QSTLANG = 'LANGUAGE IDENTIFIER'
QSTVER = 'QUESTIONNAIRE VERSION IDENTIFIER'
RCSGENDR = 'GENDER OF CHILD'
RCSRLTN2 = 'RELATIONSHIP TO CHILD'
RENTHOM1 = 'OWN OR RENT HOME'
RMVTETH3 = 'NUMBER OF PERMANENT TEETH REMOVED'
RRATWRK2 = 'HOW DO YOU FEEL YOU WERE TREATED AT WORK COMPARED TO PEOPLE OF OTHER RACES IN PAST 12 MONTHS?'
RRCLASS2 = 'HOW DO OTHER PEOPLE USUALLY CLASSIFY YOU IN THIS COUNTRY?'
RRCOGNT2 = 'HOW OFTEN DO YOU THINK ABOUT YOUR RACE?'
RREMTSM2 = 'TIMES PAST 30 DAYS FELT EMOTIONALLY UPSET BECAUSE OF TREATMENT DUE TO YOUR RACE'
RRHCARE3 = 'WHEN SEEKING HEALTH CARE PAST 12 MONTHS, WAS EXPERIENCE WORSE, SAME, BETTER THAN PEOPLE OF OTHER RACES?'
RRPHYSM2 = 'TIMES PAST 30 DAYS FELT PHYSICAL SYMPTOMS BECAUSE OF TREATMENT DUE TO YOUR RACE'
SCNTLPAD = 'HOW WERE YOU GENERALLY PAID FOR THE WORK YOU DID'
SCNTLWK1 = 'HOW MANY HOURS PER WEEK DID YOU WORK'
SCNTMEL1 = 'TIMES PAST 12 MONTHS WORRIED/STRESSED ABOUT HAVING ENOUGH MONEY TO BUY NUTRITIOUS MEALS?'
SCNTMNY1 = 'TIMES PAST 12 MONTHS WORRIED/STRESSED ABOUT HAVING ENOUGH MONEY TO PAY YOUR RENT/MORTGAGE?'
SCNTPAID = 'HOW ARE YOU GENERALLY PAID FOR THE WORK YOU DO'
SCNTVOT1 = 'DID YOU VOTE IN THE LAST PRESIDENTIAL ELECTION?'
SCNTWRK1 = 'HOW MANY HOURS PER WEEK DO YOU WORK'
SEATBELT = 'HOW OFTEN USE SEATBELTS IN CAR?'
SEQNO = 'ANNUAL SEQUENCE NUMBER'
SEX = 'RESPONDENTS SEX'
SHINGLE2 = 'HAVE YOU EVER HAD THE SHINGLES OR ZOSTER VACCINE?'
SLEPTIM1 = 'HOW MUCH TIME DO YOU SLEEP'
SMOKDAY2 = 'FREQUENCY OF DAYS NOW SMOKING'
SMOKE100 = 'SMOKED AT LEAST 100 CIGARETTES'
STATERES = 'RESIDENT OF STATE'
STOPSMK2 = 'STOPPED SMOKING IN PAST 12 MONTHS'
SXORIENT = 'SEXUAL ORIENTATION OR GENDER IDENTITY'
TETANUS = 'RECEIVED TETANUS SHOT SINCE 2005?'
TRNSGNDR = 'DO YOU CONSIDER YOURSELF TO BE TRANSGENDER?'
USEEQUIP = 'HEALTH PROBLEMS REQUIRING SPECIAL EQUIPMENT'
USENOW3 = 'USE OF SMOKELESS TOBACCO PRODUCTS'
VETERAN3 = 'ARE YOU A VETERAN'
WEIGHT2 = 'REPORTED WEIGHT IN POUNDS'
WHRTST10 = 'LOCATION OF LAST HIV TEST'
WTCHSALT = 'WATCHING SODIUM OR SALT INTAKE'
WTKG3 = 'COMPUTED WEIGHT IN KILOGRAMS'
_AGE65YR = 'REPORTED AGE IN TWO AGE GROUPS CALCULATED VARIABLE'
_AGE80 = 'IMPUTED AGE VALUE COLLAPSED ABOVE 80'
_AGEG5YR = 'REPORTED AGE IN FIVE-YEAR AGE CATEGORIES CALCULATED VARIABLE'
_AGE_G = 'IMPUTED AGE IN SIX GROUPS'
_AIDTST3 = 'EVER BEEN TESTED FOR HIV CALCULATED VARIABLE'
_ALTETH2 = 'ADULTS AGED 65+ WHO HAVE HAD ALL THEIR NATURAL TEETH EXTRACTED'
_ASTHMS1 = 'COMPUTED ASTHMA STATUS'
_BMI5 = 'COMPUTED BODY MASS INDEX'
_BMI5CAT = 'COMPUTED BODY MASS INDEX CATEGORIES'
_CASTHM1 = 'CURRENT ASTHMA CALCULATED VARIABLE'
_CHISPNC = 'CHILD HISPANIC, LATINO/A, OR SPANISH ORIGIN CALCULATED VARIABLE'
_CHLDCNT = 'COMPUTED NUMBER OF CHILDREN IN HOUSEHOLD'
_CLCWTV1 = 'VERSION 1  CHILD WEIGHT: LAND-LINE AND CELL-PHONE DATA'
_COL10YR = 'RESPONDENTS AGED 50-75 WHO HAVE HAD A COLONOSCOPY IN THE PAST 10 YEARS'
_CPRACE = 'PREFERRED CHILD RACE CATEGORIES'
_CRACE1 = 'CHILD NON-HISPANIC RACE INCLUDING MULTIRACIAL'
_CRCREC = 'RESPONDENTS AGED 50-75 WHO HAVE FULLY MET THE USPSTF RECOMMENDATION'
_DENVST2 = 'ADULTS WHO HAVE VISITED A DENTIST, DENTAL HYGENIST OR DENTAL CLINIC WITHIN THE PAST YEAR'
_DRDXAR1 = 'RESPONDENTS DIAGNOSED WITH ARTHRITIS'
_DRNKDY4 = 'COMPUTED NUMBER OF DRINKS OF ALCOHOL BEVERAGES PER DAY'
_DRNKMO4 = 'COMPUTED TOTAL NUMBER DRINKS A MONTH'
_DUALCOR = 'DUAL PHONE USE CORRECTION FACTOR'
_DUALUSE = 'DUAL PHONE USE CATEGORIES'
_EDUCAG = 'COMPUTED LEVEL OF EDUCATION COMPLETED CATEGORIES'
_EXTETH2 = 'RISK FACTOR FOR HAVING HAD PERMANENT TEETH EXTRACTED'
_FLSHOT6 = 'FLU SHOT CALCULATED VARIABLE'
_FOBTFS = 'RESPONDENTS AGED 50-75 WHO HAVE HAD A BLOOD STOOL TEST WITHIN THE PAST 3 YEARS AND A SIGMOIDOSCOPY WITHIN THE PAST 5 YEARS'
_FS5YR = 'RESPONDENTS AGED 50-75 WHO HAVE HAD A SIGMOIDOSCOPY WITHIN THE PAST 5 YEARS'
_HCVU651 = 'RESPONDENTS AGED 18-64 WITH HEALTH CARE COVERAGE'
_HFOB3YR = 'RESPONDENTS AGED 50-75 WHO HAVE HAD A BLOOD STOOL TEST WITHIN THE PAST 3 YEARS'
_HISPANC = 'HISPANIC, LATINO/A, OR SPANISH ORIGIN CALCULATED VARIABLE'
_IMPCAGE = 'IMPUTED CHILD AGE'
_IMPCRAC = 'Imputed Child Race/Ethnicity'
_IMPCSEX = 'IMPUTED CHILD GENDER'
_IMPEDUC = 'IMPUTED EDUCATION LEVEL'
_IMPHOME = 'IMPUTED RENT OR OWN HOME STATUS'
_IMPMRTL = 'IMPUTED MARITAL STATUS'
_IMPNPH = 'IMPUTED NUMBER OF PHONES'
_IMPRACE = 'IMPUTED RACE/ETHNICITY VALUE'
_INCOMG = 'COMPUTED INCOME CATEGORIES'
_LCPWTV1 = 'VERSION 1 WEIGHT: LAND-LINE AND CELL-PHONE DATA'
_LTASTH1 = 'LIFETIME ASTHMA CALCULATED VARIABLE'
_MAM5021 = 'WOMEN RESPONDENTS AGED 50-74 WHO HAVE HAD A MAMMOGRAM IN THE PAST TWO YEARS'
_MAM502Y = 'WOMEN RESPONDENTS AGED 50+ WHO HAVE HAD A MAMMOGRAM IN THE PAST TWO YEARS'
_MRACE1 = 'CALCULATED NON-HISPANIC RACE INCLUDING MULTIRACIAL'
_PNEUMO2 = 'PNEUMONIA VACCINATION CALCULATED VARIABLE'
_PRACE1 = 'COMPUTED PREFERRED RACE'
_PSU = 'PRIMARY SAMPLING UNIT'
_RACE = 'COMPUTED RACE-ETHNICITY GROUPING'
_RACEG21 = 'COMPUTED NON-HISPANIC WHITES/ALL OTHERS RACE CATEGORIES RACE/ETHNIC GROUP CODES USED IN POST-STRATIFICATION.'
_RACEGR3 = 'COMPUTED FIVE LEVEL RACE/ETHNICITY CATEGORY.'
_RACE_G1 = 'COMPUTED RACE GROUPS USED FOR INTERNET PREVALENCE TABLES'
_RAWRAKE = 'RAW WEIGHTING FACTOR USED IN RAKING'
_RFBING5 = 'BINGE DRINKING CALCULATED VARIABLE'
_RFBLDS2 = 'RESPONDENTS AGED 50+ WHO HAVE HAD A BLOOD STOOL TEST WITHIN THE PAST TWO YEARS'
_RFBLDS3 = 'RESPONDENTS AGED 50-75 WHO HAVE HAD A BLOOD STOOL TEST WITHIN THE PAST YEAR'
_RFBMI5 = 'OVERWEIGHT OR OBESE CALCULATED VARIABLE'
_RFDRHV4 = 'HEAVY ALCOHOL CONSUMPTION  CALCULATED VARIABLE'
_RFDRMN4 = 'ADULT MEN HEAVY ALCOHOL CONSUMPTION CALCULATED VARIABLE'
_RFDRWM4 = 'ADULT WOMEN HEAVY ALCOHOL CONSUMPTION CALCULATED VARIABLE'
_RFHLTH = 'ADULTS WITH GOOD OR BETTER HEALTH'
_RFMAM2Y = 'WOMEN RESPONDENTS AGED 40+ WHO HAVE HAD A MAMMOGRAM IN THE PAST TWO YEARS'
_RFPAP32 = 'WOMEN RESPONDENTS AGED 18+ WHO HAVE HAD A PAP TEST IN THE PAST THREE YEARS'
_RFPAP33 = 'WOMEN RESPONDENTS AGED 21-65 WHO HAVE HAD A PAP TEST IN THE PAST THREE YEARS'
_RFPSA21 = 'MALE RESPONDENTS AGED 40+ WHO HAVE HAD A PSA TEST IN THE PAST 2 YEARS'
_RFSEAT2 = 'ALWAYS OR NEARLY ALWAYS WEAR SEAT BELTS'
_RFSEAT3 = 'ALWAYS WEAR SEAT BELTS'
_RFSIGM2 = 'RESPONDENTS AGED 50 OR OLDER WHO HAVE HAD A SIGMOIDOSCOPY OR COLONOSCOPY'
_RFSMOK3 = 'CURRENT SMOKING CALCULATED VARIABLE'
_SMOKER3 = 'COMPUTED SMOKING STATUS'
_STATE = 'STATE FIPS CODE'
_STRWT = 'STRATUM WEIGHT'
_STSTR = 'SAMPLE DESIGN STRATIFICATION VARIABLE'
_TOTINDA = 'LEISURE TIME PHYSICAL ACTIVITY CALCULATED VARIABLE'
_WT2RAKE = 'DESIGN WEIGHT USED IN RAKING'
;
RUN;
