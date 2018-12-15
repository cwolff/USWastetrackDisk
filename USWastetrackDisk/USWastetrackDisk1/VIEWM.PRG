**********************************************************************
*                                                                    *
* VIEWM >>> View manifest already entered                            *
*             ENTRY : None                                           *
*             EXIT  : None                                           *
*                                                                    *
*    (C)opyright 1984 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

private SWITCH

HEAD = "Viewing Hazardous Waste Manifest"
L_TAIL = DTOC(date())
R_TAIL = "Press 0 to Stop"
do FRAME

select A
use MANIFEST index MIDNBR

do GETMAN

seek trim(M_MID)

if .NOT. (EOF() .OR. BOF())
   store .T. to SWITCH
   do READMAN1

   do PUTMAN1

   STAT_LINE = 22
   STAT_MSG = "Viewing manifest document page 1"
   do STATUS

   do CLRSCRN

   store .T. to SWITCH
   do READMAN2

   do PUTMAN2

   STAT_LINE = 22
   STAT_MSG = "Viewing manifest document page 2"
   do STATUS

else
   STAT_LINE = 19
   STAT_MSG = "Manifest number " + M_MID + " not found"
   do STATUS

endif

return
