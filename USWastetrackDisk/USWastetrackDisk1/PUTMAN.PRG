**********************************************************************
*                                                                    *
* PUTMAN >>> Read manifest                                           *
*             ENTRY : GID number                                     *
*             EXIT  : None                                           *
*                                                                    *
*    (C)opyright 1984 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

set color to &FORE/&BACK

@ 4,3 say "            旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�"
@ 4,41 say "컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커"

@ 5,3 say "Generator   �"
@ 5,76 say "�"
@ 6,3 say "            �"
@ 6,76 say "�"
@ 7,3 say "            �"
@ 7,76 say "�"

@ 8,3 say "            쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴"
@ 8,41 say "컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑"

@ 9,3 say "Primary     �"
@ 9,76 say "�"
@ 10,3 say "Transporter �"
@ 10,76 say "�"
@ 11,3 say "            �"
@ 11,76 say "�"

@ 12,3 say "            쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴"
@ 12,41 say "컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑"

@ 13,3 say "Secondary   �"
@ 13,76 say "�"
@ 14,3 say "Transporter �"
@ 14,76 say "�"
@ 15,3 say "            �"
@ 15,76 say "�"

@ 16,3 say "            쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴"
@ 16,41 say "컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑"

@ 17,3 say "Treatment   �"
@ 17,76 say "�"
@ 18,3 say "Storage &   �"
@ 18,76 say "�"
@ 19,3 say "Disposal    �"
@ 19,76 say "�"

@ 20,3 say "            읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴"
@ 20,41 say "컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸"

@ 5,16 say G_COMPNY
@ 5,56 say G_GID
@ 5,71 say SUBSTR(M_MID,13,5)
@ 6,16 say G_ADDR
@ 6,56 say G_PHONE
@ 7,16 say trim(G_CITY) + "," + G_STATE + " " + G_ZIP
@ 7,56 say G_CONTCT

@ 9,16 say T1_COMPNY
@ 9,56 say T1_TID
@ 10,16 say T1_ADDR
@ 10,56 say T1_PHONE
@ 11,16 say trim(T1_CITY) + "," + T1_STATE + " " + T1_ZIP
@ 11,56 say T1_CONTCT

@ 13,16 say T2_COMPNY
@ 13,56 say T2_TID
@ 14,16 say T2_ADDR
@ 14,56 say T2_PHONE
if T2_TID <> "            "
    @ 15,16 say trim(T2_CITY) + "," + T2_STATE + " " + T2_ZIP
endif
@ 15,56 say T2_CONTCT

@ 17,16 say W_COMPNY
@ 17,56 say W_TSD
@ 18,16 say W_ADDR
@ 18,56 say W_PHONE
@ 19,16 say trim(W_CITY) + "," + W_STATE + " " + W_ZIP
@ 19,56 say W_CONTCT

set color to &FORE_OFF/&BACK

return
