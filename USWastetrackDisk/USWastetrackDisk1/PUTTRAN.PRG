**********************************************************************
*                                                                    *
* PUTTRAN  >>> Display transporter                                   *
*             ENTRY : GID number                                     *
*             EXIT  : None                                           *
*                                                                    *
*    (C)opyright 1984 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

set color to &FORE/&BACK
@ 6,15 say "TID .......... " + T_TID
@ 8,15 say "Company ...... " + T_COMPNY
@ 9,15 say "Address ...... " + T_ADDR
@ 10,15 say "City ......... " + T_CITY
@ 11,15 say "State ........ " + T_STATE
@ 12,15 say "Zip .......... " + T_ZIP
@ 14,15 say "Phone ........ " + T_PHONE
@ 15,15 say "Contact ...... " + T_CONTCT
set color to &FORE_OFF/&BACK

return
