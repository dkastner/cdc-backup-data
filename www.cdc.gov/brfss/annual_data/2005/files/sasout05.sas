*****************************************************************************************
* FILE NAME:     SASOUT05.SAS                                                           *
* DESCRIPTION:   THIS PROGRAM CONVERTS A STATES ASCII DATAFILE OF COMPLETES LOCATED AT  *
*                <DATAIN> FILEREF, INTO A SAS DATABASE STORED AT <DATAOUT> LIBREF       *
* REFERENCES:                                                                           *
* INPUT       DATAIN           FILEREF OF ASCII DATAFILE OF COMPLETES                   *
* FORMATS     FORMATS.SAS7BCAT      SAS FORMATS DATABASE                                *
* OUTPUT      DATAOUT.SASDATA  SAS DATABASE VERSION OF ASCII DATA AS SPECIFIED IN       *
*                              <DATAIN> FILEREF                                         *
* UPDATED - 12/19/2006                                                                  *
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

*FILENAME DATAIN '<PATH OF INPUT STATE ASCII DATAFILE OF COMPLETES>' LRECL = 1283 ;
*****************************************************************************
* EXAMPLE:                                                                  *
*       FILENAME DATAIN 'C:\BRFSS\2003\CDBRFS03.ASC' LRECL = 1283           *
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

*LIBNAME LIBRARY '<PATH OF STORED SAS FORMAT05.SAS7BCAT>' ;
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
CELLFON       58
PVTRESID      59
NUMADULT      60-61
NUMMEN        62-63
NUMWOMEN      64-65
GENHLTH       73                      /* Section 1: Health Status */
PHYSHLTH      74-75                   /* Section 2: Healthy Days - Health-Related Quality of Life */
MENTHLTH      76-77
POORHLTH      78-79
HLTHPLAN      80                      /* Section 3: Health Care Access */
PERSDOC2      81
MEDCOST       82
CHECKUP       83
EXERANY2      84                      /* Section 4: Exercise */
DIABETE2      85                      /* Section 5: Diabetes */
BPHIGH4       86                      /* Section 6: Hypertension Awareness */
BPMEDS        87
BLOODCHO      88                      /* Section 7: Cholesterol Awareness */
CHOLCHK       89
TOLDHI2       90
CVDINFR3      91                      /* Section 8: Cardiovascular Disease */
CVDCRHD3      92
CVDSTRK3      93
ASTHMA2       94                      /* Section 9: Asthma */
ASTHNOW       95
FLUSHOT3      96                      /* Section 10: Immunization */
FLUSPRY2      97
PNEUVAC3      98
SMOKE100      99                      /* Section 11: Tobacco Use */
SMOKDAY2      100
STOPSMK2      101
DRNKANY4      102                     /* Section 12: Alcohol Consumption */
ALCDAY4       103-105
AVEDRNK2      106-107
DRNK2GE5      108-109
MAXDRNKS      110-111
AGE           112-113                 /* Section 13: Demographics */
HISPANC2      114
MRACE         $115-120
ORACE2        121
MARITAL       122
CHILDREN      123-124
EDUCA         125
EMPLOY        126
INCOME2       127-128
WEIGHT2       129-132
HEIGHT3       133-136
CTYCODE       137-139
NUMHHOL2      145
NUMPHON2      146
TELSERV2      147
SEX           148
PREGNANT      149
VETERAN       150                     /* Section 14: Veterans Status */
QLACTLM2      151                     /* Section 15: Disability */
USEEQUIP      152
PAIN30DY      153                     /* Section 16: Arthritis Burden */
JOINTSYM      154
JOINTRT2      155
HAVARTH2      156
LMTJOIN2      157
FRUITJUI      158-160                 /* Section 17: Fruits & Vegetables */
FRUIT         161-163
GREENSAL      164-166
POTATOES      167-169
CARROTS       170-172
VEGETABL      173-175
JOBACTIV      176                     /* Section 18: Physical Activity */
MODPACT       177
MODPADAY      178-179
MODPATIM      180-182
VIGPACT       183
VIGPADAY      184-185
VIGPATIM      186-188
HIVTST5       189                     /* Section 19: HIV/AIDS */
HIVTSTD2      190-195
WHRTST7       196-197
HIVRISK2      198
EMTSUPRT      199                     /* Section 20: Emotional Support and Life Satisfaction */
LSATISFY      200
DIABAGE2      201-202                 /* Module 1: Diabetes */
INSULIN       203
DIABPILL      204
BLDSUGAR      205-207
FEETCHK2      208-210
FEETSORE      211
DOCTDIAB      212-213
CHKHEMO3      214-215
FEETCHK       216-217
EYEEXAM       218
DIABEYE       219
DIABEDU       220
LASTDEN3      221                     /* Module 2: Oral Health */
RMVTEETH      222
DENCLEAN      223
VIDIFCLT      224                     /* Module 3: Visual Impairment and Access to Eye Care */
VITELDIF      225
VIREADIF      226
VIPRFVST      227
VINOCARE      228-229
VIEYEEXM      230
VIINSUR       231
VICATRCT      232
VIGLUCMA      233
VIMACDEG      234
VIATWORK      235
VIMISWRK      236-238
PAINACT2      239-240                 /* Module 4: Healthy Days (Symptoms) */
QLMENTL2      241-242
QLSTRES2      243-244
QLREST2       245-246
QLHLTH2       247-248
HAREHAB       249                     /* Module 5: Cardiovascular Health */
STREHAB       250
CVDASPRN      251
ASPUNSAF      252
BPEATHBT      253                     /* Module 6: Actions to Control High Blood Pressure */
BPSALT        254
BPALCHOL      255
BPEXER        256
BPEATADV      257
BPSLTADV      258
BPALCADV      259
BPEXRADV      260
BPMEDADV      261
BPHI2MR       262
HASYMP1       263                     /* Module 7: Heart Attack and Stroke */
HASYMP2       264
HASYMP3       265
HASYMP4       266
HASYMP5       267
HASYMP6       268
STRSYMP1      269
STRSYMP2      270
STRSYMP3      271
STRSYMP4      272
STRSYMP5      273
STRSYMP6      274
FIRSTAID      275
FLUSTLOC      276-277                 /* Module 8: Influenza */
ASTHMAGE      278-279                 /* Module 9: Adult Asthma History */
ASATTACK      280
ASERVIST      281-282
ASDRVIST      283-284
ASRCHKUP      285-286
ASACTLIM      287-289
ASYMPTOM      290
ASNOSLEP      291
ASTHMED2      292
ASINHALR      293
RCSBIRTH      $294-299                /* Module 10: Random Child Selection */
RCSGENDR      300
RCHISLAT      301
RCSRACE       $302-307
RCSBRACE      308
RCSRELTN      309
CASTHDX2      310                     /* Module 11: Childhood Asthma */
CASTHNO2      311
CIFLUSHT      312                     /* Module 12: Child Immunization */
CIFLUMST      313
HADMAM        314                     /* Module 13: Women�s Health */
HOWLONG       315
PROFEXAM      316
LENGEXAM      317
HADPAP2       318
LASTPAP2      319
HADHYST2      320
PSATEST       321                     /* Module 14: Prostate Cancer Screening */
PSATIME       322
DIGRECEX      323
DRETIME       324
PROSTATE      325
BLDSTOOL      326                     /* Module 15: Colorectal Cancer Screening */
LSTBLDS2      327
HADSIGM3      328
LASTSIG2      329
OSTPROS       330                     /* Module 16: Osteoporosis */
ARTTODAY      331                     /* Module 17: Arthritis Management */
ARTHWGT       332
ARTHEXER      333
ARTHEDU       334
LOSEWT        335                     /* Module 18: Weight Control */
MAINTAIN      336
FEWCAL        337
PHYACT        338
DRADVICE      339
IAQHTSRC      340                     /* Module 19: Indoor Air Quality */
IAQGASAP      341
IAQHTDYS      342-344
IAQCODTR      345
IAQMOLD       346
HEWTRSRC      347                     /* Module 20: Home Environment */
HEWTRDRK      348
HECHMHOM      349-351
HECHMYRD      352-354
SCLSTSMK      355-356                 /* Module 21: Smoking Cessation */
SCGETCAR      357-358
SCQITSMK      359-360
SCDSCMED      361-362
SCDSCMTH      363-364
HOUSESMK      365                     /* Module 22: Secondhand Smoke Policy */
INDOORS       366
SMKPUBLC      367
SMKWORK       368
VETSTAT2      369                     /* Module 23: Veterans Status */
VACARE        370
RRCLASS2      371                     /* Module 24: Reactions to Race */
RRCOGNT2      372
RRATWORK      373
RRHCARE2      374
RRPHYSM1      375
RREMTSM1      376
SVNOTCH       377                     /* Module 25: Sexual Violence */
SVSEXTCH      378
SVNOSEX       379
SVHADSEX      380
SVRELATN      381-382
SVGENDER      383
SVEANOSX      384
SVEHDSEX      385
IPVTHRAT      386                     /* Module 26: Intimate Partner Violence */
IPVPHHRT      387
IPVPHYVL      388
IPVUWSEX      389
IPVPVL12      390
IPVSXINJ      391
IPVRELTN      392-393
SIPVSKP       394                     /* Module 25 or 26 Skipped */
QSTVER        741                     /* Questionnaire Version */
QSTLANG       742-743                 /* Questionnaire Language */
MSCODE        796
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
_IMPAGE       941-942
_IMPNPH       943
_MSACODE      $987-991
_RFHLTH       1155                    /* Calculated Variables */
_TOTINDA      1156                    /* Calculated Variables */
_RFHYPE5      1157                    /* Calculated Variables */
_CHOLCHK      1158                    /* Calculated Variables */
_RFCHOL       1159
_LTASTHM      1160                    /* Calculated Variables */
_CASTHMA      1161
_ASTHMST      1162
_FLSHOT3      1163                    /* Calculated Variables */
_PNEUMO2      1164
_SMOKER3      1165                    /* Calculated Variables */
_RFSMOK3      1166
DROCDY2_      1167-1169               /* Calculated Variables */
_RFBING3      1170
_DRNKDY3      1171-1174
_DRNKMO3      1175-1178
_RFDRHV3      1179
_RFDRMN3      1180
_RFDRWM3      1181
MRACEORG      $1182-1187              /* Calculated Race Variables */
MRACEASC      1188-1193
_PRACE        1194-1195
_MRACE        1196-1197
RACE2         1198
_RACEG2       1199
_RACEGR2      1200
_RACE_G       1201
_CNRACE       1202
_CNRACEC      1203
_AGEG5YR      1204-1205
_AGE65YR      1206
_AGE_G        1207
HTIN3         1208-1210
HTM3          1211-1213
WTKG2         1214-1218
_BMI4         1219-1222
_BMI4CAT      1223
_RFBMI4       1224
_CHLDCNT      1225
_EDUCAG       1226
_INCOMG       1227
_DRDXART      1228                    /* Calculated Variables */
FTJUDAY_      1229-1231               /* Calculated Variables */
FRUTDAY_      1232-1234
GNSLDAY_      1235-1237
POTADAY_      1238-1240
CRTSDAY_      1241-1243
VEGEDAY_      1244-1246
_FRTSERV      1247-1251
_FRTINDX      1252
_FV5SRV       1253
_MODPAMN      1254-1256               /* Calculated Variables */
_VIGPAMN      1257-1259
MODCAT_       1260
VIGCAT_       1261
PACAT_        1262
_RFPAMOD      1263
_RFPAVIG      1264
_RFPAREC      1265
_RFNOPA       1266
_AIDTST2      1267                    /* Calculated Variables */
_HIGHRSK      1268
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
AGE = 'REPORTED AGE IN YEARS'
ALCDAY4 = 'DAYS IN PAST 30 HAD ALCOHOLIC BEVERAGE'
ARTHEDU = 'EVER TAKEN CLASS IN MANAGING ARTHRITIS OR JOINT SYMPTOMS'
ARTHEXER = 'DR. SUGGEST USE OF PHYSICAL ACTIVITY OR EXERCISE FOR ARTHRITIS OR JOINT SYMPTOMS'
ARTHWGT = 'DR. SUGGEST LOSE WEIGHT FOR ARTHRITIS OR JOINT SYMPTOMS'
ARTTODAY = 'WHAT CAN YOU DO BECAUSE OF ARTHRITIS OR JOINT SYMPTOMS'
ASACTLIM = 'DAYS MISSED WORK DUE TO ASTHMA'
ASATTACK = 'ASTHMA ATTACK LAST 12 MOS'
ASDRVIST = 'DOC VISITS LAST 12 MOS FOR ASTHMA'
ASERVIST = 'ER VISITS LAST 12 MOS FOR ASTHMA'
ASINHALR = 'TIMES USED ASTHMA INHALER DURING AN ATTACK IN PAST 30 DAYS'
ASNOSLEP = 'SLEEP PROBS FROM ASTHMA LAST 30 DAYS'
ASPUNSAF = 'HEALTH MAKES TAKING ASPIRIN UNSAFE'
ASRCHKUP = 'ROUTINE CHECKUPS LAST 12 MOS FOR ASTHMA'
ASTHMA2 = 'EVER HAD ASTHMA'
ASTHMAGE = 'AGE WHEN DOC SAID HAD ASTHMA'
ASTHMED2 = 'TIMES USED PRESCRIBED PREVENTATIVE ASTHMA MED IN PAST 30 DAYS'
ASTHNOW = 'HAVE ASTHMA NOW'
ASYMPTOM = 'SYMPTOMS OF ASTHMA LAST 30 DAYS'
AVEDRNK2 = 'AVG ALCOHOLIC DRINKS PER DAY IN PAST 30'
BLDSTOOL = 'EVER HAD BLOOD STOOL TEST USING HOME KIT'
BLDSUGAR = 'HOW OFTEN CHECK BLOOD FOR GLUCOSE'
BLOODCHO = 'EVER HAD BLOOD CHOLESTEROL CHECKED'
BPALCADV = 'HLTH CARE PRO EVER ADVISED REDUCED ALCOHOL USE TO REDUCE BP'
BPALCHOL = 'REDUCE ALCOHOL USE FOR BP?'
BPEATADV = 'HLTH CARE PRO EVER ADVISED CHANGE IN EATING HABITS TO REDUCE BP'
BPEATHBT = 'CHANGE EATING HABITS FOR BP?'
BPEXER = 'EXERCISING TO LOWER BP?'
BPEXRADV = 'HLTH CARE PRO EVER ADVISED EXERCISE TO REDUCE BP'
BPHI2MR = 'TOLD HAD HIGH BP DURING 2+ VISITS TO HLTH CARE PRO?'
BPHIGH4 = 'EVER TOLD BLOOD PRESSURE HIGH'
BPMEDADV = 'HLTH CARE PRO EVER ADVISED MEDS TO REDUCE BP'
BPMEDS = 'MEDS FOR BLOOD PRESSURE'
BPSALT = 'REDUCE SALT INTAKE TO LOWER BP?'
BPSLTADV = 'HLTH CARE PRO EVER ADVISED USING LESS SALT TO REDUCE BP'
CARROTS = 'HOW OFTEN DO YOU EAT CARROTS'
CASTHDX2 = 'HLTH PRO EVER SAID CHILD HAS ASTHMA'
CASTHNO2 = 'CHILD STILL HAVE ASTHMA?'
CELLFON = 'CELLULAR TELEPHONE'
CHECKUP = 'HOW LONG SINCE LAST ROUTINE CHECKUP'
CHILDREN = '# CHILDREN UNDER 18 IN HOUSEHOLD'
CHKHEMO3 = 'CHECKED FOR HEMOGLOBIN �A ONE C�'
CHOLCHK = 'HOW LONG SINCE CHOLESTEROL CHECKED'
CIFLUMST = 'CHILD FLU SPRAY PAST 12 MOS'
CIFLUSHT = 'CHILD FLU SHOT PAST 12 MOS'
CRTSDAY_ = 'CARROT SERVINGS PER DAY'
CTELENUM = 'CORRECT NUMBER?'
CTYCODE = 'COUNTY CODE'
CVDASPRN = 'TAKE ASPIRIN DAILY OR EVERY OTHER DAY'
CVDCRHD3 = 'EVER TOLD HAD CORONARY HEART DISEASE'
CVDINFR3 = 'EVER TOLD HAD MYOCARDIAL INFARCTION'
CVDSTRK3 = 'EVER TOLD HAD STROKE'
DENCLEAN = 'HOW LONG SINCE LAST TEETH CLEANING'
DIABAGE2 = 'AGE TOLD HAVE DIABETES'
DIABEDU = 'EVER TAKEN CLASS TO MANAGE DIABETES'
DIABETE2 = 'EVER TOLD BY DOCTOR YOU HAVE DIABETES'
DIABEYE = 'DIABETES AFFECT EYES OR HAD RETINOPATHY'
DIABPILL = 'NOW TAKING DIABETES PILLS'
DIGRECEX = 'EVER HAD RECTAL EXAM'
DISPCODE = 'DISPOSITION OF INTERVIEW'
DOCTDIAB = 'TIMES SEEN HEALTH PROF FOR DIABETES'
DRADVICE = 'PROFESSIONAL ADVICE ABOUT WEIGHT'
DRETIME = 'TIME SINCE RECTAL EXAM'
DRNK2GE5 = 'FIVE OR MORE DRINKS ON AN OCCASION'
DRNKANY4 = 'DAYS IN PAST 30 HAD ALCOHOLIC BEVERAGE'
DROCDY2_ = 'DRINK-OCCASIONS-PER-DAY'
EDUCA = 'EDUCATION LEVEL'
EMPLOY = 'EMPLOYMENT STATUS'
EMTSUPRT = 'HOW OFTEN GET EMOT SUPPORT NEEDED'
EXERANY2 = 'EXERCISE LAST 30 DAYS'
EYEEXAM = 'LAST EYE EXAM WHERE PUPILS WERE DILATED'
FEETCHK = 'TIMES FEET CHECK FOR SORES/IRRITATIONS'
FEETCHK2 = 'HOW OFTEN CHECK FEET FOR SORES'
FEETSORE = 'SORES ON FEET MORE THAN 4 WEEKS TO HEAL'
FEWCAL = 'FEWER CALORIES AND/OR LESS FAT'
FIRSTAID = 'STROKE SYMPT: 1ST RESP FOR H ATTK VICTIM'
FLUSHOT3 = 'FLU SHOT PAST 12 MOS'
FLUSPRY2 = 'FLU SPRAY PAST 12 MOS'
FLUSTLOC = 'WHERE OBTAINED MOST RECENT FLU SHOT/SPRAY'
FMONTH = 'MONTH NAME OF SOURCE FILE'
FRUIT = 'HOW OFTEN DO YOU EAT FRUIT'
FRUITJUI = 'HOW OFTEN DO YOU DRINK FRUIT JUICES'
FRUTDAY_ = 'FRUIT SERVINGS PER DAY'
FTJUDAY_ = 'FRUIT JUICE SERVINGS PER DAY'
GENHLTH = 'GENERAL HEALTH'
GNSLDAY_ = 'GREEN SALAD SERVINGS PER DAY'
GREENSAL = 'HOW OFTEN DO YOU EAT GREEN SALAD'
HADHYST2 = 'EVER HAD A HYSTERECTOMY'
HADMAM = 'HAVE YOU EVER HAD A MAMMOGRAM'
HADPAP2 = 'EVER HAD A PAP TEST'
HADSIGM3 = 'EVER HAD A SIGMOIDOSCOPY/COLONOSCOPY'
HAREHAB = 'OUTPATIENT REHAB AFTER HEART ATTACK HOSP STAY'
HASYMP1 = 'HRT ATTK SYMPTOM: JAW NECK BACK PAIN'
HASYMP2 = 'HRT ATTK SYMPTOM: LIGHTHEADED, FAINT'
HASYMP3 = 'HRT ATTK SYMPTOM: CHEST PAIN'
HASYMP4 = 'HRT ATTK SYMPTOM: LOSE VISION'
HASYMP5 = 'HRT ATTK SYMPTOM: ARM SHOULDER PAIN'
HASYMP6 = 'HRT ATTK SYMPTOM: SHORTNESS OF BREATH'
HAVARTH2 = 'TOLD HAVE ARTHRITIS BY DOCTOR'
HECHMHOM = '# DAYS CHEMICALS APPLIED IN HOME TO KILL PESTS IN PAST 12 MONTHS'
HECHMYRD = '# DAYS CHEMICALS APPLIED IN LAWN TO KILL PESTS IN PAST 12 MONTHS'
HEIGHT3 = 'REPORTED HEIGHT IN FEET AND INCHES'
HEWTRDRK = 'WHICH BEST DESCRIBES WATER YOU DRINK AT HOME'
HEWTRSRC = 'MAIN SOURCE OF HOME WATER'
HISPANC2 = 'HISPANIC ORIGIN'
HIVRISK2 = 'ANY HIGH RISK SITUATIONS APPLY'
HIVTST5 = 'EVER TESTED HIV'
HIVTSTD2 = 'MO/YR OF HIV TEST'
HLTHPLAN = 'HAVE HEALTH CARE COVERAGE'
HOUSESMK = 'SMOKING ALLOWED AT HOME'
HOWLONG = 'HOW LONG SINCE LAST MAMMOGRAM'
HTIN3 = 'REPORTED HEIGHT IN INCHES.'
HTM3 = 'REPORTED HEIGHT IN METERS.'
IAQCODTR = 'HAVE CO DETECTOR IN HOME'
IAQGASAP = 'HAVE NATRUAL GAS POWERED APPLIANCES'
IAQHTDYS = '# DAYS IN PAST 12 MONTHS  USED FUEL BURNING STOVE, FIREPLACE OR HEATER'
IAQHTSRC = 'HOME HEATED WITH FURNACE THAT BURNS FUEL'
IAQMOLD = 'HAVE MOLD GREATER THAN SIZE OF DOLLAR BILL'
IDATE = 'DATE OF INTERVIEW'
IDAY = 'DAY OF INTERVIEW'
IMONTH = 'MONTH OF INTERVIEW'
INCOME2 = 'INCOME LEVEL'
INDOORS = 'NORMALLY WORK INDOORS?'
INSULIN = 'NOW TAKING INSULIN'
INTVID = 'INTERVIEWER ID'
IPVPHHRT = 'SEX PARTNER EVER VIOLENT'
IPVPHYVL = 'SEX PARTNER EVER ATTEMPTED VIOLENCE'
IPVPVL12 = 'HAD UNWANTED SEX OR VIOLENCE FROM SEX PARTNER LAST 12 MOS'
IPVRELTN = 'RELATIONSHIP TO SEX PARTNER LAST VIOLENCE OR UNWANTED SEX'
IPVSXINJ = 'INJURIES FROM VIOLENCE OR UNWANTED SEX PAST 12 MOS'
IPVTHRAT = 'SEX PARTNER EVER THREATENED VIOLENCE'
IPVUWSEX = 'EVER HAD UNWANTED SEX W/ PARTNER'
IYEAR = 'YEAR OF INTERVIEW'
JOBACTIV = 'PHYSICAL ACTIVITY ON JOB'
JOINTRT2 = 'SEEN DOC FOR JOINT SYMPTOMS'
JOINTSYM = 'JOINT SYMPTOMS 1ST BEGAN 3 MOS AGO?'
LASTDEN3 = 'HOW LONG SINCE LAST DENTIST VISIT'
LASTPAP2 = 'HOW LONG SINCE LAST PAP TEST'
LASTSIG2 = 'LAST TIME HAD SIGMOIDOSCOPY/COLONOSCOPY'
LENGEXAM = 'HOW LONG SINCE LAST BREAST PHYSICAL EXAM'
LMTJOIN2 = 'LIMITED BECAUSE OF JOINT SYMPTOMS'
LOSEWT = 'TRYING TO LOSE WEIGHT'
LSATISFY = 'SATISFACTION W/ LIFE'
LSTBLDS2 = 'HOW LONG SINCE LAST HOME BLOOD STOOL TST'
MAINTAIN = 'TRYING TO MAINTAIN CURRENT WEIGHT'
MARITAL = 'MARITAL STATUS'
MAXDRNKS = 'MOST DRINKS ON SINGLE OCCASION PAST 30 DAYS'
MEDCOST = 'COULD NOT SEE DR. BECAUSE OF COST'
MENTHLTH = 'NUMBER OF DAYS MENTAL HEALTH NOT GOOD'
MODCAT_ = 'MODERATE PHYSICAL ACTIVITY CATEGORIES'
MODPACT = 'MODERATE PHYSICAL ACTIVITY'
MODPADAY = 'DAYS PER WEEK OF MOD. PHYS. ACT.'
MODPATIM = 'MINS. PER DAY OF MOD. PHYS. ACT.'
MRACE = 'ORIGINAL REPORTED RACE'
MRACEASC = 'REPORTED MRACE VARIABLE WITH TRAILING 7,8,9�S REMOVED, IN ASCENDING ORDER.'
MRACEORG = 'REPORTED MRACE VARIABLE WITH TRAILING 7,8,9�S REMOVED.'
MSCODE = 'METROPOLITAN STATUS CODE'
NATTMPTS = 'NUMBER OF ATTEMPTS'
NRECSEL = 'NUMBER OF SAMPLE RECORDS FOR STRATUM'
NRECSTR = 'TOTAL PH. NOS. IN STRATUM FROM SAMPLE'
NUMADULT = 'NUMBER OF ADULTS IN HOUSEHOLD'
NUMHHOL2 = 'MORE THAN ONE TELPHONE NUMBER IN HH'
NUMMEN = 'NUMBER OF ADULT MALES IN HOUSEHOLD'
NUMPHON2 = 'NUMBER OF RESIDENTIAL PHONE NUMBERS'
NUMWOMEN = 'NUMBER OF ADULT FEMALES IN HOUSEHOLD'
ORACE2 = 'PREFERRED RACE'
OSTPROS = 'HLTH PRO EVER SAID HAVE OSTEOPOROSIS'
PACAT_ = 'OVERALL PHYSICAL ACTIVITY CATEGORIES'
PAIN30DY = 'HAD JOINT PAIN, SWELLING LST 30 DAYS'
PAINACT2 = 'TIMES IN PAST MONTH PAIN INTERFERED'
PERSDOC2 = 'HAVE PERSONAL HEALTH CARE PROVIDER'
PHYACT = 'INCREASED PHYSICAL ACTIVITY'
PHYSHLTH = 'NUMBER OF DAYS PHYSICAL HEALTH NOT GOOD'
PNEUVAC3 = 'PNEUMONIA SHOT EVER'
POORHLTH = 'DAYS HEALTH IMPAIRED LAST MO'
POTADAY_ = 'POTATO SERVINGS PER DAY'
POTATOES = 'HOW OFTEN DO YOU EAT POTATOES'
PRECALL = 'PRECALLING STATUS'
PREGNANT = 'ARE YOU NOW PREGNANT'
PROFEXAM = 'EVER HAD BREAST PHYSICAL EXAM BY DOCTOR'
PROSTATE = 'EVER TOLD HAVE PROSTATE CANCER'
PSATEST = 'EVER HAD PSA'
PSATIME = 'TIME SINCE PSA'
PVTRESID = 'PRIVATE RESIDENCE?'
QLACTLM2 = 'ACTIVITIES LIMITED BY HEALTH PROBLEM'
QLHLTH2 = 'TIMES IN PAST MONTH FELT HEALTHY'
QLMENTL2 = 'TIMES IN PAST MONTH FELT DEPRESSED'
QLREST2 = 'TIMES IN PAST MONTH NOT ENOUGH REST'
QLSTRES2 = 'TIMES IN PAST MONTH BEEN STRESSED'
QSTLANG = 'QUESTIONNAIRE LANGUAGE'
QSTVER = 'QUESTIONNAIRE VERSION'
RACE2 = 'RACE/ETHNICITY CATEGORIES.'
RCHISLAT = 'ETHNICITY OF CHILD'
RCSBIRTH = 'BIRTH DATE OF CHILD'
RCSBRACE = 'RACE OF CHILD'
RCSGENDR = 'GENDER OF CHILD'
RCSRACE = 'RACE OF CHILD (MULTIPLE POSSIBLE)'
RCSRELTN = 'RELATIONSHIP TO CHILD'
REPDEPTH = 'REPLICATE DEPTH'
REPNUM = 'REPLICATE NUMBER'
RMVTEETH = 'NUMBER OF PERMANENT TEETH REMOVED'
RRATWORK = 'TREATED DIFF THAN OTH RACE AT WORK'
RRCLASS2 = 'OTHERS CLASSIFY YOUR RACE'
RRCOGNT2 = 'HOW OFTEN THINK ABOUR YOUR RACE'
RREMTSM1 = 'TIMES PAST 12 MOS FELT EMOTIONALLY UPSET BECAUSE OF TREATMENT DUE TO YOUR RACE'
RRHCARE2 = 'TREATED DIFF THAN OTH RACE HLTH CARE'
RRPHYSM1 = 'TIMES PAST 12 MOS FELT PHYSICAL SYMPTOMS BECAUSE OF TREATMENT DUE TO YOUR RACE'
SCDSCMED = '# VISITS DOCTOR DISCUSSED MEDICATION TO ASSIST QUITTING SMOKING'
SCDSCMTH = '# VISITS DOCTOR DISCUSSED METHODS TO QUIT SMOKING'
SCGETCAR = '# TIMES SAW A DOCTOR FOR CARE LAST 12 MONTHS'
SCLSTSMK = 'TIME SINCE LAST SMOKED REGULARLY'
SCQITSMK = '# VISITS ADVISED TO QUIT SMOKING LAST 12 MONTHS'
SEQNO = 'ANNUAL SEQUENCE NUMBER'
SEX = 'SEX'
SIPVSKP = 'OPTION TO SKIP QUESTION DUE TO PERSONAL SAFETY'
SMKPUBLC = 'SMOKING POLICY AT WORK FOR COMMON AREAS'
SMKWORK = 'SMOKING POLICY AT WORK FOR WORK AREAS'
SMOKDAY2 = 'FREQUENCY OF DAYS NOW SMOKING'
SMOKE100 = 'SMOKED AT LEAST 100 CIGARETTES'
STOPSMK2 = 'QUIT SMOKING A DAY OR MORE IN PAST YEAR'
STREHAB = 'OUTPATIENT REHAB AFTER HOSP STAY FOR STROKE'
STRSYMP1 = 'STROKE SYMPT: SUDDEN CONFUSION'
STRSYMP2 = 'STROKE SYMPT: NUMBNESS ON ONE SIDE BODY'
STRSYMP3 = 'STROKE SYMPT: SUDDEN VISION LOSS'
STRSYMP4 = 'STROKE SYMPT: SUDDEN CHEST PAIN'
STRSYMP5 = 'STROKE SYMPT: SUDDEN DIZZINESS'
STRSYMP6 = 'STROKE SYMPT: SEVERE UNXPLND HEADACHE'
SVEANOSX = 'SOMEONE EVER ATTEMPT TO HAVE SEX AGAINST WILL BUT DID NOT HAPPEN'
SVEHDSEX = 'SOMEONE EVER HAD SEX WITH YOU AGAINST YOUR WILL'
SVGENDER = 'PERSON�S GENDER WHO HAD SEX WITH YOU AGAINST YOUR WILL'
SVHADSEX = 'SOMEONE PAST 12 MOS HAD SEX WITH YOU AGAINST YOUR WILL'
SVNOSEX = 'SOMEONE PAST 12 MOS ATTEMPT TO HAVE SEX AGAINST WILL BUT DID NOT HAPPEN'
SVNOTCH = 'SOMEONE PAST 12 MOS PUT YOU IN UNWANTED SEX SITUATION W/O TOUCHING'
SVRELATN = 'RELATIONSHIP TO PERSON MOST RECENTLY ATTEMPTING OR HAVING UNWANTED SEX'
SVSEXTCH = 'UNWANTED TOUCHING OF SEXUAL PARTS OF BODY PAST 12 MOS'
TELSERV2 = 'LOST PHONE SERVICE ONE WEEK+ LAST 12 MOS'
TOLDHI2 = 'EVER TOLD BLOOD CHOLESTEROL HIGH'
USEEQUIP = 'REQ SPECIAL EQUIPMENT FOR HLTH PROBLEM'
VACARE = 'RECEIVED HEALTH CARE FROM VA FACILITY'
VEGEDAY_ = 'VEGETABLE SERVINGS PER DAY'
VEGETABL = 'SERVINGS OF VEGETABLES'
VETERAN = 'ARE YOU A VETERAN'
VETSTAT2 = 'CURRENT VETERAN STATUS'
VIATWORK = 'EYE INJURY AT WORKPLACE'
VICATRCT = 'HLTH CARE PRO SAID NOW HAVE CATARACTS'
VIDIFCLT = 'DIFFICULTY RECOGNIZING FRIEND ACROSS STREET'
VIEYEEXM = 'LAST EYE EXAM'
VIGCAT_ = 'VIGOROUS PHYSICAL ACTIVITY CATEGORIES'
VIGLUCMA = 'HLTH CARE PRO EVER SAID HAVE GLAUCOMA'
VIGPACT = 'VIGOROUS PHYSICAL ACTIVITY'
VIGPADAY = 'DAYS PER WEEK OF VIG. PHYS. ACT.'
VIGPATIM = 'MINS. PER DAY OF VIG. PHYS. ACT.'
VIINSUR = 'EYE CARE HEALTH INSURANCE?'
VIMACDEG = 'HLTH CARE PRO EVER SAID HAVE MACULAR DEGENERATION'
VIMISWRK = 'WORK DAYS MISSED DUE TO EYE INJURY'
VINOCARE = 'REASON DID NOT USE EYE DOC PAST 12 MOS'
VIPRFVST = 'LAST TIME VISITED EYE CARE PRO'
VIREADIF = 'DIFFICULTY READING TYPED TEXT'
VITELDIF = 'DIFFICULTY WATCHING TV'
WEIGHT2 = 'REPORTED WEIGHT IN POUNDS'
WHRTST7 = 'LOCATION OF LAST HIV TEST'
WTKG2 = 'REPORTED WEIGHT IN KILOGRAMS.'
_AGE65YR = 'TWO LEVEL AGE CATEGORY.'
_AGEG5YR = 'FOURTEEN LEVEL AGE CATEGORY.'
_AGEG_ = 'AGE GROUPS USED IN POST-STRATIFICATION'
_AGE_G = 'SIX LEVEL IMPUTED AGE CATEGORY'
_AIDTST2 = 'EVER BEEN TESTED FOR HIV RISK FACTOR.'
_ASTHMST = 'COMPUTED ASTHMA STATUS'
_BMI4 = 'BODY MASS INDEX.'
_BMI4CAT = 'BODY MASS INDEX- THREE LEVELS CATEGORY.'
_CASTHMA = 'RISK FACTOR FOR CURRENT ASTHMA PREVALENCE'
_CHLDCNT = 'NUMBER OF CHILDREN IN THE HOUSEHOLD'
_CHOLCHK = 'CHOLESTEROL CHECKED RISK FACTOR'
_CNRACE = 'NUMBER OF CENSUS RACE CATEGORIES CHOSEN.'
_CNRACEC = 'NUMBER OF CENSUS RACE CATEGORIES CHOSEN, COLLAPSED.'
_DENSTR2 = 'DENSITY STRATUM'
_DRDXART = 'RESPONDENTS DIAGNOSED WITH ARTHRITIS'
_DRNKDY3 = 'NUMBER OF ALCOHOL DRINKS PER DAY'
_DRNKMO3 = 'NUMBER OF ALCOHOL DRINKS PER MONTH'
_EDUCAG = 'LEVEL OF EDUCATION COMPLETED'
_FINALWT = 'PRODUCT OF _POSTSTR & _WT2'
_FLSHOT3 = 'RISK FACTOR FOR RESPONDENTS AGED 65+ THAT HAD A FLU SHOT IN THE PAST 12 MONTHS.'
_FRTINDX = 'FRUIT & VEGETABLE SERVINGS INDEX'
_FRTSERV = 'FRUIT & VEGETABLE SERVINGS PER DAY'
_FV5SRV = 'CONSUMED FIVE OR MORE SERVINGS OF FRUITS OR VEGETABLES PER DAY'
_GEOSTR = 'STRATUM CODE'
_HIGHRSK = 'EVER PARTICIPATED IN HIGH-RISK BEHAVIOR RISK FACTOR.'
_IMPAGE = 'IMPUTED AGE USED IN POST-STRATIFICATION'
_IMPNPH = 'IMPUTED NUMBER OF PHONES USED IN POST-STRATIFICATION'
_INCOMG = 'INCOME CATEGORIES'
_LTASTHM = 'RISK FACTOR FOR LIFETIME ASTHMA PREVALENCE'
_MODPAMN = 'MINUTES OF MODERATE PHYSICAL ACITIVITY'
_MRACE = 'MULTIRACIAL RACE CATEGORIZATION.'
_MSACODE = 'METROPOLITAN STATISTICAL AREA CODE'
_PNEUMO2 = 'RISK FACTOR FOR RESPONDENTS AGED 65+ THAT HAVE EVER HAD A PNEUMONIA SHOT.'
_POSTSTR = 'AGE, RACE, SEX WT ST POP'
_PRACE = 'PREFERRED RACE CATEGORY.'
_PSU = 'PRIMARY SAMPLING UNIT'
_RACEG2 = 'WHITE/HISPANIC RACE GROUP'
_RACEG3_ = 'RACE CATEGORIES USED IN POST-STRATIFICATION'
_RACEGR2 = '5 LEVEL RACE/ETHNICITY CATEGORY.'
_RACE_G = 'RACE GROUPS USED FOR INTERNET PREVALENCE TABLES'
_RAW = '# ADULTS/# PHONES'
_REGION = 'REGION'
_RFBING3 = 'BINGE DRINKING RISK FACTOR.'
_RFBMI4 = 'RISK FACTOR FOR OVERWEIGHT OR OBESE.'
_RFCHOL = 'HIGH CHOLESTEROL RISK FACTOR'
_RFDRHV3 = 'HEAVY DRINKING RISK'
_RFDRMN3 = 'HEAVY DRINKING AMONG MEN RISK FACTOR.'
_RFDRWM3 = 'HEAVY DRINKING AMONG FEMALES RISK FACTOR.'
_RFHLTH = 'HEALTH STATUS'
_RFHYPE5 = 'HIGH BLOOD PRESSURE RISK FACTOR'
_RFNOPA = 'NO PHYSICAL ACTIVITY OR EXERCISE RISK FACTOR'
_RFPAMOD = 'MODERATE PHYSICAL ACTIVITY RISK FACTOR'
_RFPAREC = 'RECOMMENDED PHYSICAL ACTIVITY RISK FACTOR'
_RFPAVIG = 'VIGOROUS PHYSICAL ACTIVITY RISK FACTOR'
_RFSMOK3 = 'CURRENT SMOKING STATUS RISK FACTOR.'
_SEXG_ = 'SEX CATEGORIES USED IN POST-STRAT'
_SMOKER3 = 'FOUR LEVEL SMOKER STATUS.'
_STATE = 'STATE FIPS CODE'
_STRWT = 'STRATUM WEIGHT'
_STSTR = 'CONCATENATED STRATIFICATION VARIABLES'
_TOTINDA = 'NO LEISURE TIME PHYSICAL ACTIVITY OR EXERCISE PAST 30 DAYS'
_VIGPAMN = 'MINUTES OF VIGOROUS PHYSICAL ACTIVITY'
_WT2 = 'DESIGN WEIGHT'
;
RUN;
