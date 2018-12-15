*************************************************************************
*									*
* CHNGPASS >>> Prompts the user to change their password		*
*	       entry : None						*
*	       exit : None						*
*									*
* (C)opyright 1984, Personal Touch Software Inc.,  All Rights Reserved. *
*									*
*************************************************************************

private PSSWRD
private CONTINUE

select B
use SYSTEM index SYSLOGON
select A
use GLOBAL

HEAD = "Changing Your Password"
L_TAIL = dtoc(date())
R_TAIL = "Press RETURN to ENTER"
do FRAME

store .T. to CONTINUE

set exact on
do while CONTINUE

   OLDWORD = G_PSSWRD
   LOGON = G_LOGON
   PRMSSN = G_PRMSSN
   LOGON = trim(LOGON)

   set color to &FORE/&BACK
   @ 7,15 say "Enter your old password."
   set color to &FORE_OFF/&BACK
   PASS_LINE = 9

   PSSWRD = " "
   do GETPASS

   set color to &FORE/&BACK
   @ 7,0
   @ 9,0
   set color to &FORE_OFF/&BACK
   
   if OLDWORD = PSSWRD

      set color to &FORE/&BACK
      @ 7,15 say "Enter your new password."
      set color to &FORE_OFF/&BACK
      PASS_LINE = 9

      PSSWRD = " "
      do GETPASS

      set color to &FORE/&BACK
      @ 7,0
      @ 9,0
      set color to &FORE_OFF/&BACK

      NEWWORD = PSSWRD

      set color to &FORE/&BACK
      @ 7,15 say "Enter your new password a second time."
      set color to &FORE_OFF/&BACK
      PASS_LINE = 9

      PSSWRD = " "
      do GETPASS

      set color to &FORE/&BACK
      @ 7,0
      @ 9,0
      set color to &FORE_OFF/&BACK

      if NEWWORD = PSSWRD
         if OLDWORD = PSSWRD
            STAT_LINE = 19
       	    STAT_MSG = "Can not use the old password again"
      	    do status

     	 else
            select B

            seek LOGON

            if (eof() .OR. bof())
               STAT_LINE = 19
               STAT_MSG = "Unable to change password"
               do STATUS
               PSSWRD = OLDWORD

            else
               PSSWRD = NEWWORD
               replace S_PSSWRD with PSSWRD
               replace S_PWDATE with dtoc(date())
               STAT_LINE = 19
               STAT_MSG = LOGON + " please remember your new password"
               do STATUS

            endif

            select A
            replace G_PSSWRD with PSSWRD
            replace G_PWDATE with dtoc(date())
            store .F. to CONTINUE

         endif

      else

         STAT_LINE = 19
         STAT_MSG = "Second entry did not match first"
         do STATUS

         store .T. to CONTINUE

      endif

   else

      STAT_LINE = 19
      STAT_MSG = "Invalid password"
      do STATUS

      store .T. to CONTINUE

   endif

enddo

set exact off

select B
use
select A
use

return

