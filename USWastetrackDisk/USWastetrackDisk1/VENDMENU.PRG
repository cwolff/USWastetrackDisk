*************************************************************************
*									*
* VENDMENU >>> The menu allows the user to pick the vendor to add       *
*	       entry : None						*
*	       exit : None						*
*									*
* (C)opyright 1884 Personal Touch Software Inc.,  All Rights Reserved.	*
*									*
*************************************************************************

private CONTINUE
private REFRESH

store .T. to REFRESH
store .T. to CONTINUE
do while CONTINUE

   if REFRESH
      HEAD = "Vendor Maintenance"
      L_TAIL = dtoc(date())
      R_TAIL = "Press 0 to STOP"
      do FRAME

      MENU_CNT = 4
      MENU_1 = "View vendors(s) information"
      MENU_2 = "Add vendors(s) information"
      MENU_3 = "Edit vendors(s) information"
      MENU_4 = "List vendors(s) information"
      do MENU
   endif

   CHOICE = 4
   do GETMKEY

   do case

      case CHOICE = 0
	 store .F. to CONTINUE

      case CHOICE = 1
	 select A
	 use GLOBAL
	 PRMSSN = G_PRMSSN
	 use
	 if substr(PRMSSN,2,1) = "V"
	    do VENDVIEW
	    store .T. to REFRESH
	    store .T. to CONTINUE
	 else
	    STAT_LINE = 19
	    STAT_MSG = "VIEW permission denied"
	    do STATUS
	    store .F. to REFRESH
	 endif
	 release PRMSSN

      case CHOICE = 2
	 select A
	 use GLOBAL
	 PRMSSN = G_PRMSSN
	 use
	 if substr(PRMSSN,3,1) = "A"
	    do VENDADD
	    store .T. to REFRESH
	    store .T. to CONTINUE
	 else
	    STAT_LINE = 19
	    STAT_MSG = "ADD permission denied"
	    do STATUS
	    store .F. to REFRESH
	 endif
	 release PRMSSN

      case CHOICE = 3
	 select A
	 use GLOBAL
	 PRMSSN = G_PRMSSN
	 use
	 if substr(PRMSSN,4,1) = "E"
	    do VENDEDIT
	    store .T. to REFRESH
	    store .T. to CONTINUE
	 else
	    STAT_LINE = 19
	    STAT_MSG = "EDIT permission denied"
	    do STATUS
	    store .F. to REFRESH
	 endif
	 release PRMSSN

      case CHOICE = 4
	 select A
	 use GLOBAL
	 PRMSSN = G_PRMSSN
	 use
	 if substr(PRMSSN,6,1) = "L"
	    do VENDLIST
	    store .T. to REFRESH
	    store .T. to CONTINUE
	 else
	    STAT_LINE = 19
	    STAT_MSG = "LIST permission denied"
	    do STATUS
	    store .F. to REFRESH
	 endif
	 release PRMSSN

   endcase

enddo

return
