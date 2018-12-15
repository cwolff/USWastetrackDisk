**********************************************************************
*                                                                    *
* WRITEGEN >>> Read generator                                        *
*             ENTRY : GID number                                     *
*             EXIT  : None                                           *
*                                                                    *
*    (C)opyright 1985 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

replace G_G_GID with G_GID
replace G_G_COMPNY with G_COMPNY
replace G_G_ADDR with G_ADDR
replace G_G_CITY with G_CITY
replace G_G_STATE with G_STATE
replace G_G_ZIP with substr(G_ZIP,1,5) + substr(G_ZIP,7,4)
replace G_G_PHONE with substr(G_PHONE,1,3) + substr(G_PHONE,5,3) + substr(G_PHONE,9,4)   
replace G_G_CONTCT with G_G_CONTCT
replace G_G_MAN_NO with G_MAN_NO
   
return

