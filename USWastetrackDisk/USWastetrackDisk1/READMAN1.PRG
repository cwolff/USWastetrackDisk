**********************************************************************
*                                                                    *
* READMAN1 >>> Read manifest page 1                                  *
*             ENTRY : MID number SWITCH = T/F                        *
*             EXIT  : None                                           *
*                                                                    *
*    (C)opyright 1984 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************
	  
M_MID = M_M_MID
M_GID = substr(M_MID,1,12)
M_TID_1 = M_M_TID_1
M_TID_2 = M_M_TID_2
M_TSD = M_M_TSD
M_DATE = M_M_DATE
M_DATE = substr(M_DATE,1,2) + "/" + substr(M_DATE,3,2) + "/" + substr(M_DATE,5,2)

if SWITCH
   select B
   use GENERATE index GIDNBR

   if .NOT. (eof() .OR. bof())
      do READGEN

   endif

   select B
   use TRANSPRT index TIDNBR

   seek M_TID_1

   if .NOT. (eof() .OR. bof())
      do READTRAN

      T1_TID = M_TID_1
      T1_COMPNY = T_COMPNY
      T1_ADDR = T_ADDR
      T1_CITY = T_CITY
      T1_STATE = T_STATE
      T1_ZIP = T_ZIP
      T1_PHONE = T_PHONE
      T1_CONTCT = T_CONTCT

   endif

   if M_TID_2 <> "            "

      seek M_TID_2

      if .NOT. (eof() .OR. bof())
         do READTRAN

         T2_TID = M_TID_2
         T2_COMPNY = T_COMPNY
         T2_ADDR = T_ADDR
         T2_CITY = T_CITY
         T2_STATE = T_STATE
         T2_ZIP = T_ZIP
         T2_PHONE = T_PHONE
         T2_CONTCT = T_CONTCT

      endif

   else
      T2_TID = "            "
      T2_COMPNY = "                              "
      T2_ADDR = "                              "
      T2_CITY = "                         "
      T2_STATE = "  "
      T2_ZIP = "         "
      T2_PHONE = "   -   -    "
      T2_CONTCT = "                    "
   
   endif

   select B
   use WASTE index TSDNBR

   seek M_TSD

   if .NOT. (eof() .OR. bof())
      do READWAST

   endif

   select B
   use

   select A

endif

return

