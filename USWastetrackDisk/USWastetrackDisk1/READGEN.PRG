**********************************************************************
*                                                                    *
* READGEN >>> Read generator                                         *
*             ENTRY : GID number                                     *
*             EXIT  : None                                           *
*                                                                    *
*    (C)opyright 1985 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

G_GID = G_G_GID
G_COMPNY = G_G_COMPNY
G_ADDR = G_G_ADDR
G_CITY = G_G_CITY
G_STATE = G_G_STATE

if substr(G_G_ZIP,6,4) = "    "
   G_ZIP = substr(G_G_ZIP,1,5) + "     "
   
else
   G_ZIP = substr(G_G_ZIP,1,5) + "-" +  substr(G_G_ZIP,6,4)
   
endif
   
G_PHONE = substr(G_G_PHONE,1,3)+"-"+substr(G_G_PHONE,4,3)+"-"+substr(G_G_PHONE,7,4)
G_CONTCT = G_G_CONTCT
   
return
