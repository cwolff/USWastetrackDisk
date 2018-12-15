*************************************************************************
*									*
* TRANVIEW >>> Add allows user to view transporters			*
*	       entry : None						*
*	       exit : None						*
*									*
* (C)opyright 1884 Personal Touch Software Inc.,  All Rights Reserved.	*
*									*
*************************************************************************

private CONTINUE
private SCROLL

HEAD = "Viewing Transporters"
L_TAIL = dtoc(date())
R_TAIL = "Press 0 to STOP"
do FRAME

select A
use TRANSPRT index TIDNBR

store .T. to CONTINUE
do while CONTINUE

   do GETNTID

   seek trim(T_TID)

   if .not. (eof() .or. bof())
      do READTRAN

      do CLRSCRN
      do PUTTRAN

      store .F. to TRAN_SEL
      store .T. to SCROLL
      do while SCROLL

         PMT_LINE = 19
         PMT_MSG = "1) Previous transporter  2) This transporter"
         PMT_MSG = PMT_MSG + "  3) Next transporter  4) Stop"
         do PROMPT

         CHOICE = 4
         do GETKEY

         @ 19,0

         do CASE

	    case CHOICE = 0 .or. CHOICE = 4
	       store .F. to SCROLL
	       store .F. to TRAN_SEL

	    case CHOICE = 1
	       skip -1

	       if bof()
	          STAT_LINE = 19
	          STAT_MSG = "This is the first transporter"
	          do STATUS

                  goto top

	       else
	          do READTRAN

                  do CLRSCRN
	          do PUTTRAN
	       endif

	    case CHOICE = 2
	       store .F. to SCROLL
	       store .T. to TRAN_SEL

	    case CHOICE = 3
	       skip 1

	       if eof()
	          STAT_LINE = 19
	          STAT_MSG = "This is the last transporter"
	          do STATUS

                  goto bottom

	       else
	          do READTRAN

                  do CLRSCRN
	          do PUTTRAN

	       endif

         endcase

      enddo

      if TRAN_SEL
         PMT_LINE = 19
         PMT_MSG = "1) Print transporter  2) Don't print"
         do PROMPT

         CHOICE = 2
         do GETKEY

         @ 19,0

         if CHOICE = 1
            PMT_LINE = 19
            PMT_MSG = "Printing transporter's information."
            do PROMPT

            set device to print
            eject
            do PRNT1TRN
            eject
            set device to screen

            @ 19,0

         endif

      endif

   else
     STAT_LINE = 19
     STAT_MSG = "SORRY : Transporter not found"
     do STATUS

   endif

   do CLRSCRN

   PMT_LINE = 19
   PMT_MSG = "1) View another transporter  2) Stop"
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