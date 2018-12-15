*************************************************************************
*                                                                       *
* TRACK >>> Manifest generator demonstrastion program for               *
*           written for U.S.-Wastetrac                                  *
*                                                                       *
*            entry : None                                               *
*            exit : None                                                *
*                                                                       *
* (C)opyright 1884 Personal Touch Software Inc.,  All Rights Reserved.  *
*                                                                       *
*************************************************************************

clear all

set device to screen

public fore,back,stat_fore,stat_back,pick_fore,pick_back

FORE = "W"
BACK = " "

FORE_OFF = " "

STAT_FORE = "W+"
STAT_BACK = " "

PICK_FORE = "W*"
PICK_BACK = " "

set color to &FORE/&BACK

clear

@ 2,1 say   "旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커"
@ 3,1 say   "넬컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴엿"
@ 4,1 say   "납"
@ 4,77 say  "납"
@ 5,1 say   "납"
@ 5,77 say  "납"
@ 6,1 say   "납"
@ 6,77 say  "납"
@ 7,1 say   "납"
@ 7,77 say  "납"
@ 8,1 say   "납"
@ 8,77 say  "납"
@ 9,1 say   "납"
@ 9,77 say  "납"
@ 10,1 say  "납"
@ 10,77 say "납"
@ 11,1 say  "납"
@ 11,77 say "납"
@ 12,1 say  "납"
@ 12,77 say "납"
@ 13,1 say  "납"
@ 13,77 say "납"
@ 14,1 say  "납"
@ 14,77 say "납"
@ 15,1 say  "납"
@ 15,77 say "납"
@ 16,1 say  "납"
@ 16,77 say "납"
@ 17,1 say  "납"
@ 17,77 say "납"
@ 18,1 say  "납"
@ 18,77 say "납"
@ 19,1 say  "납"
@ 19,77 say "납"
@ 20,1 say  "납"
@ 20,77 say "납"
@ 21,1 say  "냅컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴冒"
@ 22,1 say  "읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸"

set color to &FORE/&BACK
@ 5,8 say  "                         Welcome to"
set color to &STAT_FORE/&STAT_BACK
@ 7,8 say  "U. S. - W a s t e t r a c   M a n i f e s t   M a n a g e m e n t"
set color to &FORE/&BACK
@ 10,8 say "                    UTILITY SERVICES, INC."
@ 11,8 say "                      3802 Danube Drive"
@ 12,8 say "                    Groveport, Ohio 43125"
@ 13,8 say "                       (614) 837-8827"

@ 17,8 say "(C)opyright 1985, Personal Touch Software, All Rights Reserved."
@ 19,8 say "              Licensed to Utility Services, Inc."

set color to &FORE_OFF/&BACK

set delimiters to "[]"
set procedure to UTILITY

public G_GID,G_COMPNY,G_ADDR,G_CITY,G_STATE,G_ZIP,G_PHONE,G_CONTCT,G_MAN_NO
public T_TID,T_COMPNY,T_ADDR,T_CITY,T_STATE,T_ZIP,T_PHONE,T_CONTCT
public T1_TID,T1_COMPNY,T1_ADDR,T1_CITY,T1_STATE,T1_ZIP,T1_PHONE,T1_CONTCT
public T2_TID,T2_COMPNY,T2_ADDR,T2_CITY,T2_STATE,T2_ZIP,T2_PHONE,T2_CONTCT
public T_TID_1,T_TID_2
public W_TSD,W_COMPNY,W_ADDR,W_CITY,W_STATE,W_ZIP,W_PHONE,W_CONTCT
public ITEM,DESC_1,DESC_2,T_HIT,CONTAINER,UNIT,M_UN_NA,M_CNTNO,M_CNTTY
public M_QNTTY,M_UNIT,M_MID
public M_UN_NA1,M_CNTNO1,M_CNTTY1,M_UNIT1,M_QNTY1
public M_UN_NA2,M_CNTNO2,M_CNTTY2,M_UNIT2,M_QNTY2
public M_UN_NA3,M_CNTNO3,M_CNTTY3,M_UNIT3,M_QNTY3
public M_UN_NA4,M_CNTNO4,M_CNTTY4,M_UNIT4,M_QNTY4
public M_UN_NA5,M_CNTNO5,M_CNTTY5,M_UNIT5,M_QNTY5
public M_UN_NA6,M_CNTNO6,M_CNTTY6,M_UNIT6,M_QNTY6
public M_DESC_1_1,M_DESC_2_1,M_DESC_1_2,M_DESC_2_2,M_DESC_1_3,M_DESC_2_3
public M_DESC_1_4,M_DESC_2_4

private CONTINUE
private REFRESH

select A
use GLOBAL
replace G_LOGON with " "
replace G_PSSWRD with " "
replace G_PRMSSN with " "
replace G_PWDATE with " "
use

do PASSWORD

select A
use GLOBAL
OLD = G_PWDATE
use
OLD = (366*val(SUBSTR(OLD,7,2)))+(32*val(SUBSTR(OLD,1,2)))+val(SUBSTR(OLD,4,2))
TODAY = dtoc(date())
TODAY = (366*val(SUBSTR(TODAY,7,2)))+(32*val(SUBSTR(TODAY,1,2)))+val(SUBSTR(TODAY,4,2))
if OLD < (TODAY - 60)
   STAT_LINE = 19
   STAT_MSG = "Your password has expired"
   do STATUS
   do CHNGPASS
endif

store .T. to REFRESH
store .T. to CONTINUE

do while CONTINUE

   if REFRESH
      HEAD = "First Choice Menu"
      L_TAIL = DTOC(date())
      R_TAIL = "Press 0 to STOP"
      do FRAME

      MENU_CNT = 5
      MENU_1 = "Manifest Management"
      MENU_2 = "Vendor Management"
      MENU_3 = "System Management"
      MENU_4 = "Change Your Password"
      MENU_5 = "Logoff/Logon"
      do MENU
   endif

   CHOICE = 5
   do GETMKEY

   do case

      case CHOICE = 0
         store .F. to CONTINUE

      case CHOICE = 1
         do MANIMANG
         store .T. to REFRESH
         store .T. to CONTINUE

      case CHOICE = 2
         do VENDMANG
         store .T. to REFRESH
         store .T. to CONTINUE

       case CHOICE = 3
	 do SYSMANG
	 store .T. to REFRESH
         store .T. to CONTINUE

      case CHOICE = 4
         do CHNGPASS
         store .T. to REFRESH
         store .T. to CONTINUE

      case CHOICE = 5
         do PASSWORD
         store .T. to REFRESH
         store .T. to CONTINUE

   endcase

enddo

set color to &FORE/&BACK

clear

@ 2,1 say   "旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커"
@ 3,1 say   "넬컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴엿"
@ 4,1 say   "납"
@ 4,77 say  "납"
@ 5,1 say   "납"
@ 5,77 say  "납"
@ 6,1 say   "납"
@ 6,77 say  "납"
@ 7,1 say   "납"
@ 7,77 say  "납"
@ 8,1 say   "납"
@ 8,77 say  "납"
@ 9,1 say   "납"
@ 9,77 say  "납"
@ 10,1 say  "납"
@ 10,77 say "납"
@ 11,1 say  "납"
@ 11,77 say "납"
@ 12,1 say  "납"
@ 12,77 say "납"
@ 13,1 say  "납"
@ 13,77 say "납"
@ 14,1 say  "납"
@ 14,77 say "납"
@ 15,1 say  "납"
@ 15,77 say "납"
@ 16,1 say  "납"
@ 16,77 say "납"
@ 17,1 say  "납"
@ 17,77 say "납"
@ 18,1 say  "납"
@ 18,77 say "납"
@ 19,1 say  "납"
@ 19,77 say "납"
@ 20,1 say  "납"
@ 20,77 say "납"
@ 21,1 say  "냅컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴冒"
@ 22,1 say  "읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸"

set color to &FORE/&BACK
@ 5,8 say  "                     Thank you for using"
set color to &STAT_FORE/&BACK
@ 7,8 say  "U. S. - W a s t e t r a c   M a n i f e s t   M a n a g e m e n t"
set color to &FORE/&BACK
@ 10,8 say "                    UTILITY SERVICES, INC."
@ 11,8 say "                      3802 Danube Drive"
@ 12,8 say "                    Groveport, Ohio 43125"
@ 13,8 say "                       (614) 837-8827"

@ 17,8 say "(C)opyright 1985, Personal Touch Software, All Rights Reserved."
@ 19,8 say "              Licensed to Utility Services, Inc."

@ 23,1 say " "

return
