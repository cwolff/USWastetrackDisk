*************************************************************************
*									*
* VENDMANG >>> The menu that provides access to the vendor data base    *
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
      HEAD = "Vendor Management Menu"
      L_TAIL = dtoc(date())
      R_TAIL = "Press 0 to STOP"
      do FRAME

      MENU_CNT = 4
      MENU_1 = "View vendor information"
      MENU_2 = "Add vendor information"
      MENU_3 = "Edit vendor information"
      MENU_4 = "List vendors information"
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

      case CHOICE = 4
	 select A
	 use GLOBAL
	 PRMSSN = G_PRMSSN
	 use
	 if substr(PRMSSN,5,1) = "L"
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