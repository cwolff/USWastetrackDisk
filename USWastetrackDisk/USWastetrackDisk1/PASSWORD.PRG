**************************************************************************       *                                                             
*                                                                        *
* PASSWORD >>> Prompts the use to enter their ID and password            *
*               entry : None                                             *
*               exit : None                                              *
*                                                                        *
* (C)opyright 1984, Personal Touch Software Inc.,  All Rights Reserved.  *
*                                                                        *
**************************************************************************

private PSSWRD
private CONTINUE

select B
use global

select A
use SYSTEM index SYSLOGON

HEAD = "System Logon Procedure"
L_TAIL = dtoc(date())
R_TAIL = "Press RETURN to ENTER"
do FRAME

store .T. to CONTINUE

do while CONTINUE

   LOGON = "     "

   set color to &FORE/&BACK
   @ 7,15 say "Please enter your identification."
   @ 9,15 say "Identification ... " get LOGON picture "AAAAA"

   set confirm on

   read
   clear gets

   set confirm off

   LOGON = trim(upper(LOGON))

   @ 7,0
   @ 9,0

   @ 7,15 say "Please enter your password."
   PASS_LINE = 9

   set color to &FORE/&BACK

   PSSWRD = " "
   do GETPASS

   @ 7,15
   @ 9,0

   seek LOGON

   PRMSSN = " "
   PWDATE = "  /  /  "

   if (eof() .OR. bof())
      STAT_LINE = 19
      STAT_MSG = "No such ID see System Administrator"
      do STATUS

   else
      PRMSSN = S_PRMSSN

      if "              " = S_PSSWRD

         if substr(PRMSSN,1,1) = "B"
            replace S_PSSWRD with PSSWRD 
            PRMSSN = "P" + substr(PRMSSN,2,9)
            replace S_PRMSSN with PRMSSN
            PWDATE = dtoc(date())
            replace S_PWDATE with PWDATE
            STAT_LINE = 19
            STAT_MSG = LOGON + " please remember your new password"
            do STATUS 
            store .F. CONTINUE.

         else
            PSSWRD = " "
            replace S_PRMSSN with PRMSSN
            PRMSSN = "I" + substr(PRMSSN,2,9)
            replace S_PRMSSN with PRMSSN
            PRMSSN = " "
            replace S_PSSWRD with PRMSSN
            STAT_LINE = 19
            STAT_MSG = "Tampered PASSWORD, report to ADMINSTRATOR"
            do STATUS

         endif

      else

         if PSSWRD <> trim(S_PSSWRD)
            STAT_LINE = 19
            STAT_MSG = "Invalid LOGON"
            do STATUS

         else
            if substr(S_PRMSSN,1,1) <> "P"
               PRMSSN = "T" + substr(PRMSSN,2,9)
               replace S_PRMSSN with PRMSSN
               STAT_LINE = 19
               STAT_MSG = "Tampered PERMISSIONS, report to ADMINSTRATOR"
               do STATUS

            else
               LOGON = S_LOGON
               PSSWRD = S_PSSWRD
               PRMSSN = S_PRMSSN
               PWDATE = S_PWDATE
               store .F. to CONTINUE
   
            endif

         endif

      endif

   endif

   set exact off

   select B
   replace G_LOGON with LOGON
   replace G_PSSWRD with PSSWRD
   replace G_PRMSSN with PRMSSN
   replace G_PWDATE with PWDATE
   select A

enddo

select B
use
select A
use

return

