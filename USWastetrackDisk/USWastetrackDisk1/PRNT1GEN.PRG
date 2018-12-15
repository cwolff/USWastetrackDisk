**********************************************************************
*                                                                    *
* PRNT1GEN  >>> Print one generator                                  *
*             ENTRY : Record number of generator                     *
*             EXIT  : None                                           *
*                                                                    *
*    (C)opyright 1984 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

@ 5,5 say "Utility Services Inc.   Generator Profile"

@ 8,5 say "GID ... .......... " + G_GID

@ 10,5 say "Company .......... " + G_COMPNY
@ 11,5 say "Address .......... " + G_ADDR
@ 12,5 say "City State Zip ... " + trim(G_CITY)
@ 13,5 say "State ............ " + trim(G_STATE)
@ 14,5 say "Zip .............. " + trim(G_ZIP)

@ 16,5 say "Contact .......... " + G_CONTCT
@ 17,5 say "Phone ............ " + G_PHONE

return

