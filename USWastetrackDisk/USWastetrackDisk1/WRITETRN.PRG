**********************************************************************
*                                                                    *
* WRITETRN >>> Read transporter                                      *
*             ENTRY : GID number                                     *
*             EXIT  : None                                           *
*                                                                    *
*    (C)opyright 1985 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

replace T_T_TID with T_TID
replace T_T_COMPNY with T_COMPNY
replace T_T_ADDR with T_ADDR
replace T_T_CITY with T_CITY
replace T_T_STATE with T_STATE
replace T_T_ZIP with substr(T_ZIP,1,5) + substr(T_ZIP,7,4)
replace T_T_PHONE with substr(T_PHONE,1,3) + substr(T_PHONE,5,3) + substr(T_PHONE,9,4)   
replace T_T_CONTCT with T_T_CONTCT
   
return


