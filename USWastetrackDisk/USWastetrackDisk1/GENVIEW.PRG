*************************************************************************
*									*
* GENVIEW >>> Add allows user to view generators			*
*	       entry : None						*
*	       exit : None						*
*									*
* (C)opyright 1884 Personal Touch Software Inc.,  All Rights Reserved.	*
*									*
*************************************************************************

private CONTINUE
private SCROLL

HEAD = "Viewing Generators"
L_TAIL = dtoc(date())
R_TAIL = "Press 0 to STOP"
do FRAME

select A
use GENERATE index GIDNBR

store .T. to CONTINUE
do while CONTINUE

   do GETNGID

   seek trim(G_GID)

   if .not. (eof() .or. bof())
      do READGEN

      do CLRSCRN
      do PUTGEN

      store .F. to GEN_SEL
      store .T. to SCROLL
      do while SCROLL

         PMT_LINE = 19
         PMT_MSG = "1) Previous generator  2) This generator"
         PMT_MSG = PMT_MSG + "  3) Next generator  4) Stop"
         do PROMPT

         CHOICE = 4
         do GETKEY

         @ 19,0

         do CASE

	    case CHOICE = 0 .or. CHOICE = 4
	       store .F. to SCROLL
	       store .F. to GEN_SEL

	    case CHOICE = 1
	       skip -1

	       if bof()
	          STAT_LINE = 19
	          STAT_MSG = "This is the first generator"
	          do STATUS

                  goto top

	       else
	          do READGEN

                  do CLRSCRN
	          do PUTGEN
	       endif

	    case CHOICE = 2
	       store .F. to SCROLL
	       store .T. to GEN_SEL

	    case CHOICE = 3
	       skip 1

	       if eof()
	          STAT_LINE = 19
	          STAT_MSG = "This is the last generator"
	          do STATUS

                  goto bottom

	       else
	          do READGEN

                  do CLRSCRN
	          do PUTGEN
	       endif

         endcase

      enddo

      if GEN_SEL
         PMT_LINE = 19
         PMT_MSG = "1) Print generator  2) Don't print"
         do PROMPT

         CHOICE = 2
         do GETKEY

         @ 19,0

         if CHOICE = 1
            PMT_LINE = 19
            PMT_MSG = "Printing generators's information."
            do PROMPT

            set device to print
            eject
            do PRNT1GEN
            eject
            set device to screen

            @ 19,0

         endif

      endif

   else
     STAT_LINE = 19
     STAT_MSG = "SORRY : Generator not found"
     do STATUS

   endif

   do CLRSCRN

   PMT_LINE = 19
   PMT_MSG = "1) View another generator  2) Stop"
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