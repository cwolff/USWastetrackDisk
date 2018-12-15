**********************************************************************
*                                                                    *
* READTRAN >>> Read carrier                                          *
*             ENTRY : TID number                                     *
*             EXIT  : Record variables set                           *
*                                                                    *
*    (C)opyright 1984 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

T_TID = T_T_TID
T_COMPNY = T_T_COMPNY
T_ADDR = T_T_ADDR
T_CITY = T_T_CITY
T_STATE = T_T_STATE
T_ZIP = T_T_ZIP
T_ZIP = substr(T_ZIP,1,5) + "-" + substr(T_ZIP,6,4)
T_PHONE = T_T_PHONE
T_PHONE = substr(T_PHONE,1,3) + "-" + substr(T_PHONE,4,3) + "-" + substr(T_PHONE,7,4)
T_CONTCT = T_T_CONTCT

return
