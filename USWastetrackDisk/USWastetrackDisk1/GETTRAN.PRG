**********************************************************************
*                                                                    *
* GETTRAN >>> Get primary and secondary carries                      *
*             ENTRY : GID number                                     *
*             EXIT  : T:TID:1 T:TID:2                                *
*                                                                    *
*    (C)opyright 1984 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

private T_HIT

select A
use GLOBAL

select A
use

select A
use TRANSPRT index TIDNBR

store .T. to T_HIT
do while T_HIT

   T_TID = "            "

   set color to &FORE/&BACK
   @ 10,15 say "Please enter the primary carrier tid number."
   @ 12,15 say "tid number ... " get T_TID picture "XXXXXXXXXXXX"

   set confirm on

   read

   clear gets

   set confirm off

   T_TID = upper(T_TID)

   @ 10,0
   @ 12,0

   set color to &FORE_OFF/&BACK

   seek T_TID

   if .NOT. (EOF() .OR. BOF())
      do READTRAN

      do PUTTRAN

      PMT_LINE = 19
      PMT_MSG = "1) This is the correct transporter  "
      PMT_MSG = PMT_MSG + "2) Wrong transporter"
      do PROMPT

      CHOICE = 2
      do GETKEY

      set color to &FORE/&BACK
      @ 19,0
      set color to &FORE_OFF/&BACK

      if CHOICE = 1
         T_TID_1 = T_TID
         store .F. to T_HIT

      endif

   else
      STAT_LINE = 19
      STAT_MSG = "No transporter found for tid number"
      do STATUS

   endif

   do CLRSCRN

enddo

store .T. to T_HIT
do while T_HIT

   T_TID = "            "

   set color to &FORE/&BACK
   @ 10,15 say "Please enter the secondary carrier tid number"
   @ 12,15 say "tid number  (press ды if none)  ... ";
                get T_TID picture "XXXXXXXXXXXX"

   set confirm on

   read
   clear gets

   set confirm off

   T_TID = upper(T_TID)

   @ 10,0
   @ 12,0

   set color to &FORE_OFF/&BACK

   if T_TID <> "            "

      seek T_TID

      if .NOT. (EOF() .OR. BOF())
         do READTRAN

         do PUTTRAN

         PMT_LINE = 19
         PMT_MSG = "1) This is the correct transporter  "
         PMT_MSG = PMT_MSG + "2) Wrong transporter"
         do PROMPT

         CHOICE = 2
         do GETKEY

         set color to &FORE/&BACK
         @ 19,0
         set color to &FORE_OFF/&BACK

         if CHOICE = 1
            T_TID_2 = T_TID
            store .F. to T_HIT

         endif

      else
         STAT_LINE = 19
         STAT_MSG = "No transporter found for tid number"
         do STATUS

      endif

      do CLRSCRN

   else
      store .F. to T_HIT
      T_TID_2 = "            "

   endif

enddo

return

