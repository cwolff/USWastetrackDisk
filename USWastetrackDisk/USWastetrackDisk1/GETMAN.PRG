**********************************************************************
*                                                                    *
* GETMAN >>> Get manifest document no.                               *
*             ENTRY : GID                                            *
*             EXIT  : M:MID                                          *
*                                                                    *
*    (C)opyright 1984 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

MAN_NO = "            -     "

do while MAN_NO = "            -    "
   set color to &FORE/&BACK
   @ 10,15 say "Please enter the manifest document number."
   @ 12,15 say "document number ... " get MAN_NO picture "XXXXXXXXXXXX-XXXXX"

   set confirm on

   read
   clear gets

   set confirm off

   set color to &FORE_OFF/&BACK

enddo

set color to &FORE/&BACK
@ 10,0
@ 12,0
set color to &FORE_OFF/&BACK

M_MID = UPPER(SUBSTR(MAN_NO,1,12)) + UPPER(SUBSTR(MAN_NO,14,5))

release MAN_NO

return
