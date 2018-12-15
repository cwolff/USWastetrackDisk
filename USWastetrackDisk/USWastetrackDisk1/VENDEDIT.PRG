*************************************************************************
*									*
* VENDEDIT >>> The menu allows the user to pick the vendor to edit      *
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
      HEAD = "Edit Vendors Menu"
      L_TAIL = dtoc(date())
      R_TAIL = "Press 0 to STOP"
      do FRAME

      MENU_CNT = 3
      MENU_1 = "Edit generators"
      MENU_2 = "Edit transporters"
      MENU_3 = "Edit TSD facilties"
      do MENU
   endif

   CHOICE = 3
   do GETMKEY

   do case

      case CHOICE = 0
	 store .F. to CONTINUE

      case CHOICE = 1
	 do GENEDIT
	 store .T. to REFRESH
	 store .T. to CONTINUE

      case CHOICE = 2
	 do TRANEDIT
	 store .T. to REFRESH
	 store .T. to CONTINUE

      case CHOICE = 3
	 do WASEDIT
	 store .T. to REFRESH
	 store .T. to CONTINUE

   endcase

enddo

return


