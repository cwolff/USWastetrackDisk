**********************************************************************
*                                                                    *
* PRINTMAN >>> Print manifest                                        *
*             ENTRY : GID number                                     *
*             EXIT  : None                                           *
*                                                                    *
*    (C)opyright 1984 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

private SWITCH

HEAD = "Printing Hazardous Waste Manifest"
L_TAIL = DTOC(date())
R_TAIL = "Press 0 to Stop"
do FRAME

select A
use MANIFEST index MIDNBR

do GETMAN

seek M_MID

if .NOT. (EOF() .OR. BOF())

   set DEVICE to print
      
   store .T. to SWITCH
   do READMAN1
   
   @ 8,28 say G_GID
   @ 8,42 say SUBSTR(M_MID,13,5)
   
   @ 10,6 say G_COMPNY
   @ 11,6 say G_ADDR
   @ 12,6 say trim(G_CITY) + "," + G_STATE + " " + trim(G_ZIP)
   @ 13,18 say G_PHONE

   @ 15,6 say T1_COMPNY
   @ 15,40 say T1_TID
   
   @ 17,6 say T2_COMPNY
   @ 17,40 say T2_TID

   @ 19,6 say W_COMPNY
   @ 20,6 say W_ADDR
   TEMP = trim(W_CITY) + "," + W_STATE + " " + trim(W_ZIP)
   @ 21,6 say TEMP
   @ 21,40 say W_TSD

   store .T. to SWITCH
   do READMAN2
   
   @ 25,6 say M_DESC_1_1
   @ 26,6 say M_DESC_2_1
   @ 27,6 say M_UN_NA1
   @ 27,64 say M_CNTNO1
   @ 27,68 say M_CNTTY1
   @ 27,71 say M_QNTY1
   @ 27,77 say M_UNIT1

   @ 29,6 say M_DESC_1_2
   @ 30,6 say M_DESC_2_2
   @ 31,6 say M_UN_NA2
   @ 31,64 say M_CNTNO2
   @ 31,68 say M_CNTTY2
   @ 31,71 say M_QNTY2
   @ 31,77 say M_UNIT2
   
   @ 33,6 say M_DESC_1_3
   @ 34,6 say M_DESC_2_3
   @ 35,6 say M_UN_NA3
   @ 35,64 say M_CNTNO3
   @ 35,68 say M_CNTTY3
   @ 35,71 say M_QNTY3
   @ 35,77 say M_UNIT3
   
   @ 37,6 say M_DESC_1_4
   @ 38,6 say M_DESC_2_4
   @ 39,6 say M_UN_NA4
   @ 39,64 say M_CNTNO4
   @ 39,68 say M_CNTTY4
   @ 39,71 say M_QNTY4
   @ 39,77 say M_UNIT4

   set DEVICE to screen
   
else
   STAT_LINE = 19
   STAT_MSG = "SORRY : Mainifest number " + M_MID + " not found"
   do STATUS

endif

return
