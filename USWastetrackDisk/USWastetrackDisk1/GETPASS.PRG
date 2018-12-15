*************************************************************************
*	                                                                *
* GETPASS >>> Prompts the use to enter their password                   *
*               entry : PASS_LINE                                       *
*               exit : PSSWRD                                           *
*                                                                       *
*************************************************************************

set color to &FORE/&BACK
@ PASS_LINE,15 say "Password ......... [               ]"
set color to 0/0

PSSWRD = "               "
do while len(trim(PSSWRD)) < 4
   @ PASS_LINE+1,0 get PSSWRD picture "XXXXXXXXXXXXXXX"

   set confirm on
   read
   clear gets
   set confirm off
  
   if len(trim(PSSWRD)) < 4
      STAT_LINE = 19
      STAT_MSG = "Start over, password is to short"
      do STATUS
      PSSWRD = "               "
   endif
enddo

PSSWRD = trim(upper(PSSWRD))
CODE  = len(PSSWRD)
if CODE > 7
   PSSWRD = substr(PSSWRD,1,7)
   CODE = 7
endif

MIX = "!1@2#3$4%5^6&7*8(9)0_-+=~`|\QWERT"
MIX = "YUIOP][ASDFGHJKL:;'ZXCVBNM<,>.?/}{" + MIX
ENCODE = PSSWRD
PSSWRD = str(AT(substr(ENCODE,CODE,1),"&MIX")/3,1,0)
STORE CODE - 1 to CODE
do while CODE <> 0
   PSSWRD = PSSWRD + str(AT(substr(ENCODE,CODE,1),"&MIX"),2,0)
   CODE = CODE - 1
enddo

return

