*************************************************************************
*									*
* VENDVIEW >>> The menu allows the user to pick the vendor to add       *
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
      HEAD = "View Vendors Menu"
      L_TAIL = dtoc(date())
      R_TAIL = "Press 0 to STOP"
      do FRAME

      MENU_CNT = 3
      MENU_1 = "View generators"
      MENU_2 = "View transporters"
      MENU_3 = "View TSD facilties"
      do MENU
   endif

   CHOICE = 3
   do GETMKEY

   do case

      case CHOICE = 0
	 store .F. to CONTINUE

      case CHOICE = 1
	 do GENVIEW
	 store .T. to REFRESH
	 store .T. to CONTINUE

      case CHOICE = 2
	 do TRANVIEW
	 store .T. to REFRESH
	 store .T. to CONTINUE

      case CHOICE = 3
	 do WASVIEW
	 store .T. to REFRESH
	 store .T. to CONTINUE

   endcase

enddo

return


