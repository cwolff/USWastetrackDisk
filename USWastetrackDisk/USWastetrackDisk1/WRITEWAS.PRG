**********************************************************************
*                                                                    *
* WRITEWAS >>> Read tsd facility                                     *
*             ENTRY : GID number                                     *
*             EXIT  : None                                           *
*                                                                    *
*    (C)opyright 1985 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

replace W_W_TSD with W_TSD
replace W_W_COMPNY with W_COMPNY
replace W_W_ADDR with W_ADDR
replace W_W_CITY with W_CITY
replace W_W_STATE with W_STATE
replace W_W_ZIP with substr(W_ZIP,1,5) + substr(W_ZIP,7,4)
replace W_W_PHONE with substr(W_PHONE,1,3) + substr(W_PHONE,5,3) + substr(W_PHONE,9,4)   
replace W_W_CONTCT with W_W_CONTCT
   
return



