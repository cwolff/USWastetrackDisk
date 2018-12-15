**********************************************************************
*                                                                    *
* CONVMAN >>> Get primary and secondary carries                      *
*             ENTRY : G:GID MAN:NO                                   *
*             EXIT  : M:MID                                          *
*                                                                    *
*    (C)opyright 1984 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

do case

   case MAN_NO < 10
      M_MID = G_GID + "0000" + str(MAN_NO,1)

   case MAN_NO < 100
      M_MID = G_GID + "000" + str(MAN_NO,2)

   case MAN_NO < 1000
      M_MID = G_GID + "00" + str(MAN_NO,3)

   case MAN_NO < 10000
      M_MID = G_GID + "0" + str(MAN_NO,4)

   otherwise
      M_MID = G_GID + str(MAN_NO,5)

endcase

return
    
