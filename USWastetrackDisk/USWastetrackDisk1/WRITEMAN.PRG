**********************************************************************
*                                                                    *
* WRITEMAN >>> Write manifest                                        *
*             ENTRY : MID number SWITCH = T/F                        *
*             EXIT  : None                                           *
*                                                                    *
*    (C)opyright 1984 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

replace M_M_MID with M_MID
replace M_M_TID_1 with M_TID_1
replace M_M_TID_2 with M_TID_2
replace M_M_TSD with M_TSD
replace M_M_DATE with substr(M_DATE,1,2) + substr(M_DATE,4,2) + substr(M_DATE,7,2)

replace M_M_UN_NA1 with M_UN_NA1
replace M_M_CNTNO1 with M_CNTNO1
replace M_M_CNTTY1 with M_CNTTY1
replace M_M_QNTY1 with M_QNTY1
replace M_M_UNIT1 with M_UNIT1

replace M_M_UN_NA2 with M_UN_NA2
replace M_M_CNTNO2 with M_CNTNO2
replace M_M_CNTTY2 with M_CNTTY2
replace M_M_QNTY2 with M_QNTY2
replace M_M_UNIT2 with M_UNIT2

replace M_M_UN_NA3 with M_UN_NA3
replace M_M_CNTNO3 with M_CNTNO3
replace M_M_CNTTY3 with M_CNTTY3
replace M_M_QNTY3 with M_QNTY3
replace M_M_UNIT3 with M_UNIT3

replace M_M_UN_NA4 with M_UN_NA4
replace M_M_CNTNO4 with M_CNTNO4
replace M_M_CNTTY4 with M_CNTTY4
replace M_M_QNTY4 with M_QNTY4
replace M_M_UNIT4 with M_UNIT4

replace M_M_UN_NA5 with M_UN_NA5
replace M_M_CNTNO5 with M_CNTNO5
replace M_M_CNTTY5 with M_CNTTY5
replace M_M_QNTY5 with M_QNTY5
replace M_M_UNIT5 with M_UNIT5

replace M_M_UN_NA6 with M_UN_NA6
replace M_M_CNTNO6 with M_CNTNO6
replace M_M_CNTTY6 with M_CNTTY6
replace M_M_QNTY6 with M_QNTY6
replace M_M_UNIT6 with M_UNIT6

return

