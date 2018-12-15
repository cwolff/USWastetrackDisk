**********************************************************************
*                                                                    *
* TITLEPG  >>> Print title page                                      *
*             ENTRY : None                                           *
*             EXIT  : None                                           *
*                                                                    *
*    (C)opyright 1984 Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

set device to print

eject

@ 10,1 say "U   U    SSSSS    " + ;
           "W   W  AAAAA  SSSSS  TTTTT  EEEE  TTTTT  RRRR    AAAAA  CCCCC"
@ 11,1 say "U   U    S        " + ;
           "W   W  A   A  S        T    E       T    R  R    A   A  C   "
@ 12,1 say "U   U    S        " + ;
           "W   W  A   A  S        T    E       T    R  R    A   A  C   "
@ 13,1 say "U   U    SSSSS    " + ;
           "W W W  AAAAA  SSSSS    T    EEE     T    RRRR    AAAAA  C   "
@ 14,1 say "U   U        S    " + ;
           "WWWWW  A   A      S    T    E       T    R   R   A   A  C   "
@ 15,1 say "U   U        S    " + ;
           "WW WW  A   A      S    T    E       T    R    R  A   A  C   "
@ 16,1 say "UUUUU #  SSSSS #  " + ;
           "W   W  A   A  SSSSS    T    EEEE    T    R    R  A   A  CCCCC"

@ 21,7 say "        The information contained within is the property of    "
@ 23,7 say "                       Utility Services Inc.                   "
@ 24,7 say "                         3802 Danub Drive                      "
@ 25,7 say "                       Groveport, Ohio 43125                   "
@ 26,7 say "                          (614) 837-8827                       "

@ 51,7 say "  (C)opyright 1985, Personal Touch Software  All Rights Rserved   "
@ 53,7 say "                  Licensed to Utility Services Inc.               "

set DEVICE to screen

return
