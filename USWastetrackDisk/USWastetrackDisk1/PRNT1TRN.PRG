**********************************************************************
*                                                                    *
* PRNT1TRN  >>> Print one transporter                                *
*             ENTRY : Record number of generator                     *
*             EXIT  : None                                           *
*                                                                    *
*    (C)opyright 1984 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

@ 5,5 say "Utility Services Inc.   Transporter Profile"

@ 8,5 say "TID ... .......... " + T_TID

@ 10,5 say "Company .......... " + T_COMPNY
@ 11,5 say "Address .......... " + T_ADDR
@ 12,5 say "City State Zip ... " + trim(T_CITY)
@ 13,5 say "State ............ " + trim(T_STATE)
@ 14,5 say "Zip .............. " + trim(T_ZIP)

@ 16,5 say "Contact .......... " + T_CONTCT
@ 17,5 say "Phone ............ " + T_PHONE

return


