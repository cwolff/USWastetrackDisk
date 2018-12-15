*************************************************************************
*                                                                       *
* UTILTIY >>> Contains dbase III procedures                             *
*                                                                       *
* CLRSCRN, FRAME, GETKEY, GETPASS, MENU, PROMPT, STATUS, TAIL, YESNO    *
*                                                                       *
* (C)opyright 1985, Personal Touch Software Inc.,  All Rights Reserved. *
*                                                                       *
*************************************************************************

*************************************************************************
*                                                              		*
* CLRSCRN >>> Erase the menu window (line 4 through line 20)		*
*	      entry : None					        *
*	      exit : None				                *
*								        *
*************************************************************************

procedure CLRSCRN

   set color to &FORE/&BACK

   @ 4,0
   @ 5,0
   @ 6,0
   @ 7,0
   @ 8,0
   @ 9,0
   @ 10,0
   @ 11,0
   @ 12,0
   @ 13,0
   @ 14,0
   @ 15,0
   @ 16,0
   @ 17,0
   @ 18,0
   @ 19,0
   @ 20,0

   set color to &FORE_OFF/&BACK

return

*************************************************************************
*  									*
* FRAME >>> Erase the screen and frame with a header and trailer       	*
*	    entry : HEAD, L:TAIL, R:TAIL                                *
*	    exit : None 		                                *
*					                                *
* (C)opyright 1984, Personal Touch Software Inc.,  All Rights Reserved. *
*					                                *
*************************************************************************

procedure FRAME

   T1_LINE = " ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ"
   T1_LINE = T1_LINE + "ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ"

   T2_LINE = " ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ"
   T2_LINE = T2_LINE + "ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู"

   BLANK = "                                              "
   HEAD_LINE  = " ณ <> U. S. - W a s t e t r a c  "
   HEAD_LINE = HEAD_LINE + substr(BLANK,1,(46 - len(HEAD)) / 2) + HEAD
   HEAD_LINE = HEAD_LINE + substr(BLANK,1,78 - len(HEAD_LINE)) + "ณ"

   LINE = "ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ"

   B_LINE = " ี[ " + L_TAIL + " ]"
   B_LINE = B_LINE + substr(LINE,1,80 - ((len(B_LINE) + len(R_TAIL) + 6)))
   B_LINE = B_LINE + "[ " + R_TAIL + " ]ธ"

   TAIL_LINE = "                                      "
   TAIL_LINE = " ณ" + TAIL_LINE + TAIL_LINE + "ณ"

   CPYRGHT = " ภฤฤ Utility Services, Inc.  Manifesting-Tr"
   CPYRGHT = CPYRGHT + "acking-Reporting  (614) 837-8827 ฤฤู"

   set color to &FORE/&BACK

   clear

   @ 1,0 say T1_LINE
   @ 2,0 say HEAD_LINE
   @ 3,0 say T2_LINE

   @ 21,0 say B_LINE
   @ 22,0 say TAIL_LINE
   @ 23,0 say CPYRGHT

   set color to &FORE_OFF/&BACK

return

*************************************************************************
*                                                                       *
* GETKEY >>> Gets a key for status                                      *
*             entry : CHOICE                                            *
*             exit : CHOICE                                             *
*                                                                       *
*************************************************************************

procedure GETKEY

   KEY = CHOICE + 1

   do while KEY < 0 .or. KEY > CHOICE
      @ 2,75 get KEY picture "9"
      @ 2,76 say " "
      read
      clear gets
      @ 2,75 say "   "
   enddo

   CHOICE = KEY

return


*************************************************************************
*                                                                       *
* GETMKEY >>> Gets a key for menus from 0 to CHOICE                     *
*             entry : CHOICE                                            *
*             exit : CHOICE                                             *
*                                                                       *
*************************************************************************

procedure GETMKEY

   KEY = CHOICE + 1

   do while KEY < 0 .or. KEY > CHOICE
      @ 2,75 get KEY picture "9"
      @ 2,76 say " "
      read
      clear gets
      @ 2,75 say "   "
   enddo

   do case

      case KEY = 0
         set color to &pick_fore/&pick_back
         @ 21,61 say "Press 0 to STOP"
         set color to &FORE_OFF/&BACK

      case KEY = 1
         set color to &pick_fore/&pick_back
         @ 9,15 say "1)"
         set color to &FORE_OFF/&BACK

      case KEY = 2
         set color to &pick_fore/&pick_back
         @ 11,15 say "2)"
         set color to &FORE_OFF/&BACK

      case KEY = 3
         set color to &pick_fore/&pick_back
         @ 13,15 say "3)"
         set color to &FORE_OFF/&BACK

      case KEY = 4
         set color to &pick_fore/&pick_back
         @ 15,15 say "4)"
         set color to &FORE_OFF/&BACK

      case KEY = 5
         set color to &pick_fore/&pick_back
         @ 17,15 say "5)"
         set color to &FORE_OFF/&BACK

   endcase

   CHOICE = KEY

return

*************************************************************************
*                                                              		*
* MENU >>> Display the menu window			                *
*	   entry : MENU_CNT, MENU_1, ... , MENU_5	                *
*	   exit : None						        *
*							                *
*************************************************************************

procedure MENU

   do case

      case MENU_CNT = 1
         set color to &FORE/&BACK
         @ 9,15 say "1)   " + MENU_1
         set color to &FORE_OFF/&BACK

      case MENU_CNT = 2
         set color to &FORE/&BACK
         @ 9,15 say "1)   " + MENU_1
         @ 11,15 say "2)   " + MENU_2
         set color to &FORE_OFF/&BACK

      case MENU_CNT = 3
         set color to &FORE/&BACK
         @ 9,15 say "1)   " + MENU_1
         @ 11,15 say "2)   " + MENU_2
         @ 13,15 say "3)   " + MENU_3
         set color to &FORE_OFF/&BACK

      case MENU_CNT = 4
         set color to &FORE/&BACK
         @ 9,15 say "1)   " + MENU_1
         @ 11,15 say "2)   " + MENU_2
         @ 13,15 say "3)   " + MENU_3
         @ 15,15 say "4)   " + MENU_4
         set color to &FORE_OFF/&BACK

      case MENU_CNT = 5
         set color to &FORE/&BACK
         @ 9,15 say "1)   " + MENU_1
         @ 11,15 say "2)   " + MENU_2
         @ 13,15 say "3)   " + MENU_3
         @ 15,15 say "4)   " + MENU_4
         @ 17,15 say "5)   " + MENU_5
         set color to &FORE/&BACK

   endcase

   set color to &FORE/&BACK
   @ 6,15 say "Press the number key next to your choice."
   set color to &FORE_OFF/&BACK

return

*************************************************************************
*                                                              		*
* PROMPT >>> Displays a prompt message centered at the given line      	*
*	       entry : PMT_LINE PMT_MSG 		                *
*	       exit : None					        *
*                                                              		*
*************************************************************************

procedure PROMPT

   set color to &STAT_FORE/&STAT_BACK 
   @ PMT_LINE,(((80-len(PMT_MSG))/2)) say space(len(PMT_MSG))
   @ PMT_LINE,(((80-len(PMT_MSG))/2)) say PMT_MSG
   set color to &FORE_OFF/&BACK

return

*************************************************************************
*                                                              		*
* STATUS >>> Displays a status message at the specified line and       	*
*	       prompts the user to hit any key to continue	        *
*	       entry : STAT_LINE STAT_MSG			        *
*	       exit : None					        *
*									*
*************************************************************************

procedure STATUS

   @ STAT_LINE,((80-len(STAT_MSG))/2) say space(len(STAT_MSG))
   ANY_KEY = " "
   STAT_MSG = STAT_MSG + ", press ANY KEY to continue."

   set color to &STAT_FORE/&STAT_BACK
   @ STAT_LINE,((80-len(STAT_MSG))/2) say STAT_MSG
   set color to &FORE_OFF/&BACK

   @ 2,75 get ANY_KEY picture "X"
   read
   clear gets

   set color to &FORE/&BACK
   @ STAT_LINE,((80-len(STAT_MSG))/2) say space(len(STAT_MSG))
   set color to &FORE_OFF/&BACK

return

*************************************************************************
*									*
* TAIL >>> Display the tail line only					*
*	    entry : L:TAIL, R:TAIL					*
*	    exit : None 						*
*									*
* (C)opyright 1984, Personal Touch Software Inc.,  All Rights Reserved. *
*									*
*************************************************************************

procedure TAIL

   LINE = "ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ"

   B_LINE = " ี[ " + L_TAIL + " ]"
   B_LINE = B_LINE + substr(LINE,1,80 - ((len(B_LINE) + len(R_TAIL) + 6)))
   B_LINE = B_LINE + "[ " + R_TAIL + " ]ธ"

   TAIL_LINE = "                                      "
   TAIL_LINE = " ณ" + TAIL_LINE + TAIL_LINE + "ณ"

   CPYRGHT = " ภฤฤ Utility Services, Inc.  Manifesting-Tr"
   CPYRGHT = CPYRGHT + "acking-Reporting  (614) 837-8827 ฤฤู"

   set color to &FORE/&BACK

   @ 21,0 say B_LINE
   @ 22,0 say TAIL_LINE
   @ 23,0 say CPYRGHT

   set color to &FORE_OFF/&BACK

return

*************************************************************************
*  									*
* YESNOS >>> Displays a yes no message at the specified line and       	*
*	     prompts the user to type Y or N				*
*	     entry : YN_LINE YN_MSG					*
*	     exit : YN							*
*									*
*************************************************************************

procedure YESNO

   set color to &FORE/&BACK
   @ YN_LINE,15 say YN_MSG
   set color to &FORE_OFF/&BACK
   Y_N = YN
   YN = " "
   Do while .not. YN $"Y,N"
      YN = Y_N
      set color to &FORE/&BACK
      @ YN_LINE+2,15 say "Enter a Y (yes) or an N (no) " get Y_N picture "A"
      read
      clear gets
      set color to &FORE_OFF/&BACK
      Y_N = upper(Y_N)
      if Y_N = "Y" .or. Y_N = "N"
         YN = Y_N
      else
         Y_N = YN
         YN = " "
      endif
   enddo

   set color to &FORE/&BACK
   @ YN_LINE,0
   @ YN_LINE+2,0
   set color to &FORE_OFF/&BACK

return

**********************************************************************
*                                                                    *
* GETNGID >>> Get generator                                          *
*             ENTRY : GID number                                     *
*             EXIT  : W:TSD                                          *
*                                                                    *
*    (C)opyright 1985 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

procedure GETNGID

   G_GID = space(12)

   set color to &FORE/&BACK
   @ 10,15 say "Please enter the generator GID number."
   @ 12,15 say "gid number ... " get G_GID picture "XXXXXXXXXXXX"

   set confirm on

   read
   clear gets

   set confirm off

   set color to &FORE_OFF/&BACK

   G_GID = upper(G_GID)

return

**********************************************************************
*                                                                    *
* GETNGEN >>> Get new generator                                      *
*             ENTRY : GID number                                     *
*             EXIT  : W:TSD                                          *
*                                                                    *
*    (C)opyright 1985 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

procedure GETNGEN

   do CLRSCRN

   set color to &FORE/&BACK

   @ 7,15 say "GID .......... ";
          get G_GID picture "XXXXXXXXXXXX"

   clear gets

   G_COMPNY = space(12)
   @ 9,15 say "Company ...... ";
          get G_COMPNY picture "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

   G_ADDR = space(30)
   @ 10,15 say "Address ...... ";
          get G_ADDR picture "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

   G_CITY = space(25)
   @ 11,15 say "City ......... ";
           get G_CITY picture "XXXXXXXXXXXXXXXXXXXXXXXXX"

   G_STATE = space(2)
   @ 12,15 say "State ........ ";
           get G_STATE picture "XX"

   G_ZIP = "     -    "
   @ 13,15 say "Zip .......... ";
           get G_ZIP picture "XXXXX-XXXX"

   G_PHONE = "   -   -    "
   @ 15,15 say "Phone ........ ";
           get G_PHONE picture "999-999-9999"

   G_CONTCT = space(20)
   @ 16,15 say "Contact ...... ";
           get G_CONTCT picture "XXXXXXXXXXXXXXXXXXXX"

   set confirm on
   read
   set confirm off

   clear gets

   set color to &FORE_OFF/&BACK

   G_GID = upper(G_GID)
   G_COMPNY = upper(G_COMPNY)
   G_ADDR = upper(G_ADDR)
   G_CITY = upper(G_CITY)
   G_STATE = upper(G_STATE)
   G_ZIP = upper(G_ZIP)
   G_CONTCT = upper(G_CONTCT)
   G_MAN_NO = 0

return

**********************************************************************
*                                                                    *
* GETEGEN >>> Get edit generator                                     *
*             ENTRY : GID number                                     *
*             EXIT  : W:TSD                                          *
*                                                                    *
*    (C)opyright 1985 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

procedure GETEGEN

   do CLRSCRN

   do READGEN

   set color to &FORE/&BACK

   @ 7,15 say "GID .......... ";
          get G_GID picture "XXXXXXXXXXXX"

   clear gets

   @ 9,15 say "Company ...... ";
          get G_COMPNY picture "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

   @ 10,15 say "Address ...... ";
          get G_ADDR picture "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

   @ 11,15 say "City ......... ";
           get G_CITY picture "XXXXXXXXXXXXXXXXXXXXXXXXX"

   @ 12,15 say "State ........ ";
           get G_STATE picture "XX"

   @ 13,15 say "Zip .......... ";
           get G_ZIP picture "XXXXX-XXXX"

   @ 15,15 say "Phone ........ ";
           get G_PHONE picture "999-999-9999"

   @ 16,15 say "Contact ...... ";
           get G_CONTCT picture "XXXXXXXXXXXXXXXXXXXX"

   set confirm on
   read
   set confirm off

   clear gets

   set color to &FORE_OFF/&BACK

   G_GID = upper(G_GID)
   G_COMPNY = upper(G_COMPNY)
   G_ADDR = upper(G_ADDR)
   G_CITY = upper(G_CITY)
   G_STATE = upper(G_STATE)
   G_ZIP = upper(G_ZIP)
   G_CONTCT = upper(G_CONTCT)
   G_MAN_NO = 0

return

**********************************************************************
*                                                                    *
* GETNTID >>> Get transporter                                        *
*             ENTRY : GID number                                     *
*             EXIT  : W:TSD                                          *
*                                                                    *
*    (C)opyright 1985 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

procedure GETNTID

   T_TID = space(12)

   set color to &FORE/&BACK

   @ 10,15 say "Please enter the transporter TID number."
   @ 12,15 say "tid number ... " get T_TID picture "XXXXXXXXXXXX"

   set confirm on

   read
   clear gets

   set confirm off

   set color to &FORE_OFF/&BACK

   T_TID = upper(T_TID)

return

**********************************************************************
*                                                                    *
* GETNTRAN >>> Get transporter                                       *
*             ENTRY : GID number                                     *
*             EXIT  : W:TSD                                          *
*                                                                    *
*    (C)opyright 1985 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

procedure GETNTRAN

   do CLRSCRN

   set color to &FORE/&BACK

   @ 7,15 say "TID .......... ";
          get T_TID picture "XXXXXXXXXXXX"

   clear gets

   T_COMPNY = space(12)
   @ 9,15 say "Company ...... ";
          get T_COMPNY picture "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

   T_ADDR = space(30)
   @ 10,15 say "Address ...... ";
          get T_ADDR picture "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

   T_CITY = space(25)
   @ 11,15 say "City ......... ";
           get T_CITY picture "XXXXXXXXXXXXXXXXXXXXXXXXX"

   T_STATE = space(2)
   @ 12,15 say "State ........ ";
           get T_STATE picture "XX"

   T_ZIP = "     -    "
   @ 13,15 say "Zip .......... ";
           get T_ZIP picture "XXXXX-XXXX"

   T_PHONE = "   -   -    "
   @ 15,15 say "Phone ........ ";
           get T_PHONE picture "999-999-9999"

   T_CONTCT = space(20)
   @ 16,15 say "Contact ...... ";
           get T_CONTCT picture "XXXXXXXXXXXXXXXXXXXX"

   set confirm on
   read
   set confirm off

   clear gets

   set color to &FORE_OFF/&BACK

   T_TID = upper(T_TID)
   T_COMPNY = upper(T_COMPNY)
   T_ADDR = upper(T_ADDR)
   T_CITY = upper(T_CITY)
   T_STATE = upper(T_STATE)
   T_ZIP = upper(T_ZIP)
   T_CONTCT = upper(T_CONTCT)

return

**********************************************************************
*                                                                    *
* GETETRAN >>> Edit transporter                                      *
*             ENTRY : GID number                                     *
*             EXIT  : W:TSD                                          *
*                                                                    *
*    (C)opyright 1985 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

procedure GETETRAN

   do CLRSCRN

   do READTRAN

   set color to &FORE/&BACK

   @ 7,15 say "TID .......... ";
          get T_TID picture "XXXXXXXXXXXX"

   clear gets

   @ 9,15 say "Company ...... ";
          get T_COMPNY picture "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

   @ 10,15 say "Address ...... ";
          get T_ADDR picture "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

   @ 11,15 say "City ......... ";
           get T_CITY picture "XXXXXXXXXXXXXXXXXXXXXXXXX"

   @ 12,15 say "State ........ ";
           get T_STATE picture "XX"

   @ 13,15 say "Zip .......... ";
           get T_ZIP picture "XXXXX-XXXX"

   @ 15,15 say "Phone ........ ";
           get T_PHONE picture "999-999-9999"

   @ 16,15 say "Contact ...... ";
           get T_CONTCT picture "XXXXXXXXXXXXXXXXXXXX"

   set confirm on
   read
   set confirm off

   clear gets

   set color to &FORE_OFF/&BACK

   T_TID = upper(T_TID)
   T_COMPNY = upper(T_COMPNY)
   T_ADDR = upper(T_ADDR)
   T_CITY = upper(T_CITY)
   T_STATE = upper(T_STATE)
   T_ZIP = upper(T_ZIP)
   T_CONTCT = upper(T_CONTCT)

return

**********************************************************************
*                                                                    *
* GETNTSD >>> Get TSD facility number                                *
*             ENTRY : GID number                                     *
*             EXIT  : W:TSD                                          *
*                                                                    *
*    (C)opyright 1985 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

procedure GETNTSD

   W_TSD = space(12)

   set color to &FORE/&BACK

   @ 10,15 say "Please enter the TSD facility number."
   @ 12,15 say "tsd number ... " get W_TSD picture "XXXXXXXXXXXX"

   set confirm on

   read
   clear gets

   set confirm off

   set color to &FORE_OFF/&BACK

   W_TSD = upper(W_TSD)

return

**********************************************************************
*                                                                    *
* GETNWAS >>> Get tsd facility                                       *
*             ENTRY : GID number                                     *
*             EXIT  : W:TSD                                          *
*                                                                    *
*    (C)opyright 1985 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

procedure GETNWAS

   do CLRSCRN

   set color to &FORE/&BACK

   @ 7,15 say "TSD .......... ";
          get W_TSD picture "XXXXXXXXXXXX"

   clear gets

   W_COMPNY = space(12)
   @ 9,15 say "Company ...... ";
          get W_COMPNY picture "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

   W_ADDR = space(30)
   @ 10,15 say "Address ...... ";
          get W_ADDR picture "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

   W_CITY = space(25)
   @ 11,15 say "City ......... ";
           get W_CITY picture "XXXXXXXXXXXXXXXXXXXXXXXXX"

   W_STATE = space(2)
   @ 12,15 say "State ........ ";
           get W_STATE picture "XX"

   W_ZIP = "     -    "
   @ 13,15 say "Zip .......... ";
           get W_ZIP picture "XXXXX-XXXX"

   W_PHONE = "   -   -    "
   @ 15,15 say "Phone ........ ";
           get W_PHONE picture "999-999-9999"

   W_CONTCT = space(20)
   @ 16,15 say "Contact ...... ";
           get W_CONTCT picture "XXXXXXXXXXXXXXXXXXXX"

   set confirm on
   read
   set confirm off

   clear gets

   set color to &FORE_OFF/&BACK

   W_TSD = upper(W_TSD)
   W_COMPNY = upper(W_COMPNY)
   W_ADDR = upper(W_ADDR)
   W_CITY = upper(W_CITY)
   W_STATE = upper(W_STATE)
   W_ZIP = upper(W_ZIP)
   W_CONTCT = upper(W_CONTCT)

return

**********************************************************************
*                                                                    *
* GETEWAS >>> Edit tsd facility                                      *
*             ENTRY : GID number                                     *
*             EXIT  : W:TSD                                          *
*                                                                    *
*    (C)opyright 1985 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

procedure GETEWAS

   do CLRSCRN

   do READWAST

   set color to &FORE/&BACK

   @ 7,15 say "TSD .......... ";
          get W_TSD picture "XXXXXXXXXXXX"

   clear gets

   @ 9,15 say "Company ...... ";
          get W_COMPNY picture "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

   @ 10,15 say "Address ...... ";
          get W_ADDR picture "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

   @ 11,15 say "City ......... ";
           get W_CITY picture "XXXXXXXXXXXXXXXXXXXXXXXXX"

   @ 12,15 say "State ........ ";
           get W_STATE picture "XX"

   @ 13,15 say "Zip .......... ";
           get W_ZIP picture "XXXXX-XXXX"

   @ 15,15 say "Phone ........ ";
           get W_PHONE picture "999-999-9999"

   @ 16,15 say "Contact ...... ";
           get W_CONTCT picture "XXXXXXXXXXXXXXXXXXXX"

   set confirm on
   read
   set confirm off

   clear gets

   set color to &FORE_OFF/&BACK

   W_TSD = upper(W_TSD)
   W_COMPNY = upper(W_COMPNY)
   W_ADDR = upper(W_ADDR)
   W_CITY = upper(W_CITY)
   W_STATE = upper(W_STATE)
   W_ZIP = upper(W_ZIP)
   W_CONTCT = upper(W_CONTCT)

return

