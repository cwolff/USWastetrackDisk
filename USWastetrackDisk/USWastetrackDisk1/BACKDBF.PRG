*************************************************************************
*									*
* BACKDBF >>> Permits the backing up of the child data base		*
*	       entry : None						*
*	       exit : None						*
*									*
* drive a:								*
*    GENERATE.DBF (index on G_G_GID to GIDNBR.NDX)                      *
*    TRANSPRT.DBF (index on T_T_TID to TIDNBR.NDX)                      *
*    WASTE.DBF (index on T_T_TSD to TSDNBR.NDX)                         *
*    MANIFEST.DBF (index on M_M_MID to MIDNBR.NBR)                      *
*    HWASTE.DBF (index on H_UN_NA to HUNNANBR.NDX)                      *
*									*
*    GLOBAL.DBF 							*
*    SYSTEM.DBF (index on SYS_LOGON to SYSLOGON.NDX)			*
*									*
* (C)opyright 1884 Personal Touch Software Inc.,  All Rights Reserved.	*
*									*
*************************************************************************

private CONTINUE

HEAD = "Backup Manifest Data Base" 
L_TAIL = dtoc(date()) 
R_TAIL = "Press 0 to STOP" 
do FRAME

store T.  to CONTINUE 
do while CONTINUE

   MENU_CNT =  2 
   MENU_1 = "Backup data files of Manifest Data Base"
   MENU_2 = "Backup utility files of Manifest Data Base"
   do MENU

   CHOICE = 2
   do GETMKEY

   do case

      case CHOICE = 0
	 store .F. to CONTINUE

      case CHOICE = 1
	 do CLRSCRN

	 L_TAIL = "Backup in progress"
	 R_TAIL = "Do not disturb this process"
	 do TAIL

	 SRC_DRIVE = "A:"
	 SRC_FILE = "GENERATE"
	 DEST_ROOT = "GEN"
	 ROW_NBR = 5
	 NBR_PD = 1000
	 do FLOPPYBU

	 SRC_DRIVE = "A:"
	 SRC_FILE = "TRANSPRT"
	 DEST_ROOT = "TRA"
	 ROW_NBR = 7
	 NBR_PD = 2500
	 do FLOPPYBU

	 SRC_DRIVE = "A:"
	 SRC_FILE = "WASTE"
	 DEST_ROOT = "WAS"
	 ROW_NBR = 9
	 NBR_PD = 2500
	 do FLOPPYBU

	 SRC_DRIVE = "B:"
	 SRC_FILE = "MANIFEST"
	 DEST_ROOT = "MAN"
	 ROW_NBR = 10
	 NBR_PD = 2250
	 do FLOPPYBU

	 SRC_DRIVE = "A:"
	 SRC_FILE = "HWASTE"
	 DEST_ROOT = "HWA"
	 ROW_NBR = 11
	 NBR_PD = 1000
	 do FLOPPYBU

	 STAT_LINE = 19
	 STAT_MSG = "Backup of data files is complete"
	 do STATUS

	 do CLRSCRN

	 L_TAIL = dtoc(date())
	 R_TAIL = "Press 0 to STOP"
	 do TAIL

     case CHOICE = 2
	 do CLRSCRN

	 L_TAIL = "Backup in progress"
	 R_TAIL = "Do not disturb this process"
	 do TAIL

	 SRC_DRIVE = "A:"
	 SRC_FILE = "GLOBAL"
	 DEST_ROOT = "GBL"
	 ROW_NBR = 7
	 NBR_PD = 1000
	 do FLOPPYBU

	 SRC_DRIVE = "A:"
	 SRC_FILE = "SYSTEM"
	 DEST_ROOT = "SYS"
	 ROW_NBR = 9
	 NBR_PD = 1000
	 do FLOPPYBU

	 STAT_LINE = 19
	 STAT_MSG = "Backup of utiltiy files is complete"
	 do STATUS

	 do CLRSCRN

	 L_TAIL = dtoc(date())
	 R_TAIL = "Press 0 to STOP"
	 do TAIL

   endcase

enddo

return
