**********************************************************************
*                                                                    *
* GETGEN >>> Get generator                                           *
*             ENTRY : GID number                                     *
*             EXIT  : W:TSD                                          *
*                                                                    *
*    (C)opyright 1984 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

private T_HIT

select A
use GENERATE index GIDNBR

store .T. to T_HIT
do while T_HIT

   G_GID = "            "

   set color to &FORE/&BACK
   @ 10,15 say "Please enter the generator GID number."
   @ 12,15 say "gid number ... " get G_GID picture "XXXXXXXXXXXX"

   set confirm on

   read
   clear gets

   set confirm off

   @ 10,0
   @ 12,0

   set color to &FORE_OFF/&BACK

   G_GID = UPPER(G_GID)

   seek G_GID

   if .NOT. (eof() .OR. bof())
      do READGEN

      do PUTGEN

      PMT_LINE = 19
      PMT_MSG = "1) This is the correct GID  "
      PMT_MSG = PMT_MSG + "2) Wrong GID"
      do PROMPT

      CHOICE = 2
      do GETKEY

      set color to &FORE/&BACK
      @ 19,0
      set color to &FORE_OFF/&BACK

      if CHOICE = 1
         G_GID = G_G_GID
         store .F. to T_HIT

      endif

   else
      STAT_LINE = 19
      STAT_MSG = "No GID found for GID number"
      do STATUS

   endif

   do CLRSCRN

enddo

return
