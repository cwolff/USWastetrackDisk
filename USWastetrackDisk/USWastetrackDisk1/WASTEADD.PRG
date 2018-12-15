**********************************************************************
*                                                                    *
* WASTEADD >>> Add new generators to the data base                   *
*             ENTRY : None                                           *
*             EXIT  : None                                           *
*                                                                    *
*    (C)opyright 1985 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

private CONTINUE

HEAD = "Adding TSD Facilitie(s)"
L_TAIL = dtoc(date())
R_TAIL = "Press 0 to Stop"
do FRAME

select A
use WASTE index TSDNBR

store .T. to CONTINUE

do while CONTINUE

   do GETNTSD

   seek W_TSD

   if .not. (eof() .or. bof())
      STAT_LINE = 19
      STAT_MSG = "SORRY : TSD facility already in data base"
      do STATUS

   else
      do GETNWAS

      PMT_LINE = 19
      PMT_MSG = "1) Save this TSD facility  2) Throw it away"
      do PROMPT

      CHOICE = 2
      do GETKEY

      @ 19,0

      if CHOICE = 1
         append blank
         do WRITEWAS

      endif

   endif

   do CLRSCRN

   PMT_LINE = 19
   PMT_MSG = "1) Add another TSD facility  2) Don't add another TSD facility"
   do PROMPT

   CHOICE = 2
   do GETKEY

   @ 19,0

   if CHOICE = 0 .or. CHOICE = 2
      store .F. to CONTINUE

   endif

enddo

select A
use

return



