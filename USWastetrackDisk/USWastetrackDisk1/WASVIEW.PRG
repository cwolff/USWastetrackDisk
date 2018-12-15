*************************************************************************
*									*
* WASVIEW >>> Add allows user to view treatment storage and disposal    *
*             facilities                                                *
*	       entry : None						*
*	       exit : None						*
*									*
* (C)opyright 1884 Personal Touch Software Inc.,  All Rights Reserved.	*
*									*
*************************************************************************

private CONTINUE
private SCROLL

HEAD = "Viewing TSD Facilities"
L_TAIL = dtoc(date())
R_TAIL = "Press 0 to STOP"
do FRAME

select A
use WASTE index TSDNBR

store .T. to CONTINUE
do while CONTINUE

   do GETNTSD

   seek trim(W_TSD)

   if .not. (eof() .or. bof())
      do READWAST

      do CLRSCRN
      do PUTWASTE

      store .F. to WASTE_SEL
      store .T. to SCROLL
      do while SCROLL

         PMT_LINE = 19
         PMT_MSG = "1) Previous TSD facility  2) This TSD facility"
         PMT_MSG = PMT_MSG + "  3) Next TSD facility  4) Stop"
         do PROMPT

         CHOICE = 4
         do GETKEY

         @ 19,0

         do CASE

	    case CHOICE = 0 .or. CHOICE = 4
	       store .F. to SCROLL
	       store .F. to WASTE_SEL

	    case CHOICE = 1
	       skip -1

	       if bof()
	          STAT_LINE = 19
	          STAT_MSG = "This is the first TSD facility"
	          do STATUS

                  goto top

	       else
	          do READWAST

                  do CLRSCRN
	          do PUTWASTE
	       endif

	    case CHOICE = 2
	       store .F. to SCROLL
	       store .T. to WASTE_SEL

	    case CHOICE = 3
	       skip 1

	       if eof()
	          STAT_LINE = 19
	          STAT_MSG = "This is the last TSD facility"
	          do STATUS

                  goto bottom

	       else
	          do READWAST

                  do CLRSCRN
	          do PUTWASTE
	       endif

         endcase

      enddo

      if WASTE_SEL
         PMT_LINE = 19
         PMT_MSG = "1) Print TSD facility  2) Don't print"
         do PROMPT

         CHOICE = 2
         do GETKEY

         @ 19,0

         if CHOICE = 1
            PMT_LINE = 19
            PMT_MSG = "Printing TSD facility's information."
            do PROMPT

            set device to print
            eject
            do PRNT1WAS
            eject
            set device to screen

            @ 19,0

         endif

      endif

   else
     STAT_LINE = 19
     STAT_MSG = "SORRY : TSD facility not found"
     do STATUS

   endif

   do CLRSCRN

   PMT_LINE = 19
   PMT_MSG = "1) View another TSD facility  2) Stop"
   do PROMPT

   CHOICE = 2
   do GETKEY

   @ 19,0

   do case

      case CHOICE = 0 .or. CHOICE = 2
         store .F. to CONTINUE


      case CHOICE = 1
         store .T. to CONTINUE

   endcase

enddo

select A
use

return


