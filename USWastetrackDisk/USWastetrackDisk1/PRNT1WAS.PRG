**********************************************************************
*                                                                    *
* PRNT1WAS  >>> Print one TSD facility                               *
*             ENTRY : Record number of generator                     *
*             EXIT  : None                                           *
*                                                                    *
*    (C)opyright 1984 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

@ 5,5 say "Utility Services Inc.   TSD Facility Profile"

@ 8,5 say "TID ... .......... " + W_TSD

@ 10,5 say "Company .......... " + W_COMPNY
@ 11,5 say "Address .......... " + W_ADDR
@ 12,5 say "City State Zip ... " + trim(W_CITY)
@ 13,5 say "State ............ " + trim(W_STATE)
@ 14,5 say "Zip .............. " + trim(W_ZIP)

@ 16,5 say "Contact .......... " + W_CONTCT
@ 17,5 say "Phone ............ " + W_PHONE

return



