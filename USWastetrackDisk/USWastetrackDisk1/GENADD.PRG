**********************************************************************
*                                                                    *
* GENADD >>> Add new generators to the data base                     *
*             ENTRY : None                                           *
*             EXIT  : None                                           *
*                                                                    *
*    (C)opyright 1985 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

private CONTINUE

HEAD = "Adding Generators(s)"
L_TAIL = dtoc(date())
R_TAIL = "Press 0 to Stop"
do FRAME

select A
use GENERATE index GIDNBR

store .T. to CONTINUE

do while CONTINUE

   do GETNGID

   seek G_GID

   if .not. (eof() .or. bof())
      STAT_LINE = 19
      STAT_MSG = "SORRY : Generator already in data base"
      do STATUS

   else
      do GETNGEN

      PMT_LINE = 19
      PMT_MSG = "1) Save this generator  2) Throw it away"
      do PROMPT

      CHOICE = 2
      do GETKEY

      @ 19,0

      if CHOICE = 1
         append blank
         do WRITEGEN

      endif

   endif

   do CLRSCRN

   PMT_LINE = 19
   PMT_MSG = "1) Add another generator  2) Don't add another generator"
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