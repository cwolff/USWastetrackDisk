*************************************************************************
*									*
* SYSADMIN >>> The menu that provides access to system adminstration	*
*	       entry : None						*
*	       exit : None						*
*									*
* (C)opyright 1884 Personal Touch Software Inc.,  All Rights Reserved.	*
*									*
*************************************************************************

private CONTINUE
private REFRESH

store .T. to CONTINUE
store .T. to REFRESH

do while CONTINUE

   if REFRESH
      HEAD = "System Management Menu"
      L_TAIL = DTOC(date())
      R_TAIL = "Press 0 to STOP"
      do FRAME

      MENU_CNT = 2
      MENU_1 = "User file Control"
      MENU_2 = "Backup data base"
      do MENU
   endif

   CHOICE = 2
   do GETMKEY

   do case

      case CHOICE = 0
	 store .F. to CONTINUE

      case CHOICE = 1
         use global
         PRMSSN = G_PRMSSN
         use
         if SUBSTR(PRMSSN,7,1) = "U"
            do USERCONT
            store .T. to REFRESH
            store .T. to CONTINUE
         else
            STAT_LINE = 19
            STAT_MSG = "System Contol permission denied"
            do STATUS
            store .T. to REFRESH
            store .T. to CONTINUE
         endif

      case CHOICE = 2
         STAT_LINE = 19
         STAT_MSG = "SORRY : Backup is under development"
         do STATUS

         store .T. to CONTINUE
         store .T. to REFRESH

*         use global
*         PRMSSN = G_PRMSSN
*         use
*         if SUBSTR(PRMSSN,8,1) = "B"
*            do BACKDBF
*            store .T. to REFRESH
*            store .T. to CONTINUE
*         else
*            STAT_LINE = 19
*            STAT_MSG = "USER MAINTENANCE permission denied"
*            do STATUS
*            store .T. to REFRESH
*            store .T. to CONTINUE
*         endif

   endcase

enddo

select A
use
select B
use

return
