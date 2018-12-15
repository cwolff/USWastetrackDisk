**********************************************************************
*                                                                    *
* PRINTTID  >>> Print treatment storage and disposal                 *
*             ENTRY : HEADER                                         *
*                     TOT_TID number of records                      *
*             EXIT  : None                                           *
*                                                                    *
*    (C)opyright 1984 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

set color to &FORE/&BACK
@ 10,15 say "Currently printing transporter ...      0 of " + str(TOT_TID,5)
set color to &FORE_OFF/&BACK

PAGE = 1
TOT_PAGE = int(TOT_TID/8)
if 8 * TOT_PAGE <> TOT_TID
   TOT_PAGE = TOT_PAGE + 1
endif

set DEVICE to print

eject
@ 3,0 say HEADER
@ 3,65 say "Page " + str(PAGE,3) + " of " + str(TOT_PAGE,3)

TID_LINE = 7
RECORD = 0

do while .not. eof()
   set DEVICE to screen
   RECORD = RECORD + 1
   set color to &FORE/&BACK
   @ 10,51 say str(RECORD,5)
   set color to &FORE_OFF/&BACK
   set DEVICE to print

   do READTRAN

   @ TID_LINE,3 say "TID ... " + T_TID
   @ TID_LINE,27 say "Company .......... " + T_COMPNY
   @ TID_LINE+1,27 say "Address .......... " + T_ADDR
   @ TID_LINE+2,27 say "City State Zip ... " + trim(T_CITY) + ", " + ;
                       trim(T_STATE) + " " + trim(T_ZIP)
   @ TID_LINE+3,27 say "Contact .......... " + T_CONTCT
   @ TID_LINE+4,27 say "Phone ............ " + T_PHONE

   if TID_LINE > 49
      PAGE = PAGE + 1

      if PAGE <= TOT_PAGE
         eject
         @ 3,0 say HEADER
         @ 3,65 say "Page " + str(PAGE,3) + " of " + str(TOT_PAGE,3)
         TID_LINE = 7

      endif

   else
      TID_LINE = TID_LINE + 7

   endif

   skip

enddo

set DEVICE to screen

select A
use

return
