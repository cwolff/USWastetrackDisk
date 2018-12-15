*************************************************************************
*                                                                       *
* MANIMANG >>> Manifest generator management program                    *
*           written for U.S.-Wastetrac                                  *
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
      HEAD = "Manifest Management Menu"			   
      L_TAIL = DTOC(date())
      R_TAIL = "Press 0 to STOP"
      do FRAME

      MENU_CNT = 4
      MENU_1 = "Create Hazardous Waste Manifest"
      MENU_2 = "View Hazardous Waste Manifest"
      MENU_3 = "Print Hazardous Waste Manifest"
      MENU_4 = "Track Hazardous Waste Manifest"
      do MENU
   endif

   CHOICE = 4
   do GETMKEY

   do case

      case CHOICE = 0
         store .F. to CONTINUE

      case CHOICE = 1
         do CREATEM
         store .T. to REFRESH
         store .T. to CONTINUE

      case CHOICE = 2
         do VIEWM
         store .T. to REFRESH
         store .T. to CONTINUE

      case CHOICE = 3
         do PRINTM
         store .T. to REFRESH
         store .T. to CONTINUE

      case CHOICE = 4
         STAT_LINE = 19
         STAT_MSG = "SORRY : Track manifest is under development"
         do STATUS
*        do TRACKM
         store .T. to REFRESH
         store .T. to CONTINUE

   endcase

enddo

return
