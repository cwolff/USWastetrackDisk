**********************************************************************
*                                                                    *
* PRINTTSD  >>> Print treatment storage and disposal                 *
*             ENTRY : HEADER                                         *
*                     TOT_TSD number of records                      *
*             EXIT  : None                                           *
*                                                                    *
*    (C)opyright 1984 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

set color to &FORE/&BACK
@ 10,15 say "Currently printing TSD ...........      0 of " + str(TOT_TSD,5)
set color to &FORE_OFF/&BACK

PAGE = 1
TOT_PAGE = int(TOT_TSD/8)
if 8 * TOT_PAGE <> TOT_TSD
   TOT_PAGE = TOT_PAGE + 1
endif

*!! 'set eject off' is no longer valid.
*!! set eject off
set DEVICE to print

eject
@ 3,0 say HEADER
@ 3,65 say "Page " + str(PAGE,3) + " of " + str(TOT_PAGE,3)

TSD_LINE = 7
RECORD = 0

do while .not. eof()
   set DEVICE to screen
   RECORD = RECORD + 1
   set color to &FORE/&BACK
   @ 10,51 say str(RECORD,5)
   set color to &FORE_OFF/&BACK
   set DEVICE to print

   do READWAST

   @ TSD_LINE,3 say "TSD ... " + W_TSD
   @ TSD_LINE,27 say "Company .......... " + W_COMPNY
   @ TSD_LINE+1,27 say "Address .......... " + W_ADDR
   @ TSD_LINE+2,27 say "City State Zip ... " + trim(W_CITY) + ", " + ;
                       trim(W_STATE) + " " + trim(W_ZIP)
   @ TSD_LINE+3,27 say "Contact .......... " + W_CONTCT
   @ TSD_LINE+4,27 say "Phone ............ " + W_PHONE

   if TSD_LINE > 49
      PAGE = PAGE + 1

      if PAGE <= TOT_PAGE
         eject
         @ 3,0 say HEADER
         @ 3,65 say "Page " + str(PAGE,3) + " of " + str(TOT_PAGE,3)
         TSD_LINE = 7

      endif

   else
      TSD_LINE = TSD_LINE + 7

   endif

   skip

enddo

set DEVICE to screen

select A
use

return
