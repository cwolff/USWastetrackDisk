**********************************************************************
*                                                                    *
* GETWASTE >>> Get treatment storage and disposal                    *
*             ENTRY : GID number                                     *
*             EXIT  : W:TSD                                          *
*                                                                    *
*    (C)opyright 1984 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

private T_HIT

select A
use WASTE index TSDNBR

store .T. to T_HIT
do while T_HIT

   W_TSD = "            "

   do while W_TSD = "            "
      set color to &FORE/&BACK
      @ 10,15 say "Please enter the treatment storage & disposal tsd number."
      @ 12,15 say "tsd number ... " get W_TSD picture "XXXXXXXXXXXX"

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

   W_TSD = upper(W_TSD)

   seek W_TSD

   if .NOT. (eof() .OR. bof())
      do READWAST

      do PUTWASTE

      PMT_LINE = 19
      PMT_MSG = "1) This is the correct TSD  "
      PMT_MSG = PMT_MSG + "2) Wrong TSD"
      do PROMPT

      CHOICE = 2
      do GETKEY

      set color to &FORE/&BACK
      @ 19,0
      set color to &FORE_OFF/&BACK

      if CHOICE = 1
         W_TSD = W_W_TSD
         store .F. to T_HIT

      endif

   else
      STAT_LINE = 19
      STAT_MSG = "No TSD found for TSD I.D. number"
      do STATUS

   endif

   do CLRSCRN

enddo

return
