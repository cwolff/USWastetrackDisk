*************************************************************************
*									*
* USERCONT >>> Controls the SYSTEM.DBF add kill users, kill passwords	*
*	       entry : None						*
*	       exit : None						*
*                                                                       *
* V - Veiw vendors permission                                           *
* A - Add vendors  permision                                            *
* E - Edit vendors permision                                            *
* L - List vendors permision                                            *
* M - Generate Manifest permision                                       *
* U - User Maintenance permision                                        *
* B - Backup permision                                                  *
*									*
* (C)opyright 1984, Personal Touch Software Inc.,  All Rights Reserved. *
*									*
*************************************************************************

private CONTINUE

select B
use GLOBAL
ACT_LOGON = trim(G_LOGON)
use

select A
use SYSTEM index SYSLOGON

HEAD = "User File Control Menu"
L_TAIL = dtoc(date())
R_TAIL = "Press 0 to STOP"
do FRAME

*!! Logical constant converted.
store .T. to CONTINUE
do while CONTINUE

   MENU_CNT = 5
   MENU_1 = "Add a new user"
   MENU_2 = "Delete an existing user"
   MENU_3 = "Clear a user's password"
   MENU_4 = "Edit a user's permissions"
   MENU_5 = "List users on system"
   do MENU

   CHOICE = 5
   do GETMKEY

   do case

      case CHOICE = 0

	store .F. to CONTINUE

      case CHOICE = 1

	 do CLRSCRN

	 L_TAIL = dtoc(date())
	 R_TAIL = "Press RETURN to ENTER"
	 do tail

	 LOGON = "     "

         do while LOGON = "     "
            set color to &FORE/&BACK
	    @ 8,15 say "Enters users identification to add. "
	    @ 10,15 say "Identification ... " get LOGON picture "AAAAA"

            set confirm on

       	    read
            clear gets

            set confirm off

            set color to &FORE_OFF/&BACK

         enddo

         set color to &FORE/&BACK
	 @ 8,15
	 @ 10,15
         set color to &FORE_OFF/&BACK

	 LOGON = UPPER(LOGON)

	 goto top
	 seek LOGON

	 if (eof() .OR. bof())
	    set confirm on
	    YN_LINE = 8
	    YN_MSG = "Allow the user to view vendors ?"
	    YN = "N"
	    do YESNO
	    P_VENDVIEW = YN

	    YN_LINE = 8
	    YN_MSG = "Allow the user to add vendors ?"
	    YN = "N"
	    do YESNO
	    P_VENDADD = YN

	    YN_LINE = 8
	    YN_MSG = "Allow the user to edit vendors ?"
	    YN = "N"
	    do YESNO
	    P_VENDEDIT = YN

	    YN_LINE = 8
	    YN_MSG = "Allow the user to list vendors ?"
	    YN = "N"
	    do YESNO
	    P_VENDLIST = YN

	    YN_LINE = 8
	    YN_MSG = "Allow the user to generate manifest ?"
	    YN = "N"
	    do YESNO
	    P_MANIFEST = YN

	    YN_LINE = 8
	    YN_MSG = "Allow the user access to user maintenance ?"
	    YN = "N"
	    do YESNO
	    P_USERMAIN = YN

	    YN_LINE = 8
	    YN_MSG = "Allow the user to backup database ?"
	    YN = "N"
	    do YESNO
	    P_BACKUP = YN

	    PERMISSION = "B"+P_VENDVIEW+P_VENDADD+P_VENDEDIT
	    PERMISSION = PERMISSION+P_VENDLIST+P_MANIFEST+P_USERMAIN
            PERMISSION = PERMISSION+P_BACKUP
	    CODE = "BVAELMUB"
	    PRMSSN = "B"
	    COUNTER = 2
	    do while COUNTER < 9
	       if substr(PERMISSION,COUNTER,1) = "Y"
		  PRMSSN = PRMSSN + substr(CODE,COUNTER,1)
	       else
		  PRMSSN = PRMSSN + "N"
	       endif
	       COUNTER = COUNTER + 1
	    enddo

	    append blank
	    replace S_LOGON with LOGON
	    replace S_PRMSSN with PRMSSN

	    set confirm off

	 else
	    STAT_LINE = 19
	    STAT_MSG = LOGON + " is already a user"
	    do STATUS

	 endif
 
         L_TAIL = dtoc(date())
         R_TAIL = "Press 0 to STOP"
         do tail

      case CHOICE = 2
 
	 do CLRSCRN

	 L_TAIL = dtoc(date())
	 R_TAIL = "Press RETURN to ENTER"
	 do tail

	 LOGON = "     "

         do while LOGON = "     "
            set color to &FORE/&BACK
	    @ 8,15 say "Enters users identification to delete."
	    @ 10,15 say "Identification ... " get LOGON picture "AAAAA"

            set confirm on

	    read
	    clear gets

            set confirm off

            set color to &FORE_OFF/&BACK

         enddo

         set color to &FORE/&BACK
	 @ 8,15
	 @ 10,15
         set color to &FORE_OFF/&BACK

	 LOGON = trim(UPPER(LOGON))

	 if LOGON <> ACT_LOGON

	    goto top

	    seek LOGON

	    if (eof() .OR. bof())
	       STAT_LINE = 19
	       STAT_MSG = LOGON + " is not a user"
	       do STATUS

	    else
	       if LOGON = "ADMIN"
		  STAT_LINE = 19
		  STAT_MSG = "ADMIN can not be deleted"
		  do STATUS

	       else
		  delete for S_LOGON = LOGON
		  pack
		  STAT_LINE = 19
		  STAT_MSG = LOGON + " is now deleted"
		  do STATUS

	       endif

	    endif

	 else
	    STAT_LINE = 19
	    STAT_MSG = "Can not delete an active LOGON"
	    do STATUS

	 endif

         L_TAIL = dtoc(date())
         R_TAIL = "Press 0 to STOP"
         do tail

      case CHOICE = 3

	 do CLRSCRN

	 L_TAIL = dtoc(date())
	 R_TAIL = "Press RETURN to ENTER"
	 do tail

	 LOGON = "     "

         do while LOGON = "     "
            set color to &FORE/&BACK
	    @ 8,15 say "Enters users identification to clear password."
	    @ 10,15 say "Identification ... " get LOGON picture "AAAAA"

            set confirm on

	    read
            clear gets

            set confirm off

            set color to &FORE_OFF/&BACK

         enddo

         set color to &FORE/&BACK
	 @ 8,15
	 @ 10,15
         set color to &FORE_OFF/&BACK

	 LOGON = trim(UPPER(LOGON))

	 if LOGON <> ACT_LOGON
	    goto top
	    seek LOGON

	    if (eof() .OR. bof())

	       STAT_LINE = 19
	       STAT_MSG = LOGON + " is not a user"
	       do STATUS

	    else
	       replace S_PSSWRD with "              "
	       PRMSSN = S_PRMSSN
	       replace S_PRMSSN with "B" + substr(PRMSSN,2,7)

	       STAT_LINE = 19
	       STAT_MSG = LOGON + "'s password is now cleared."
	       do STATUS
 
	    endif

	 else
	    STAT_LINE = 19
	    STAT_MSG = "Can not clear an active LOGON's password"
	    do STATUS
	 endif

         L_TAIL = dtoc(date())
         R_TAIL = "Press 0 to STOP"
         do tail

      case CHOICE = 4

	 do CLRSCRN

	 L_TAIL = dtoc(date())
	 R_TAIL = "Press RETURN to ENTER"
	 do tail
 
	 set confirm on
	 LOGON = "     "

         do while LOGON = "     "
            set color to &FORE/&BACK
	    @ 8,15 say "Enters users identification to edit. "
	    @ 10,15 say "Identification ... " get LOGON picture "AAAAA"

            set confirm on

 	    read
            clear gets

            set confirm off

            set color to &FORE_OFF/&BACK

         enddo

         set color to &FORE/&BACK
	 @ 8,15
	 @ 10,15
         set color to &FORE_OFF/&BACK

	 LOGON = trim(UPPER(LOGON))

	 if LOGON <> ACT_LOGON

	    goto top
	    seek LOGON

	    if .NOT. (eof() .OR. bof())
	       if LOGON = "ADMIN"
		  STAT_LINE = 19
		  STAT_MSG = "ADMIN's permissions can not be edited"
		  do STATUS
	       else
		  set confirm on
		  PRMSSN = S_PRMSSN
		  YN_LINE = 8
		  YN_MSG = "Allow the user to view vendors ?"
		  if substr(PRMSSN,2,1) = "V"
		     YN = "Y"
		  else
		     YN = "N"
		  endif
		  do YESNO
		  P_VENDVIEW = YN

		  YN_LINE = 8
		  YN_MSG = "Allow the user to add vendors ?"
		  if substr(PRMSSN,3,1) = "A"
		     YN = "Y"
		  else
		     YN = "N"
		  endif
		  do YESNO
		  P_VENDADD = YN

		  YN_LINE = 8
		  YN_MSG = "Allow the user to edit vendors ?"
		  if substr(PRMSSN,4,1) = "E"
		     YN = "Y"
		  else
		     YN = "N"
		  endif
		  do YESNO
		  P_VENDEDIT = YN

		  YN_LINE = 8
		  YN_MSG = "Allow the user to list vendors ?"
		  if substr(PRMSSN,5,1) = "L"
		     YN = "Y"
		  else
		     YN = "N"
		  endif
		  do YESNO
		  P_VENDLIST = YN

		  YN_LINE = 8
		  YN_MSG = "Allow the user to generate manifest ?"
		  if substr(PRMSSN,6,1) = "M"
		     YN = "Y"
		  else
		     YN = "N"
		  endif
		  do YESNO
		  P_MANIFEST = YN

		  YN_LINE = 8
		  YN_MSG = "Allow the user access to user maintenance ?"
		  if substr(PRMSSN,7,1) = "U"
		     YN = "Y"
		  else
		     YN = "N"
		  endif
		  do YESNO
		  P_USERMAIN = YN

		  YN_LINE = 8
		  YN_MSG = "Allow the user to backup database ?"
		  if substr(PRMSSN,8,1) = "B"
		     YN = "Y"
		  else
		     YN = "N"
		  endif
		  do YESNO
		  P_BACKUP = YN

		  PERMISSION = substr(PRMSSN,1,1)+P_VENDVIEW+P_VENDADD
		  PERMISSION = PERMISSION+P_VENDEDIT+P_VENDLIST
                  PERMISSION = PERMISSION+P_MANIFEST+P_USERMAIN
                  PERMISSION = PERMISSION+P_BACKUP
		  CODE = "BVAELMUB"
		  PRMSSN = substr(PRMSSN,1,1)
		  COUNTER = 2
		  do while COUNTER < 9
		     if substr(PERMISSION,COUNTER,1) = "Y"
			PRMSSN = PRMSSN + substr(CODE,COUNTER,1)
		     else
			PRMSSN = PRMSSN + "N"
		     endif
		     COUNTER = COUNTER + 1
		  enddo

		  replace S_PRMSSN with PRMSSN

		  set confirm off

	       endif

	    else
	       STAT_LINE = 19
	       STAT_MSG = LOGON + " is not a user"
	       do STATUS

	    endif

	 else
	    STAT_LINE = 19
	    STAT_MSG = "Can not edit an active LOGON's permissions"
	    do STATUS

	 endif

         L_TAIL = dtoc(date())
         R_TAIL = "Press 0 to STOP"
         do tail

      case CHOICE = 5

	 do CLRSCRN

	 L_TAIL = dtoc(date())
	 R_TAIL = "Press ANY KEY for next user"
	 do tail

	 goto top
	 do while .not. eof()

	    LOGON = S_LOGON
	    PRMSSN = S_PRMSSN

	    if substr(PRMSSN,2,1) = "V"
	       P_VENDVIEW = "allowed"
	    else
	       P_VENDVIEW = "NOT allowed"
	    endif

	    if substr(PRMSSN,3,1) = "A"
	       P_VENDADD = "allowed"
	    else
	       P_VENDADD = "NOT allowed"
	    endif

	    if substr(PRMSSN,4,1) = "E"
	       P_VENDEDIT = "allowed"
	    else
	       P_VENDEDIT = "NOT allowed"
	    endif

	    if substr(PRMSSN,5,1) = "L"
	       P_VENDLIST = "allowed"
	    else
	       P_VENDLIST = "NOT allowed"
	    endif

	    if substr(PRMSSN,6,1) = "M"
	       P_MANIFEST = "allowed"
	    else
	       P_MANIFEST = "NOT allowed"
	    endif

	    if substr(PRMSSN,7,1) = "U"
	       P_USERMAIN = "allowed"
	    else
	       P_USERMAIN = "NOT allowed"
	    endif

	    if substr(PRMSSN,8,1) = "B"
	       P_BACKUP = "allowed"
	    else
	       P_BACKUP = "NOT allowed"
	    endif

            set color to &FORE/&BACK
	    @ 8,15 say "USER's identification is .......... " + LOGON
	    @ 10,15 say "VIEW permission is ............... " + P_VENDVIEW
	    @ 11,15 say "ADD permission is ................ " + P_VENDADD
	    @ 12,15 say "EDIT permission is ................" + P_VENDEDIT
	    @ 13,15 say "LIST permission is ............... " + P_VENDLIST
	    @ 14,15 say "MANIFEST permission is ........... " + P_MANIFEST
	    @ 15,15 say "USER MAINTENANCE permission is ... " + P_USERMAIN
            @ 16,15 say "BACKUP permission is ............. " + P_BACKUP
            set color to &FORE_OFF/&BACK

	    STAT_LINE = 19
	    STAT_MSG = "You are scrolling through the user listing"
	    do status

	    skip

	    do CLRSCRN

         enddo

         L_TAIL = dtoc(date())
         R_TAIL = "Press 0 to STOP"
         do tail

    endcase

enddo

select A
use

return
