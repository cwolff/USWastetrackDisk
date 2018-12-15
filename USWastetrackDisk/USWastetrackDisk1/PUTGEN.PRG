**********************************************************************
*                                                                    *
* PUTGEN  >>> Display generator                                      *
*             ENTRY : Record varibales set                           *
*             EXIT  : None                                           *
*                                                                    *
*    (C)opyright 1984 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

set color to &FORE/&BACK
@ 6,15 say "GID .......... " + G_GID
@ 8,15 say "Company ...... " + G_COMPNY
@ 9,15 say "Address ...... " + G_ADDR
@ 10,15 say "City ......... " + G_CITY
@ 11,15 say "State ........ " + G_STATE
@ 12,15 say "Zip .......... " + G_ZIP
@ 14,15 say "Phone ........ " + G_PHONE
@ 15,15 say "Contact ...... " + G_CONTCT
set color to &FORE_OFF/&BACK

return
