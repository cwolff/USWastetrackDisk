**********************************************************************
*                                                                    *
* TRANADD >>> Add new generators to the data base                    *
*             ENTRY : None                                           *
*             EXIT  : None                                           *
*                                                                    *
*    (C)opyright 1985 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

private CONTINUE

HEAD = "Adding Transporter(s)"
L_TAIL = dtoc(date())
R_TAIL = "Press 0 to Stop"
do FRAME

select A
use TRANSPRT index TIDNBR

store .T. to CONTINUE

do while CONTINUE

   do GETNTID

   seek T_TID

   if .not. (eof() .or. bof())
      STAT_LINE = 19
      STAT_MSG = "SORRY : Transporter already in data base"
      do STATUS

   else
      do GETNTRAN

      PMT_LINE = 19
      PMT_MSG = "1) Save this transporter  2) Throw it away"
      do PROMPT

      CHOICE = 2
      do GETKEY

      @ 19,0

      if CHOICE = 1
         append blank
         do WRITETRN

      endif

   endif

   do CLRSCRN

   PMT_LINE = 19
   PMT_MSG = "1) Add another transporter  2) Don't add another transporter"
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