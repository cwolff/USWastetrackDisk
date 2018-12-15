**********************************************************************
*                                                                    *
* PUTWASTE  >>> Display waste                                        *
*             ENTRY : Record varibales set                           *
*             EXIT  : None                                           *
*                                                                    *
*    (C)opyright 1984 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

set color to &FORE/&BACK
@ 6,15 say "TSD .......... " + W_TSD
@ 8,15 say "Company ...... " + W_COMPNY
@ 9,15 say "Address ...... " + W_ADDR
@ 10,15 say "City ......... " + W_CITY
@ 11,15 say "State ........ " + W_STATE
@ 12,15 say "Zip .......... " + W_ZIP
@ 14,15 say "Phone ........ " + W_PHONE
@ 15,15 say "Contact ...... " + W_CONTCT
set color to &FORE_OFF/&BACK

return
