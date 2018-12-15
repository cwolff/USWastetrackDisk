*************************************************************************
*                                                                       *
* VENDLIST >>> List generator tranporter and treatment waste & disposal *
*                                                                       *
*            entry : None                                               *
*            exit : None                                                *
*                                                                       *
* (C)opyright 1884 Personal Touch Software Inc.,  All Rights Reserved.  *
*                                                                       *
*************************************************************************

private CONTINUE
private REFRESH

store .T. to REFRESH
store .T. to CONTINUE

do while CONTINUE

   if REFRESH
      HEAD = "Vendor List Menu"
      L_TAIL = dtoc(date())
      R_TAIL = "Press 0 to STOP"
      do FRAME

      MENU_CNT = 3
      MENU_1 = "List Generators."
      MENU_2 = "List Transporters."
      MENU_3 = "List TSD facilities."
      do MENU
   endif

   CHOICE = 3
   do GETMKEY

   do case

      case CHOICE = 0
         store .F. to CONTINUE

      case CHOICE = 1
         do LISTGID
         store .T. to REFRESH
         store .T. to CONTINUE

      case CHOICE = 2
         do LISTTID
         store .T. to REFRESH
         store .T. to CONTINUE

      case CHOICE = 3
         do LISTTSD
         store .T. to REFRESH
         store .T. to CONTINUE

   endcase

enddo

return
