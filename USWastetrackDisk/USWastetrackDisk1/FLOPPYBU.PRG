*************************************************************************
*                                                                       *
* FLOPPYBU >>> Permits the backing up of the child data base		*
*	       entry : SRC:FILE - name of file to backup	        *
*	       	       SRC:DRIVE - drive of file to backup              *
*       		       DEST:ROOT - 3 letter root name		*
*       		       ROW:NBR - row to display messages	*
*       		       NBR:PD - number of record per disk	*
*	       exit : None                                              *
*                                                              		*
* (C)opyright 1884 Personal Touch Software Inc.,  All Rights Reserved. 	*
*                                                              		*
*************************************************************************

private SCROLL

select A
SRC_NAME = SRC_DRIVE + SRC_FILE
use &SRC_NAME

goto bottom
NBR_REC = recno()

if NBR_REC < NBR_PD
   NBR_DISK = 1
   LOW_END = 1
   HIGH_END = NBR_REC

else
   NBR_DISK = (NBR_REC / NBR_PD)
   NBR_MOD = (NBR_PD * int(NBR_DISK))

   if NBR_DISK <> NBR_MOD
      NBR_DISK = NBR_DISK + 1
   endif

   TOTAL_DISK = str(NBR_DISK,2)
   LOW_END = 1
   HIGH_END = LOW_END + NBR_PD -1

endif

FLOPPY = "A:BU" + DEST_ROOT + "01"

goto top

store .T. to SCROLL

do while SCROLL
   STAT_LINE = 19
   STAT_MSG = "Please insert " + FLOPPY
   do STATUS

   DEL_FILE = FLOPPY

*!! 'RESET' is no longer valid.
*!!    reset

   if file ("&DEL_FILE")
      PMT_LINE = ROW_NBR
      PMT_MSG = "Deleting floppy file " + FLOPPY
      do PROMPT

      delete file &DEL_FILE

   endif

   COPY_FILE = FLOPPY

   PMT_LINE = ROW_NBR
   PMT_MSG = SRC_NAME + " -> " + COPY_FILE + ", copying records "
   PMT_MSG = PMT_MSG + str(LOW_END,5)+" - "+str(HIGH_END,5)
   do PROMPT

   copy to &COPY_FILE for recno() >= LOW_END .and. recno() <= HIGH_END

   if HIGH_END >= NBR_REC
      store .F. to SCROLL

   else
      LOW_END = HIGH_END + 1
      HIGH_END = LOW_END + (NBR_PD-1)

      if HIGH_END > NBR_REC
	 HIGH_END = NBR_REC
      endif

      NEXTFILE = val(substr("&FLOPPY",8,2))
      NEXTFILE = NEXTFILE + 1
      PART1 = substr("&FLOPPY",1,7)

      if NEXTFILE < 10
	 TEMP_PART = str(NEXTFILE,1)
	 PART2 = "0"+"&TEMP_PART"

      else
	 PART2 = str(NEXTFILE,2)

      endif

      FLOPPY = PART1 + PART2

   endif

enddo

select A
use

return
