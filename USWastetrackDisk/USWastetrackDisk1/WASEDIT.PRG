**********************************************************************
*                                                                    *
* WASEDIT >>> Edit TSD facilities to the data base                   *
*             ENTRY : None                                           *
*             EXIT  : None                                           *
*                                                                    *
*    (C)opyright 1985 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

private CONTINUE

HEAD = "Editing TSD Facilities"
L_TAIL = dtoc(date())
R_TAIL = "Press 0 to Stop"
do FRAME

select A
use WASTE index TSDNBR

store .T. to CONTINUE

do while CONTINUE

   do GETNTSD

   seek W_TSD

   if (eof() .or. bof())
      STAT_LINE = 19
      STAT_MSG = "SORRY : TSD facility not in data base"
      do STATUS

   else
      do GETEWAS

      PMT_LINE = 19
      PMT_MSG = "1) Save changes to TSD facility  2) Throw changes away"
      PMT_MSG = PMT_MSG + "  3) Remove TSD facility"
      do PROMPT

      CHOICE = 3
      do GETKEY

      @ 19,0

      do case

         case CHOICE = 1
            PMT_LINE = 19
            PMT_MSG = "Saving changes to TSD facility."
            do PROMPT

            do WRITEWAS

            @ 19,0

         case CHOICE = 3
            PMT_LINE = 19
            PMT_MSG = "1) Remove TSD facility from data base  2) Don't remove"
            do PROMPT

            CHOICE = 2
            do GETKEY

            @ 19,0

            do case

               case CHOICE = 1
                  PMT_LINE = 19
                  PMT_MSG = "Removing TSD facility from data base."
                  do PROMPT

                  delete record recno()
                  pack

                  @ 19,0

            endcase

      endcase
            
   endif

   do CLRSCRN

   PMT_LINE = 19
   PMT_MSG = "1) Edit another TSD facility  2) Don't edit another TSD facility"
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