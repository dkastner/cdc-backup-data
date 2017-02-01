*****************************************************************************************
* FILE NAME:     SASOUT06.SAS                                                           *
* DESCRIPTION:   THIS PROGRAM CONVERTS A STATES ASCII DATAFILE OF COMPLETES LOCATED AT  *
*                <DATAIN> FILEREF, INTO A SAS DATABASE STORED AT <DATAOUT> LIBREF       *
* REFERENCES:                                                                           *
* INPUT       DATAIN           FILEREF OF ASCII DATAFILE OF COMPLETES                   *
* FORMATS     FORMATS.SAS7BCAT      SAS FORMATS DATABASE                                *
* OUTPUT      DATAOUT.SASDATA  SAS DATABASE VERSION OF ASCII DATA AS SPECIFIED IN       *
*                              <DATAIN> FILEREF                                         *
* UPDATED - 07/17/2007                                                                  *
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

*FILENAME DATAIN '<PATH OF INPUT STATE ASCII DATAFILE OF COMPLETES>' LRECL = 1255 ;
*****************************************************************************
* EXAMPLE:                                                                  *
*       FILENAME DATAIN 'C:\BRFSS\2003\CDBRFS03.ASC' LRECL = 1255           *
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

*LIBNAME LIBRARY '<PATH OF STORED SAS FORMAT06.SAS7BCAT>' ;
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
_GEOSTR       3-4
_DENSTR2      5
PRECALL       6
REPNUM        7-11
REPDEPTH      12-13
FMONTH        14-15
IDATE         $16-23
IMONTH        $16-17
IDAY          $18-19
IYEAR         $20-23
INTVID        $24-26
DISPCODE      27-29
SEQNO         30-39
_PSU          30-39
NATTMPTS      40-41
NRECSEL       42-47
NRECSTR       48-56
CTELENUM      57
CELLFON1      58
PVTRESID      59
NUMADULT      60-61
NUMMEN        62-63
NUMWOMEN      64-65
GENHLTH       73                      /* Section 1: Health Status */
PHYSHLTH      74-75                   /* Section 2: Healthy Days - Health-Related Quality of Life
*/
MENTHLTH      76-77
POORHLTH      78-79
HLTHPLAN      80                      /* Section 3: Health Care Access */
PERSDOC2      81
MEDCOST       82
CHECKUP       83
EXERANY2      84                      /* Section 4: Exercise */
DIABETE2      85                      /* Section 5: Diabetes */
LASTDEN3      86                      /* Section 6: Oral Health */
RMVTETH3      87
DENCLEAN      88
CVDINFR3      89                      /* Section 7: Cardiovascular Disease */
CVDCRHD3      90
CVDSTRK3      91
ASTHMA2       92                      /* Section 8: Asthma */
ASTHNOW       93
QLACTLM2      94                      /* Section 9: Disability */
USEEQUIP      95
SMOKE100      96                      /* Section 10: Tobacco Use */
SMOKDAY2      97
STOPSMK2      98
AGE           99-100                  /* Section 11: Demographics */
HISPANC2      101
MRACE         $102-107
ORACE2        108
MARITAL       109
CHILDREN      110-111
EDUCA         112
EMPLOY        113
INCOME2       114-115
WEIGHT2       116-119
HEIGHT3       120-123
CTYCODE       124-126
NUMHHOL2      132
NUMPHON2      133
TELSERV2      134
SEX           135
PREGNANT      136
VETERAN       137                     /* Section 12: Veteran�s Status */
DRNKANY4      138                     /* Section 13: Alcohol Consumption */
ALCDAY4       139-141
AVEDRNK2      142-143
DRNK3GE5      144-145
MAXDRNKS      146-147
FLUSHOT3      148                     /* Section 14: Immunization/Adult Influenza */
FLUSPRY2      149
PNEUVAC3      162
HEPBVAC       163
HEPBRSN       164
FALL3MN2      165-166                 /* Section 15: Falls */
FALLINJ2      167-168
SEATBELT      169                     /* Section 16: Seatbelt Use */
DRINKDRI      170-171                 /* Section 17: Drinking and Driving */
HADMAM        172                     /* Section 18: Women�s Health */
HOWLONG       173
PROFEXAM      174
LENGEXAM      175
HADPAP2       176
LASTPAP2      177
HADHYST2      178
PSATEST       179                     /* Section 19: Prostate Cancer Screening */
PSATIME       180
DIGRECEX      181
DRETIME       182
PROSTATE      183
BLDSTOOL      184                     /* Section 20: Colorectal Cancer Screening */
LSTBLDS2      185
HADSIGM3      186
LASTSIG2      187
HIVTST5       188                     /* Section 21: HIV/AIDS */
HIVTSTD2      189-194
WHRTST7       195-196
HIVRDTST      197
EMTSUPRT      198                     /* Section 22: Emotional Support and Life Satisfaction */
LSATISFY      199
RCSBIRTH      $200-205                /* Module 1: Random Child Selection */
RCSGENDR      206
RCHISLAT      207
RCSRACE       $208-213
RCSBRACE      214
RCSRELN1      215
DRHPCH        216                     /* Module 2: Child Influenza Vaccination */
HAVHPCH       217
CIFLUSH2      218
RCVFVCH2      $219-224
RNOFVCH2      225-226
CASTHDX2      227                     /* Module 3: Childhood Asthma */
CASTHNO2      228
DIABAGE2      229-230                 /* Module 4: Diabetes */
INSULIN       231
DIABPILL      232
BLDSUGAR      233-235
FEETCHK2      236-238
FEETSORE      239
DOCTDIAB      240-241
CHKHEMO3      242-243
FEETCHK       244-245
EYEEXAM       246
DIABEYE       247
DIABEDU       248
VIDFCLT2      249                     /* Module 5: Visual Impairment and Access to Eye Care */
VIREDIF2      250
VIPRFVS2      251
VINOCRE2      252-253
VIEYEXM2      254
VIINSUR2      255
VICTRCT2      256
VIGLUMA2      257
VIMACDG2      258
VIATWRK2      259
PAINACT2      260-261                 /* Module 6: Healthy Days (Symptoms) */
QLMENTL2      262-263
QLSTRES2      264-265
QLREST2       266-267
QLHLTH2       268-269
ASTHMAGE      270-271                 /* Module 7: Adult Asthma History */
ASATTACK      272
ASERVIST      273-274
ASDRVIST      275-276
ASRCHKUP      277-278
ASACTLIM      279-281
ASYMPTOM      282
ASNOSLEP      283
ASTHMED2      284
ASINHALR      285
BRTHCNT3      286                     /* Module 8: Family Planning */
TYPCNTR4      287-288
NOBCUSE2      289-290
FPCHLDFT      291
FPCHLDHS      292
VITAMINS      293                     /* Module 9: Folic Acid */
MULTIVIT      294
FOLICACD      295
TAKEVIT       296-298
RECOMMEN      299
HOUSESMK      300                     /* Module 10: Secondhand Smoke Policy */
INDOORS       301
SMKPUBLC      302
SMKWORK       303
IAQHTSRC      304                     /* Module 11: Indoor Air Quality */
IAQGASAP      305
IAQHTDYS      306-308
IAQCODTR      309
IAQMOLD       310
HEWTRSRC      311                     /* Module 12: Home Environment */
HEWTRDRK      312
HECHMHOM      313-315
HECHMYRD      316-318
RRCLASS2      319                     /* Module 13: Reactions to Race */
RRCOGNT2      320
RRATWORK      321
RRHCARE2      322
RRPHYSM1      323
RREMTSM1      324
ADPLEASR      325-326                 /* Module 14: Anxiety and Depression */
ADDOWN        327-328
ADSLEEP       329-330
ADENERGY      331-332
ADEAT         333-334
ADFAIL        335-336
ADTHINK       337-338
ADMOVE        339-340
ADANXEV       341
ADDEPEV       342
SVSAFE        343                     /* Module 15: Sexual Violence */
SVSEXTCH      344
SVNOTCH       345
SVEHDSE1      346
SVHDSX12      347
SVEANOS1      348
SVNOSX12      349
SVRELAT2      350-351
SVGENDER      352
IPVSAFE       353                     /* Module 16: Intimate Partner Violence */
IPVTHRAT      354
IPVPHYV1      355
IPVPHHRT      356
IPVUWSEX      357
IPVPVL12      358
IPVSXINJ      359
IPVRELT1      360-361
GPWELPRD      362                     /* Module 17: General Preparedness */
GPVACPLN      363
GP3DYWTR      364
GP3DYFOD      365
GP3DYPRS      366
GPBATRAD      367
GPFLSLIT      368
GPMNDEVC      369
GPNOTEVC      370-371
GPEMRCOM      372
GPEMRINF      373
QSTVER        741                     /* Questionnaire Version */
QSTLANG       742-743
_STSTR        800-804                 /* Weighting And Stratification Variables */
_STRWT        805-814
_RAW          815-824
_WT2          825-834
_POSTSTR      835-844
_FINALWT      845-854
_REGION       935-936
_AGEG_        937-938
_SEXG_        939
_RACEG3_      940
_RACEG4_      941
_IMPAGE       942-943
_IMPNPH       944
_ITSCF1       945-954
_ITSCF2       955-964
_ITSPOST      965-974
_ITSFINL      975-984
MSCODE        993
CRACEORG      $994-999                /* Child Demographic Variables */
CRACEASC      1000-1005
_CRACE        1006-1007
_CSEXG_       1008
_CRACEG_      1009
_CAGEG_       1010-1012
_RAWCH        1033-1042
_WT2CH        1063-1072
_POSTCH       1093-1102
_CHILDWT      1123-1132
_RAWHH        1133-1142               /* Household Weighting Variables */
_WT2HH        1143-1152
_POSTHH       1153-1162
_HOUSEWT      1163-1172
_RFHLTH       1173                    /* Section 1: Calculated Variables */
_TOTINDA      1174                    /* Section 4: Calculated Variables */
_EXTETH2      1175                    /* Section 6: Calculated Variables */
_ALTETH2      1176
_DENVST1      1177
_LTASTHM      1178                    /* Section 8: Calculated Variables */
_CASTHMA      1179
_ASTHMST      1180
_SMOKER3      1181                    /* Section 10: Calculated Variables */
_RFSMOK3      1182
MRACEORG      $1183-1188              /* Section 11: Calculated Race Variables */
MRACEASC      $1189-1194
_PRACE        1195-1196
_MRACE        1197-1198
_RACEG2       1199
_RACEGR2      1200
_RACE_G       1201
_CNRACE       1202
_CNRACEC      1203
RACE2         1204
_AGEG5YR      1205-1206
_AGE65YR      1207
_AGE_G        1208
HTIN3         1209-1211
HTM3          1212-1214
WTKG2         1215-1219
_BMI4         1220-1223
_BMI4CAT      1224
_RFBMI4       1225
_CHLDCNT      1226
_EDUCAG       1227
_INCOMG       1228
DROCDY2_      1229-1231               /* Section 13: Calculated Variables */
_RFBING4      1232
_DRNKDY3      1233-1236
_DRNKMO3      1237-1240
_RFDRHV3      1241
_RFDRMN3      1242
_RFDRWM3      1243
_FLSHOT3      1244                    /* Section 14: Calculated Variables */
_PNEUMO2      1245
_RFSEAT2      1246                    /* Section 16: Calculated Variables */
_RFSEAT3      1247
_RFMAM2Y      1248                    /* Section 18: Calculated Variables */
_MAM502Y      1249
_RFPAP32      1250
_RFPSA2Y      1251                    /* Section 19: Calculated Variables */
_RFBLDST      1252                    /* Section 20: Calculated Variables */
_RFSIGM2      1253
_AIDTST2      1254                    /* Section 21: Calculated Variables */
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
ADANXEV = 'EVER TOLD YOU HAD AN ANXIETY DISORDER'
ADDEPEV = 'EVER TOLD YOU HAD A DEPRESSIVE DISORDER'
ADDOWN = 'DAYS FELT DOWN, DEPRESSED OR HOPELESS'
ADEAT = 'DAYS ATE TOO LITTLE OR TOO MUCH'
ADENERGY = 'DAYS WERE TIRED OR HAD LITTLE ENERGY'
ADFAIL = 'DAYS FELT LIKE FAILURE OR LET FAMILY DOWN'
ADMOVE = 'DAYS TALKED TO MOVE SLOWER OR FASTER THAN USUAL'
ADPLEASR = 'DAYS HAD LITTLE PLEASURE DOING THINGS'
ADSLEEP = 'DAYS HAD TROUBLE WITH SLEEP'
ADTHINK = 'DAYS HAD TROUBLE CONCENTRATING'
AGE = 'REPORTED AGE IN YEARS'
ALCDAY4 = 'DAYS IN PAST 30 HAD ALCOHOLIC BEVERAGE'
ASACTLIM = 'ACTIVITIES LIMITED DUE TO ASTHMA DURING PAST 12 MONTHS'
ASATTACK = 'ASTHMA DURING PAST 12 MONTHS'
ASDRVIST = 'URGENT ASTHMA TREATMENT DURING PAST 12 MONTHS'
ASERVIST = 'EMERGENCY ASTHMA CARE DURING PAST 12 MONTHS'
ASINHALR = 'TIMES USED ASTHMA INHALER DURING AN ATTACK IN PAST 30 DAYS'
ASNOSLEP = 'SLEEP DIFFICULTY DUE TO ASTHMA DURING PAST 30 DAYS'
ASRCHKUP = 'ROUTINE ASTHMA CARE DURING PAST 12 MONTHS'
ASTHMA2 = 'EVER TOLD HAD ASTHMA'
ASTHMAGE = 'AGE AT ASTHMA DIAGNOSIS'
ASTHMED2 = 'TIMES USED PRESCRIBED PREVENTATIVE ASTHMA MED IN PAST 30 DAYS'
ASTHNOW = 'STILL HAVE ASTHMA'
ASYMPTOM = 'ASTHMA SYMPTOMS DURING PAST 30 DAYS'
AVEDRNK2 = 'AVG ALCOHOLIC DRINKS PER DAY IN PAST 30'
BLDSTOOL = 'EVER HAD BLOOD STOOL TEST USING HOME KIT'
BLDSUGAR = 'HOW OFTEN CHECK BLOOD FOR GLUCOSE'
BRTHCNT3 = 'ARE YOU DOING ANYTHING TO KEEP FROM GETTING PREGNANT?'
CASTHDX2 = 'HLTH PRO EVER SAID CHILD HAS ASTHMA'
CASTHNO2 = 'CHILD STILL HAVE ASTHMA?'
CELLFON1 = 'CELLULAR TELEPHONE'
CHECKUP = 'LENGTH OF TIME SINCE LAST ROUTINE CHECKUP'
CHILDREN = 'NUMBER OF CHILDREN IN HOUSEHOLD'
CHKHEMO3 = 'TIMES CHECKED FOR GLYCOSYLATED HEMOGLOBIN'
CIFLUSH2 = 'CHILD FLU SHOT PAST 12 MOS'
CRACEASC = 'CRACEORG WITH RESPONSES IN ASCENDING ORDER'
CRACEORG = 'CRACE WITH TRAILING 7, 8, 9S REMOVED'
CTELENUM = 'CORRECT TELEPHONE NUMBER?'
CTYCODE = 'COUNTY CODE'
CVDCRHD3 = 'ANGINA OR CORONARY HEART DISEASE'
CVDINFR3 = 'EVER DIAGNOSED WITH HEART ATTACK'
CVDSTRK3 = 'EVER DIAGNOSED WITH A STROKE'
DENCLEAN = 'WHEN TEETH LAST CLEANED BY DENTIST OR HYGIENIST'
DIABAGE2 = 'AGE WHEN TOLD DIABETIC'
DIABEDU = 'EVER TAKEN CLASS IN MANAGING DIABETES'
DIABETE2 = 'EVER TOLD BY DOCTOR YOU HAVE DIABETES'
DIABEYE = 'EVER TOLD DIABETES HAS AFFECTED EYES'
DIABPILL = 'NOW TAKING DIABETES PILLS'
DIGRECEX = 'EVER HAD DIGITAL RECTAL EXAM'
DISPCODE = 'FINAL DISPOSITION'
DOCTDIAB = 'TIMES SEEN HEALTH PROFESSIONAL FOR DIABETES'
DRETIME = 'TIME SINCE LAST DIGITAL RECTAL EXAM'
DRHPCH = 'HEALTH PRO SAID CHILD HAS HEALTH PROBLEMS'
DRINKDRI = 'DID YOU DRIVE AFTER HAVING TOO MUCH TO DRINK IN THE PAST 30 DAYS?'
DRNK3GE5 = 'BINGE DRINKING'
DRNKANY4 = 'DAYS IN PAST 30 HAD ALCOHOLIC BEVERAGE'
DROCDY2_ = 'COMPUTED DRINK-OCCASIONS-PER-DAY'
EDUCA = 'EDUCATION LEVEL'
EMPLOY = 'EMPLOYMENT STATUS'
EMTSUPRT = 'HOW OFTEN GET EMOTIONAL SUPPORT NEEDED'
EXERANY2 = 'EXERCISE IN PAST 30 DAYS'
EYEEXAM = 'LAST EYE EXAM WHERE PUPILS WERE DILATED'
FALL3MN2 = 'HAD FALL PAST THREE MONTHS'
FALLINJ2 = 'INJURED IN FALL'
FEETCHK = 'TIMES FEET CHECK FOR SORES/IRRITATIONS'
FEETCHK2 = 'HOW OFTEN CHECK FEET FOR SORES OR IRRITATIONS'
FEETSORE = 'EVER HAD FEET SORES OR IRRITATIONS LASTING MORE THAN FOUR WEEKS'
FLUSHOT3 = 'FLU SHOT PAST 12 MOS'
FLUSPRY2 = 'FLU SPRAY PAST 12 MOS'
FMONTH = 'FILE MONTH'
FOLICACD = 'VITAMINS WITH FOLIC ACID'
FPCHLDFT = 'HOW DO YOU FEEL ABOUT HAVING A CHILD NOW OR SOMETIME IN THE FUTURE?'
FPCHLDHS = 'HOW SOON WOULD YOU WANT TO HAVE A CHILD?'
GENHLTH = 'GENERAL HEALTH'
GP3DYFOD = 'DOES YOUR HOUSEHOLD HAVE A 3-DAY SUPPLY OF NON-PERISHABLE FOOD FOR EVERYONE WHO LIVES
THERE?'
GP3DYPRS = 'DOES YOUR HOUSEHOLD HAVE A 3-DAY SUPPLY OF PRESCRIPTION MEDICATION FOR EACH PERSON WHO
 TAKES PRESCRIBED MEDICINES?'
GP3DYWTR = 'DOES YOUR HOUSEHOLD HAVE A 3-DAY SUPPLY OF WATER FOR EVERYONE WHO LIVES THERE?'
GPBATRAD = 'DOES YOUR HOUSEHOLD HAVE A WORKING BATTERY OPERATED RADIO AND WORKING BATTERIES FOR YO
UR USE IF THE ELECTRICITY IS OUT?'
GPEMRCOM = 'IN A LARGE-SCALE DISASTER OR EMERGENCY, WHAT WOULD BE YOUR MAIN METHOD OF COMMUNICATIN
G WITH RELATIVES AND FRIENDS?'
GPEMRINF = 'WHAT WOULD BE YOUR MAIN METHOD OF GETTING INFORMATION FROM AUTHORITIES IN A LARGE-SCAL
E DISASTER OR EMERGENCY?'
GPFLSLIT = 'DOES YOUR HOUSEHOLD HAVE A WORKING FLASHLIGHT AND WORKING BATTERIES FOR YOUR USE IF TH
E ELECTRICITY IS OUT?'
GPMNDEVC = 'IF PUBLIC AUTHORITIES ANNOUNCED MANDATORY EVACUATION FROM YOUR COMMUNITY DUE TO A LARG
E-SCALE DISASTER OR EMERGENCY, WOULD YOU EVACUATE?'
GPNOTEVC = 'WHAT WOULD BE THE MAIN REASON WHY YOU MIGHT NOT EVACUATE IF ASKED TO DO SO?'
GPVACPLN = 'DOES YOUR HOUSEHOLD HAVE A DISASTER EVACUATION PLAN?'
GPWELPRD = 'HOW WELL PREPARED IS YOUR HOUSEHOLD TO SAFELY WITHSTAND A LARGE-SCALE DISASTER OR EMER
GENCY?'
HADHYST2 = 'HAD HYSTERECTOMY'
HADMAM = 'HAVE YOU EVER HAD A MAMMOGRAM'
HADPAP2 = 'EVER HAD A PAP TEST'
HADSIGM3 = 'EVER HAD SIGMOIDOSCOPY/COLONOSCOPY'
HAVHPCH = 'CHILD STILL HAVE HEALTH PROBLEM'
HECHMHOM = 'HOW MANY DAYS WERE CHEMICALS APPLIED INSIDE YOUR HOME TO KILL PESTS IN PAST 12 MONTHS?
'
HECHMYRD = 'HOW MANY DAYS WERE CHEMICALS APPLIED IN YOUR LAWN TO KILL PESTS IN PAST 12 MONTHS?'
HEIGHT3 = 'REPORTED HEIGHT IN FEET AND INCHES'
HEPBRSN = 'DO ANY HIGH RISK SITUATIONS APPLY'
HEPBVAC = 'EVER HAD HEPATITIS B VACCINE'
HEWTRDRK = 'WHICH BEST DESCRIBES THE WATER THAT YOU DRINK AT HOME MOST OFTEN?'
HEWTRSRC = 'WHAT IS THE MAIN SOURCE OF HOME WATER SUPPLY?'
HISPANC2 = 'HISPANIC/LATINO'
HIVRDTST = 'WAS YOUR LAST HIV TEST A RAPID TEST?'
HIVTST5 = 'EVER TESTED HIV'
HIVTSTD2 = 'MONTH AND YEAR OF LAST HIV TEST'
HLTHPLAN = 'HAVE ANY HEALTH CARE COVERAGE'
HOUSESMK = 'SMOKING POLICY AT HOME'
HOWLONG = 'HOW LONG SINCE LAST MAMMOGRAM'
HTIN3 = 'COMPUTED HEIGHT IN INCHES'
HTM3 = 'COMPUTED HEIGHT IN METERS'
IAQCODTR = 'DO YOU HAVE A CO DETECTOR IN YOUR HOME?'
IAQGASAP = 'DOES YOUR HOME HAVE ANY NATURAL GAS POWERED APPLIANCES?'
IAQHTDYS = 'HOW MANY DAYS DID YOU USED FIREPLACE OR KEROSENE HEATER IN PAST 12 MONTHS?'
IAQHTSRC = 'IS HOME HEATED WITH A FURNACE THAT BURNS OIL, GAS, COAL, OR OTHER FUEL?'
IAQMOLD = 'CURRENTLY HAVE MOLD IN HOME ON AN AREA GREATER THAN THE SIZE OF A DOLLAR BILL?'
IDATE = 'INTERVIEW DATE'
IDAY = 'INTERVIEW DAY'
IMONTH = 'INTERVIEW MONTH'
INCOME2 = 'INCOME LEVEL'
INDOORS = 'INDOOR WORK LOCATION'
INSULIN = 'NOW TAKING INSULIN'
INTVID = 'INTERVIEWER IDENTIFICATION'
IPVPHHRT = 'SEX PARTNER EVER VIOLENT'
IPVPHYV1 = 'SEX PARTNER EVER ATTEMPTED VIOLENCE'
IPVPVL12 = 'HAD UNWANTED SEX OR VIOLENCE FROM SEX PARTNER LAST 12 MOS'
IPVRELT1 = 'RELATIONSHIP TO SEX PARTNER LAST VIOLENCE OR UNWANTED SEX'
IPVSAFE = 'IN A SAFE PLACE TO ANSWER QUESTIONS'
IPVSXINJ = 'INJURIES FROM VIOLENCE OR UNWANTED SEX PAST 12 MOS'
IPVTHRAT = 'SEX PARTNER EVER THREATENED VIOLENCE'
IPVUWSEX = 'EVER HAD UNWANTED SEX W/ PARTNER'
IYEAR = 'INTERVIEW YEAR'
LASTDEN3 = 'LAST VISITED DENTIST OR DENTAL CLINIC'
LASTPAP2 = 'HOW LONG SINCE LAST PAP TEST'
LASTSIG2 = 'TIME SINCE LAST SIGMOIDOSCOPY/COLONOSCOPY'
LENGEXAM = 'HOW LONG SINCE LAST BREAST PHYSICAL EXAM'
LSATISFY = 'SATISFACTION WITH LIFE'
LSTBLDS2 = 'TIME SINCE LAST BLOOD STOOL TEST'
MARITAL = 'MARITAL STATUS'
MAXDRNKS = 'MOST DRINKS ON SINGLE OCCASION PAST 30 DAYS'
MEDCOST = 'COULD NOT SEE DR. BECAUSE OF COST'
MENTHLTH = 'NUMBER OF DAYS MENTAL HEALTH NOT GOOD'
MRACE = 'MULTIPLE RACE'
MRACEASC = 'MRACEORG WITH RESPONSES IN ASCENDING ORDER CALCULATED VARIABLE'
MRACEORG = 'MRACE WITH TRAILING 7,8,9S REMOVED CALCULATED VARIABLE'
MSCODE = 'METROPOLITAN STATUS CODE'
MULTIVIT = 'MULTIVITAMIN USER'
NATTMPTS = 'NUMBER OF ATTEMPTS'
NOBCUSE2 = 'WHAT IS MAIN REASON FOR NOT USING BIRTH CONTROL?'
NRECSEL = 'NUMBER OF SAMPLE RECORDS SELECTED FROM STRATUM'
NRECSTR = 'NUMBER OF TELEPHONE NUMBERS IN STRATUM FROM WHICH SAMPLE WAS SELECTED'
NUMADULT = 'NUMBER OF ADULTS IN HOUSEHOLD'
NUMHHOL2 = 'HOUSEHOLD TELEPHONES'
NUMMEN = 'NUMBER OF ADULT MEN IN HOUSEHOLD'
NUMPHON2 = 'RESIDENTIAL PHONES'
NUMWOMEN = 'NUMBER OF ADULT WOMEN IN HOUSEHOLD'
ORACE2 = 'RESPONDENT RACE CHOICE'
PAINACT2 = 'HOW MANY DAYS HARD TO DO USUAL ACTIVITIES IN PAST 30 DAYS'
PERSDOC2 = 'MULTIPLE HEALTH CARE PROFESSIONALS'
PHYSHLTH = 'NUMBER OF DAYS PHYSICAL HEALTH NOT GOOD'
PNEUVAC3 = 'PNEUMONIA SHOT EVER'
POORHLTH = 'POOR PHYSICAL HEALTH'
PRECALL = 'PRE-CALL STATUS CODE'
PREGNANT = 'PREGNANCY STATUS'
PROFEXAM = 'EVER HAD BREAST PHYSICAL EXAM BY DOCTOR'
PROSTATE = 'EVER TOLD YOU HAD PROSTATE CANCER'
PSATEST = 'EVER HAD PSA TEST'
PSATIME = 'TIME SINCE LAST PSA TEST'
PVTRESID = 'PRIVATE RESIDENCE?'
QLACTLM2 = 'ACTIVITY LIMITATION DUE TO HEALTH PROBLEMS'
QLHLTH2 = 'HOW MANY DAYS FULL OF ENERGY IN PAST 30 DAYS'
QLMENTL2 = 'HOW MANY DAYS DEPRESSED IN PAST 30 DAYS'
QLREST2 = 'HOW MANY DAYS DID YOU GET ENOUGH SLEEP IN PAST 30 DAYS'
QLSTRES2 = 'HOW MANY DAYS FELT ANXIOUS IN PAST 30 DAYS'
QSTLANG = 'LANGUAGE IDENTIFIER'
QSTVER = 'QUESTIONNAIRE VERSION IDENTIFIER'
RACE2 = 'COMPUTED RACE-ETHNICITY GROUPING'
RCHISLAT = 'ETHNICITY OF CHILD'
RCSBIRTH = 'BIRTH DATE OF CHILD'
RCSBRACE = 'RACE OF CHILD'
RCSGENDR = 'GENDER OF CHILD'
RCSRACE = 'RACE OF CHILD (MULTIPLE POSSIBLE)'
RCSRELN1 = 'RELATIONSHIP TO CHILD'
RCVFVCH2 = 'DATE CHILD RCVD MOST RECENT FLU VACCINE(MMYYYY)'
RECOMMEN = 'REASON TO TAKE FOLIC ACID'
REPDEPTH = 'REPLICATE DEPTH'
REPNUM = 'REPLICATE NUMBER'
RMVTETH3 = 'NUMBER OF PERMANENT TEETH REMOVED'
RNOFVCH2 = 'MAIN REASON CHILD NO FLU VACCINE THIS SEASON'
RRATWORK = 'HOW DO YOU FEEL YOU WERE TREATED AT WORK COMPARED TO PEOPLE OF OTHER RACES IN PAST 12
MONTHS?'
RRCLASS2 = 'HOW DO OTHER PEOPLE USUALLY CLASSIFY YOU IN THIS COUNTRY?'
RRCOGNT2 = 'HOW OFTEN DO YOU THINK ABOUT YOUR RACE?'
RREMTSM1 = 'TIMES PAST 12 MOS FELT EMOTIONALLY UPSET BECAUSE OF TREATMENT DUE TO YOUR RACE'
RRHCARE2 = 'WHEN SEEKING HEALTH CARE, HOW DO YOU FEEL COMPARED TO PEOPLE OF OTHER RACES IN THE PAS
T 12 MONTHS?'
RRPHYSM1 = 'TIMES PAST 12 MOS FELT PHYSICAL SYMPTOMS BECAUSE OF TREATMENT DUE TO YOUR RACE'
SEATBELT = 'HOW OFTEN USE SEATBELTS IN CAR?'
SEQNO = 'ANNUAL SEQUENCE NUMBER'
SEX = 'RESPONDENTS SEX'
SMKPUBLC = 'WORK SMOKING POLICY FOR INDOOR COMMON AREAS'
SMKWORK = 'SMOKING POLICY FOR WORK AREAS'
SMOKDAY2 = 'FREQUENCY OF DAYS NOW SMOKING'
SMOKE100 = 'SMOKED AT LEAST 100 CIGARETTES'
STOPSMK2 = 'STOPPED SMOKING IN PAST 12 MONTHS'
SVEANOS1 = 'SOMEONE EVER ATTEMPT TO HAVE SEX AGAINST WILL BUT DID NOT HAPPEN'
SVEHDSE1 = 'SOMEONE EVER HAD SEX WITH YOU AGAINST YOUR WILL'
SVGENDER = 'PERSON�S GENDER WHO HAD SEX WITH YOU AGAINST YOUR WILL'
SVHDSX12 = 'HAPPENED IN THE PAST 12 MONTHS'
SVNOSX12 = 'HAPPENED IN THE PAST 12 MONTHS'
SVNOTCH = 'SOMEONE PAST 12 MOS PUT YOU IN UNWANTED SEX SITUATION W/O TOUCHING'
SVRELAT2 = 'RELATIONSHIP TO PERSON MOST RECENTLY ATTEMPTING OR HAVING UNWANTED SEX'
SVSAFE = 'IN A SAFE PLACE TO ANSWER QUESTIONS'
SVSEXTCH = 'UNWANTED TOUCHING OF SEXUAL PARTS OF BODY PAST 12 MOS'
TAKEVIT = 'TIME FREQUENCY VITAMIN USE'
TELSERV2 = 'LOST PHONE SERVICE ONE WEEK+ LAST 12 MOS'
TYPCNTR4 = 'WHAT METHOD ARE YOU USING?'
USEEQUIP = 'HEALTH PROBLEMS REQUIRING SPECIAL EQUIPMENT'
VETERAN = 'ARE YOU A VETERAN'
VIATWRK2 = 'EYE INJURY AT WORKPLACE'
VICTRCT2 = 'HLTH CARE PRO SAID NOW HAVE CATARACTS'
VIDFCLT2 = 'DIFFICULTY RECOGNIZING FRIEND ACROSS STREET'
VIEYEXM2 = 'WHEN LAST EYEXAM'
VIGLUMA2 = 'HLTH CARE PRO EVER SAID HAVE GLAUCOMA'
VIINSUR2 = 'EYE CARE HEALTH INSURANCE'
VIMACDG2 = 'HLTH CARE PRO EVER SAID HAVE MACULAR DEGENERATION'
VINOCRE2 = 'REASON DID NOT USE EYE DOC PAST 12 MOS'
VIPRFVS2 = 'LAST TIME VISITED EYE CARE PROVIDER'
VIREDIF2 = 'DIFFICULTY READING TYPED TEXT'
VITAMINS = 'CURRENT VITAMIN USER'
WEIGHT2 = 'REPORTED WEIGHT IN POUNDS'
WHRTST7 = 'LOCATION OF LAST HIV TEST'
WTKG2 = 'COMPUTED WEIGHT IN KILOGRAMS'
_AGE65YR = 'REPORTED AGE IN TWO AGE GROUPS CALCULATED VARIABLE'
_AGEG5YR = 'REPORTED AGE IN FIVE-YEAR AGE CATEGORIES CALCULATED VARIABLE'
_AGEG_ = 'AGE GROUP CODES USED IN POST-STRATIFICATION.'
_AGE_G = 'IMPUTED AGE IN SIX GROUPS'
_AIDTST2 = 'EVER BEEN TESTED FOR HIV CALCULATED VARIABLE'
_ALTETH2 = 'ADULTS AGED 65+ WHO HAVE HAD ALL THEIR NATURAL TEETH EXTRACTED'
_ASTHMST = 'COMPUTED ASTHMA STATUS'
_BMI4 = 'COMPUTED BODY MASS INDEX'
_BMI4CAT = 'COMPUTED BODY MASS INDEX CATEGORIES'
_CAGEG_ = 'CHILD AGE GROUP CODES USED IN POST-STRATIFICATION.'
_CASTHMA = 'CURRENT ASTHMA CALCULATED VARIABLE'
_CHILDWT = 'FINAL CHILD WEIGHT'
_CHLDCNT = 'COMPUTED NUMBER OF CHILDREN IN HOUSEHOLD'
_CNRACE = 'COMPUTED NUMBER OF CENSUS RACE CATEGORIES CHOSEN'
_CNRACEC = 'COMPUTED NUMBER OF CENSUS RACE CATEGORIES CHOSEN, COLLAPSED'
_CRACE = 'CHILD NON-HISPANIC RACE INCLUDING MULTIRACIAL'
_CRACEG_ = 'CHILD RACE GROUP CODES USED IN POST-STRATIFICATION.'
_CSEXG_ = 'CHILD GENDER GROUP CODES USED IN POST-STRATIFICATION.'
_DENSTR2 = 'HOUSEHOLD DENSITY STRATUM CODE'
_DENVST1 = 'ADULTS THAT HAVE VISITED A DENTIST, DENTAL HYGENIST OR DENTAL CLINIC WITHIN THE PAST Y
EAR'
_DRNKDY3 = 'COMPUTED NUMBER OF DRINKS OF ALCOHOL BEVERAGES PER DAY'
_DRNKMO3 = 'COMPUTED TOTAL NUMBER DRINKS A MONTH'
_EDUCAG = 'COMPUTED LEVEL OF EDUCATION COMPLETED CATEGORIES'
_EXTETH2 = 'RISK FACTOR FOR HAVING HAD PERMANENT TEETH EXTRACTED'
_FINALWT = 'FINAL WEIGHT'
_FLSHOT3 = 'FLU SHOT CALCULATED VARIABLE'
_GEOSTR = 'GEOGRAPHIC STRATUM CODE'
_HOUSEWT = 'FINAL HOUSEHOLD WEIGHT'
_IMPAGE = 'AGE VALUE USED TO DETERMINE AGE GROUPS'
_IMPNPH = 'IMPUTED NUMBER OF PHONES'
_INCOMG = 'COMPUTED INCOME CATEGORIES'
_ITSCF1 = 'INTERRUPTION IN TELEPHONE SERVICE CORRECTION FACTOR'
_ITSCF2 = 'INTERRUPTION IN TELEPHONE SERVICE CORRECTION FACTOR (ADJUSTED _WT2)'
_ITSFINL = 'INTERRUPTION IN TELEPHONE SERVICE FINAL WEIGHTING FACTOR'
_ITSPOST = 'INTERRUPTION IN TELEPHONE SERVICE POST STRATIFICATION CORRECTION FACTOR'
_LTASTHM = 'LIFETIME ASTHMA CALCULATED VARIABLE'
_MAM502Y = 'WOMEN RESPONDENTS AGED 50+ THAT HAVE HAD A MAMMOGRAM IN THE PAST TWO YEARS'
_MRACE = 'COMPUTED NON-HISPANIC RACE INCLUDING MULTIRACIAL'
_PNEUMO2 = 'PNEUMONIA VACCINATION CALCULATED VARIABLE'
_POSTCH = 'POST-STRATIFICATION CHILD WEIGHT'
_POSTHH = 'POST-STRATIFICATION HOUSEHOLD WEIGHT'
_POSTSTR = 'POST-STRATIFICATION WEIGHT'
_PRACE = 'COMPUTED PREFERRED RACE'
_PSU = 'PRIMARY SAMPLING UNIT'
_RACEG2 = 'COMPUTED NON-HISPANIC WHITES/ALL OTHERS RACE CATEGORIES RACE/ETHNIC GROUP CODES USED IN
 POST-STRATIFICATION.'
_RACEG3_ = 'RACE GROUP CODES USED IN POST-STRATIFICATION.'
_RACEG4_ = 'RACE GROUP CODES USED IN POST-STRATIFICATION.'
_RACEGR2 = 'COMPUTED FIVE LEVEL RACE/ETHNICITY CATEGORY.'
_RACE_G = 'COMPUTED RACE GROUPS USED FOR INTERNET PREVALENCE TABLES'
_RAW = 'RAW WEIGHTING FACTOR'
_RAWCH = 'RAW CHILD WEIGHTING FACTOR'
_RAWHH = 'RAW HOUSEHOLD  WEIGHTING FACTOR'
_REGION = 'REGION'
_RFBING4 = 'BINGE DRINKING CALCULATED VARIABLE'
_RFBLDST = 'RESPONDENTS AGED 50+ THAT HAVE HAD A BLOOD STOOL TEST WITHIN THE PAST TWO YEARS'
_RFBMI4 = 'OVERWEIGHT OR OBESE CALCULATED VARIABLE'
_RFDRHV3 = 'HEAVY ALCOHOL CONSUMPTION  CALCULATED VARIABLE'
_RFDRMN3 = 'ADULT MEN HEAVY ALCOHOL CONSUMPTION CALCULATED VARIABLE'
_RFDRWM3 = 'ADULT WOMEN HEAVY ALCOHOL CONSUMPTION CALCULATED VARIABLE'
_RFHLTH = 'ADULTS WITH GOOD OR BETTER HEALTH'
_RFMAM2Y = 'WOMEN RESPONDENTS AGED 40+ THAT HAVE HAD A MAMMOGRAM IN THE PAST TWO YEARS'
_RFPAP32 = 'WOMEN RESPONDENTS AGED 18+ THAT HAVE HAD A PAP TEST IN THE PAST THREE YEARS'
_RFPSA2Y = 'MALE RESPONDENTS AGED 40+ THAT HAVE HAD A PSA TEST IN THE PAST 2 YEARS'
_RFSEAT2 = 'ALWAYS OR NEARLY ALWAYS WEAR SEAT BELTS'
_RFSEAT3 = 'ALWAYS WEAR SEAT BELTS'
_RFSIGM2 = 'RESPONDENTS AGED 50 OR OLDER THAT HAVE HAD A SIGMOIDOSCOPY OR COLONOSCOPY'
_RFSMOK3 = 'CURRENT SMOKING CALCULATED VARIABLE'
_SEXG_ = 'GENDER GROUP CODES USED IN POST-STRATIFICATION.'
_SMOKER3 = 'COMPUTED SMOKING STATUS'
_STATE = 'STATE FIPS CODE'
_STRWT = 'STRATUM WEIGHT'
_STSTR = 'SAMPLE DESIGN STRATIFICATION VARIABLE'
_TOTINDA = 'LEISURE TIME PHYSICAL ACTIVITY CALCULATED VARIABLE'
_WT2 = 'DESIGN WEIGHT'
_WT2CH = 'CHILD DESIGN WEIGHT'
_WT2HH = 'HOUSEHOLD DESIGN WEIGHT'
;
RUN;
