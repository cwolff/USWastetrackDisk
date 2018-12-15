**********************************************************************
*                                                                    *
* GENEDIT >>> Edit generators to the data base                       *
*             ENTRY : None                                           *
*             EXIT  : None                                           *
*                                                                    *
*    (C)opyright 1985 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

private CONTINUE

HEAD = "Editing Generators"
L_TAIL = dtoc(date())
R_TAIL = "Press 0 to Stop"
do FRAME

select A
use GENERATE index GIDNBR

store .T. to CONTINUE

do while CONTINUE

   do GETNGID

   seek G_GID

   if (eof() .or. bof())
      STAT_LINE = 19
      STAT_MSG = "SORRY : Generator not in data base"
      do STATUS

   else
      do GETEGEN

      PMT_LINE = 19
      PMT_MSG = "1) Save changes to generator  2) Throw changes away"
      PMT_MSG = PMT_MSG + "  3) Remove generator"
      do PROMPT

      CHOICE = 3
      do GETKEY

      @ 19,0

      do case

         case CHOICE = 1
            PMT_LINE = 19
            PMT_MSG = "Saving changes to generator."
            do PROMPT

            do WRITEGEN

            @ 19,0

         case CHOICE = 3
            PMT_LINE = 19
            PMT_MSG = "1) Remove generator from data base  2) Don't remove"
            do PROMPT

            CHOICE = 2
            do GETKEY

            @ 19,0

            do case

               case CHOICE = 1
                  PMT_LINE = 19
                  PMT_MSG = "Removing generator from data base."
                  do PROMPT

                  delete record recno()
                  pack

                  @ 19,0

            endcase

      endcase
            
   endif

   do CLRSCRN

   PMT_LINE = 19
   PMT_MSG = "1) Edit another generator  2) Don't edit another generator"
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