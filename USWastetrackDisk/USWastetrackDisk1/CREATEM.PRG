**********************************************************************
*                                                                    *
* CREATEM >>> Get primary and secondary carries                      *
*             ENTRY : GID number                                     *
*             EXIT  : None                                           *
*                                                                    *
*    (C)opyright 1984 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

HEAD = "Creating Hazardous Waste Manifest"
L_TAIL = dtoc(date())
R_TAIL = "Press 0 to Stop"
do FRAME

select A
use global
LOGON = G_LOGON
use

do GETGEN

do GETTRAN

do GETWASTE

do GETITEM

PMT_LINE = 19
PMT_MSG = "1) Save this manifest  2) Throw it away"
do PROMPT

CHOICE = 2
do GETKEY

@ 19,0

if CHOICE = 1
   select A
   use GENERATE index GIDNBR

   seek G_GID

   if .NOT. (EOF() .OR. BOF())
      MAN_NO = G_G_MAN_NO
      MAN_NO = MAN_NO + 1
      replace G_G_MAN_NO with MAN_NO

      select A
      use

      do CONVMAN

      M_TID_1 = T_TID_1
      M_TID_2 = T_TID_2
      M_TSD = W_TSD
      M_DATE = dtoc(date())

      select A
      use MANIFEST index MIDNBR

      append blank

      do WRITEMAN

      select A
      use

   else
      STAT_LINE = 19
      STAT_MSG = "Manifest creation error in CREATEM"
      do STATUS

   endif

endif

return
