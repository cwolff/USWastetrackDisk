**********************************************************************
*                                                                    *
* READMAN2 >>> Read manifest pag 2                                   *
*             ENTRY : MID number SWITCH = T/F                        *
*             EXIT  : None                                           *
*                                                                    *
*    (C)opyright 1984 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

M_UN_NA1 = M_M_UN_NA1
M_CNTNO1 = M_M_CNTNO1
M_CNTTY1 = M_M_CNTTY1
M_QNTY1 = M_M_QNTY1
M_UNIT1 = M_M_UNIT1

M_UN_NA2 = M_M_UN_NA2
M_CNTNO2 = M_M_CNTNO2
M_CNTTY2 = M_M_CNTTY2
M_QNTY2 = M_M_QNTY2
M_UNIT2 = M_M_UNIT2

M_UN_NA3 = M_M_UN_NA3
M_CNTNO3 = M_M_CNTNO3
M_CNTTY3 = M_M_CNTTY3
M_QNTY3 = M_M_QNTY3
M_UNIT3 = M_M_UNIT3

M_UN_NA4 = M_M_UN_NA4
M_CNTNO4 = M_M_CNTNO4
M_CNTTY4 = M_M_CNTTY4
M_QNTY4 = M_M_QNTY4
M_UNIT4 = M_M_UNIT4

if SWITCH
   select B
   use HWASTE index HUNNANBR
   
   seek M_UN_NA1

   if .NOT. (eof() .OR. bof())
      M_DESC_1_1 = H_DESC_1
      M_DESC_2_1 = H_DESC_2

   else
      M_DESC_1_1 = " "
      M_DESC_2_1 = " "

   endif

   seek M_UN_NA2

   if .NOT. (eof() .OR. bof())
      M_DESC_1_2 = H_DESC_1
      M_DESC_2_2 = H_DESC_2

   else
      M_DESC_1_2 = " "
      M_DESC_2_2 = " "

   endif

   seek M_UN_NA3

   if .NOT. (eof() .OR. bof())
      M_DESC_1_3 = H_DESC_1
      M_DESC_2_3 = H_DESC_2

   else
      M_DESC_1_3 = " "
      M_DESC_2_3 = " "

   endif

   seek M_UN_NA4

   if .NOT. (eof() .OR. bof())
      M_DESC_1_4 = H_DESC_1
      M_DESC_2_4 = H_DESC_2

   else
      M_DESC_1_4 = " "
      M_DESC_2_4 = " "

   endif

endif

return

