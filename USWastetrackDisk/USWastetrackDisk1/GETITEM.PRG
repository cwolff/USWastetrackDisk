**********************************************************************
*                                                                    *
* GETITEM >>> Get a item for transport                               *
*             ENTRY : GID number                                     *
*             EXIT  : None                                           *
*                                                                    *
*   (C)opyright 1984, Personal Touch Software, All Rights Reserved   *
*                                                                    *
**********************************************************************

private T_HIT
private CONTAINER
private UNIT

select A
use HWASTE index HUNNANBR

M_UN_NA1 = "          "
M_CNTNO1 = "   "
M_CNTTY1 = "  "
M_QNTY1 = "     "
M_UNIT1 = "   "

M_UN_NA2 = "          "
M_CNTNO2 = "   "
M_CNTTY2 = "  "
M_QNTY2 = "     "
M_UNIT2 = "   "

M_UN_NA3 = "          "
M_CNTNO3 = "   "
M_CNTTY3 = "  "
M_QNTY3 = "     "
M_UNIT3 = "   "

M_UN_NA4 = "          "
M_CNTNO4 = "   "
M_CNTTY4 = "  "
M_QNTY4 = "     "
M_UNIT4 = "   "

M_UN_NA5 = "          "
M_CNTNO5 = "   "
M_CNTTY5 = "  "
M_QNTY5 = "     "
M_UNIT5 = "   "

M_UN_NA6 = "          "
M_CNTNO6 = "   "
M_CNTTY6 = "  "
M_QNTY6 = "     "
M_UNIT6 = "   "

ITEMS = 1

store .T. to T_HIT
do while T_HIT

   M_UN_NA = "        "

   set color to &FORE/&BACK
   @ 10,15 say "Please enter the hazardous waste UN/NA number."
   @ 12,15 say "waste UN/NA number ... " get M_UN_NA picture "XXXXXX"

   set confirm on

   read
   clear gets
 
   set confirm off

   @ 10,0
   @ 12,0

   set color to &FORE_OFF/&BACK

   M_UN_NA = UPPER(M_UN_NA)

   seek M_UN_NA

   if .NOT. (EOF() .OR. BOF())
      set color to &FORE/&BACK
      @ 5,15 say "You have selected the following hazardous waste item."

      DESC_1 = H_DESC_1
      DESC_2 = H_DESC_2

      @ 7,10 say DESC_1
      @ 8,10 say DESC_2
      set color to &FORE_OFF/&BACK

      PMT_LINE = 19
      PMT_MSG = "1) This is the correct item  2) Wrong item"
      do PROMPT

      CHOICE = 2
      do GETKEY

      set color to &FORE/&BACK
      @ 5,15
      @ 7,10
      @ 8,10
      @ 19,0
      set color to &FORE_OFF/&BACK

      if CHOICE = 1
         M_CNTNO = "   "

         do while M_CNTNO = "  "
            set color to &FORE/&BACK
            @ 10,15 say "Please enter the number of containers to be shipped."
            @ 12,15 say "number of containers ... " get M_CNTNO picture "999"

            set confirm on

            read
            clear gets

            set confirm off

            set color to &FORE_OFF/&BACK

         enddo

         set color to &FORE/&BACK

         @ 10,15
         @ 12,15

         @ 5,15 say "DM  =  metal drums, barrels, kegs"
         @ 6,15 say "DW  =  wooden drums, barrels, kegs"
         @ 7,15 say "DF  =  fiberboard or plastic drums, barrels, kegs"
         @ 8,15 say "TP  =  tanks portable"
         @ 9,15 say "TT  =  cargo tanks (tank trucks)"
         @ 10,15 say "TC  =  tank cars"
         @ 11,15 say "DT  =  dump trucks"
         @ 12,15 say "CY  =  cylinders"
         @ 13,15 say "CM  =  metal boxes, cartons, cases (including roll-offs)"
         @ 14,15 say "CW  =  wooden boxes cartons cases"
         @ 15,15 say "CF  =  fiber or plastic boxes, cartons, cases"
         @ 16,15 say "BA  =  burlap, cloth, paper or plastic bags"

         set color to &FORE_OFF/&BACK

         store .T. to CONTAINER

         do while CONTAINER

            M_CNTTY = "  "

            do while M_CNTTY = "  "
               set color to &FORE/&BACK
               @ 18,25 say "Enter container type ... " get M_CNTTY picture "AA"

               set confirm on

               read
               clear gets

              set confirm off

              set color to &FORE_OFF/&BACK

            enddo

            set color to &FORE/&BACK
            @ 18,15
            set color to &FORE_OFF/&BACK

            M_CNTTY = UPPER(M_CNTTY)

            do case

               case M_CNTTY = "DM"
                  store .F. to CONTAINER

               case M_CNTTY = "DW"
                  store .F. to CONTAINER

               case M_CNTTY = "DF"
                  store .F. to CONTAINER

               case M_CNTTY = "TP"
                  store .F. to CONTAINER

               case M_CNTTY = "TT"
                  store .F. to CONTAINER

               case M_CNTTY = "TC"
                  store .F. to CONTAINER

               case M_CNTTY = "DT"
                  store .F. to CONTAINER

               case M_CNTTY = "CY"
                  store .F. to CONTAINER

               case M_CNTTY = "CM"
                  store .F. to CONTAINER

               case M_CNTTY = "CW"
                  store .F. to CONTAINER

               case M_CNTTY = "CF"
                  store .F. to CONTAINER

               case M_CNTTY = "BA"
                  store .F. to CONTAINER

               otherwise
                  STAT_LINE = 19
                  STAT_MSG = "SORRY : No such container type as "
                  STAT_MSG = STAT_MSG + M_CNTTY
                  do STATUS

            endcase

         enddo

         do CLRSCRN

         M_QNTY = "   "

         do while M_QNTY = "   "
            set color to &FORE/&BACK
            @ 10,15 say "Please enter the total quantity of waste."
            @ 12,15 say "quantity ... " get M_QNTY picture "99999"

            set confirm on

            read
            clear gets

            set confirm off

            set color to &FORE_OFF/&BACK

         enddo

         set color to &FORE/&BACK
         @ 10,15
         @ 12,15

         @ 7,15 say "G  =  gallons (liquids only)"
         @ 8,15 say "P  =  pounds"
         @ 9,15 say "T  =  tons (2000 lbs)"
         @ 10,15 say "Y  =  cubic yards"
         @ 11,15 say "L  =  liters (liquids only)"
         @ 12,15 say "K  =  kilograms"
         @ 13,15 say "M  =  metric tons (1000 kg)"
         @ 14,15 say "N  =  cubic meters"
         set color to &FORE_OFF/&BACK

         store .T. to UNIT

         do while UNIT

            M_UNIT = " "

            do while M_UNIT = " "
               set color to &FORE/&BACK
               @ 17,20 say "Enter UNIT wt/vol ... " get M_UNIT picture "AA"

               set confirm on

               read
               clear gets

               set confirm off

               set color to &FORE_OFF/&BACK

            enddo

            @ 17,15

            M_UNIT = UPPER(M_UNIT)

            do case

               case M_UNIT = "G"
                  store .F. to UNIT

               case M_UNIT = "P"
                  store .F. to UNIT

               case M_UNIT = "T"
                  store .F. to UNIT

               case M_UNIT = "Y"
                  store .F. to UNIT

               case M_UNIT = "L"
                  store .F. to UNIT

               case M_UNIT = "K"
                  store .F. to UNIT

               case M_UNIT = "M"
                  store .F. to UNIT

               case M_UNIT = "N"
                  store .F. to UNIT

               otherwise
                  STAT_LINE = 19
                  STAT_MSG = "SORRY : No such UNIT as " + M_UNIT
                  do STATUS

            endcase

         enddo

         do CLRSCRN

         PMT_LINE = 19

         PMT_MSG = "1) Save hazardous waste item  2) Throw it away"
         do PROMPT
 
         CHOICE = 2
         do GETKEY

         set color to &FORE/&BACK
         @ 19,0
         set color to &FORE_OFF/&BACK

         if CHOICE = 1

            do case

               case ITEMS = 1
                  M_UN_NA1 = M_UN_NA
                  M_CNTNO1 = M_CNTNO
                  M_CNTTY1 = M_CNTTY
                  M_QNTY1 = M_QNTY
                  M_UNIT1 = M_UNIT

               case ITEMS = 2
                  M_UN_NA2 = M_UN_NA
                  M_CNTNO2 = M_CNTNO
                  M_CNTTY2 = M_CNTTY
                  M_QNTY2 = M_QNTY
                  M_UNIT2 = M_UNIT

               case ITEMS = 3
                  M_UN_NA3 = M_UN_NA
                  M_CNTNO3 = M_CNTNO
                  M_CNTTY3 = M_CNTTY
                  M_QNTY3 = M_QNTY
                  M_UNIT3 = M_UNIT

               case ITEMS = 4
                  M_UN_NA4 = M_UN_NA
                  M_CNTNO4 = M_CNTNO
                  M_CNTTY4 = M_CNTTY
                  M_QNTY4 = M_QNTY
                  M_UNIT4 = M_UNIT

              case ITEMS = 5
                  M_UN_NA5 = M_UN_NA
                  M_CNTNO5 = M_CNTNO
                  M_CNTTY5 = M_CNTTY
                  M_QNTY5 = M_QNTY
                  M_UNIT5 = M_UNIT

              case ITEMS = 6
                  M_UN_NA6 = M_UN_NA
                  M_CNTNO6 = M_CNTNO
                  M_CNTTY6 = M_CNTTY
                  M_QNTY6 = M_QNTY
                  M_UNIT6 = M_UNIT

            endcase

            if ITEMS >= 6
               store .F. to T_HIT

            else
               PMT_LINE = 19
               PMT_MSG = "1) Add another item to the manifest  "
               PMT_MSG = PMT_MSG + "2) Don't add"
               do PROMPT

               CHOICE = 2
               do GETKEY

               set color to &FORE/&BACK
               @ 19,0
               set color to &FORE_OFF/&BACK

               if CHOICE = 1
                  ITEMS = ITEMS + 1

               else
                  store .F. to T_HIT

               endif

            endif

         else
            PMT_LINE = 19
            PMT_MSG = "1) Add another item to the manifest  "
            PMT_MSG = PMT_MSG + "2) Don't add"
            do PROMPT

            CHOICE = 2
            do GETKEY

            set color to &FORE/&BACK
            @ 19,0
            set color to &FORE_OFF/&BACK

            if CHOICE = 2
               store .F. to T_HIT

            endif

         endif

      endif

   else
      STAT_LINE = 19
      STAT_MSG = "No waste found for UN/NA number"
      do STATUS

   endif

enddo

select A
use

return

