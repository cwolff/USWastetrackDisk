*************************************************************************
*                                                                       *
* LISTGID >>> List generators                                           *
*                                                                       *
*            entry : None                                               *
*            exit : None                                                *
*                                                                       *
* (C)opyright 1884 Personal Touch Software Inc.,  All Rights Reserved.  *
*                                                                       *
*************************************************************************

private CONTINUE
private REFRESH

store .F. to REFRESH
store .T. to CONTINUE

HEAD = "List Generators"
L_TAIL = DTOC(date())
R_TAIL = "Press 0 to STOP"
do FRAME

MENU_CNT = 3
MENU_1 = "List Generators by GID."
MENU_2 = "List Generators by Company."
MENU_3 = "List Generator by Zip."
do MENU

do while CONTINUE

   if REFRESH
      HEAD = "List Generators"
      L_TAIL = DTOC(date())
      R_TAIL = "Press 0 to STOP"
      do FRAME

      MENU_CNT = 3
      MENU_1 = "List Generators by GID."
      MENU_2  = "List Generators by Company."
      MENU_3 = "List Generator by Zip."
      do MENU
   endif

   CHOICE = 3
   do GETMKEY

   do case

      case CHOICE = 0
         store .F. to CONTINUE

     case CHOICE = 1
         do CLRSCRN

         select A
         use GENERATE

         goto bottom
         TOT_GEN = RECNO()

         set index to GIDNBR
         goto top

         do TITLEPG

         HEADER = "<<< List of Generators by GID " + DTOC(date()) + " <<<"
         do PRINTGEN

         select A
         use

         store .T. to CONTINUE
         store .T. to REFRESH

      case CHOICE = 2
         do CLRSCRN

         PMT_LINE = 10
         PMT_MSG = "One moment please indexing on company name."
         do PROMPT

         select A
         use GENERATE

         goto bottom
         TOT_GEN = RECNO()

         index on G_G_COMPNY to data\GIDCMPNY

         set index to GIDCMPNY

         set color to &FORE/&BACK
         @ 10,15
         set color to &FORE_OFF/&BACK

         do TITLEPG

         HEADER = "<<< List of Generators by Company " + DTOC(date()) + " <<<"
         do PRINTGEN

         select A
         use

         store .T. to CONTINUE
         store .T. to REFRESH

      case CHOICE = 3
         do CLRSCRN

         PMT_LINE = 10
         PMT_MSG = "One moment please indexing on zip code."
         do PROMPT

         select A
         use GENERATE

         goto bottom
         TOT_GEN = RECNO()

         index on G_G_ZIP to data\GIDZIP

         set index to GIDZIP

         set color to &FORE/&BACK
         @ 10,15
         set color to &FORE_OFF/&BACK

         do TITLEPG

         HEADER = "<<< List of Generators by Zip " + DTOC(date()) + " <<<"
         do PRINTGEN

         select A
         use

         store .T. to CONTINUE
         store .T. to REFRESH

   endcase

enddo

return
