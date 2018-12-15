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

@ 4,3 say "            ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
@ 4,41 say "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿"

@ 5,3 say "Generator   ³"
@ 5,76 say "³"
@ 6,3 say "            ³"
@ 6,76 say "³"
@ 7,3 say "            ³"
@ 7,76 say "³"

@ 8,3 say "            ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
@ 8,41 say "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´"

@ 9,3 say "Primary     ³"
@ 9,76 say "³"
@ 10,3 say "Transporter ³"
@ 10,76 say "³"
@ 11,3 say "            ³"
@ 11,76 say "³"

@ 12,3 say "            ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
@ 12,41 say "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´"

@ 13,3 say "Secondary   ³"
@ 13,76 say "³"
@ 14,3 say "Transporter ³"
@ 14,76 say "³"
@ 15,3 say "            ³"
@ 15,76 say "³"

@ 16,3 say "            ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
@ 16,41 say "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´"

@ 17,3 say "Treatment   ³"
@ 17,76 say "³"
@ 18,3 say "Storage &   ³"
@ 18,76 say "³"
@ 19,3 say "Disposal    ³"
@ 19,76 say "³"

@ 20,3 say "            ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
@ 20,41 say "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ"

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