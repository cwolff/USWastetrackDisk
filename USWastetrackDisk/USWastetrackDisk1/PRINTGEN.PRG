**********************************************************************
*                                                                    *
* PRINTGEN  >>> Print generator                                      *
*             ENTRY : HEADER                                         *
*                     TOT:GEN number of records                      *
*             EXIT  : None                                           *
*                                                                    *
*    (C)opyright 1984 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

private SWITCH

set color to &FORE/&BACK
@ 10,15 say "Currently printing generator .....      0 of " + str(TOT_GEN,5)
set color to &FORE_OFF/&BACK

PAGE = 1
TOT_PAGE = int(TOT_GEN/8)
if 8 * TOT_PAGE <> TOT_GEN
   TOT_PAGE = TOT_PAGE + 1
endif

set device to print

eject
set color to &FORE/&BACK
@ 3,0 say HEADER
@ 3,65 say "Page " + str(PAGE,3) + " of " + str(TOT_PAGE,3)
set color to &FORE_OFF/&BACK

GEN_LINE = 7
RECORD = 0

do while .not. EOF()
   set DEVICE to screen
   RECORD = RECORD + 1
   set color to &FORE/&BACK
   @ 10,51 say str(RECORD,5)
   set color to &FORE_OFF/&BACK
   set DEVICE to print

   do READGEN

   set color to &FORE/&BACK
   @ GEN_LINE,3 say "GID ... " + G_GID
   @ GEN_LINE,27 say "Company .......... " + G_COMPNY
   @ GEN_LINE+1,27 say "Address .......... " + G_ADDR
   @ GEN_LINE+2,27 say "City State Zip ... " + trim(G_CITY) + ", " + ;
                       trim(G_STATE) + " " + trim(G_ZIP)
   @ GEN_LINE+3,27 say "Contact .......... " + G_CONTCT
   @ GEN_LINE+4,27 say "Phone ............ " + G_PHONE
   set color to &FORE_OFF/&BACK

   if GEN_LINE > 49
      PAGE = PAGE + 1

      if PAGE <= TOT_PAGE
         eject
         set color to &FORE/&BACK
         @ 3,0 say HEADER
         @ 3,65 say "Page " + str(PAGE,3) + " of " + str(TOT_PAGE,3)
         set color to &FORE_OFF/&BACK
         GEN_LINE = 7

      endif

   else
      GEN_LINE = GEN_LINE + 7

   endif

   skip

enddo

set device to screen

select A
use

return
