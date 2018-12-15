*************************************************************************
*  									*
* READWAST >>> Read waste file at current record                        *
*	     entry : current record                                     *
*	     exit : current record variables                            *
*									*
*************************************************************************

W_TSD = W_W_TSD
W_COMPNY = W_W_COMPNY
W_ADDR = W_W_ADDR
W_CITY = W_W_CITY
W_STATE = W_W_STATE
W_ZIP = W_W_ZIP
W_ZIP = substr(W_ZIP,1,5) + "-" + substr(W_ZIP,6,4)
W_PHONE = W_W_PHONE
W_PHONE = substr(W_PHONE,1,3) + "-" + substr(W_PHONE,4,3) + "-" + substr(W_PHONE,7,4)
W_CONTCT = W_W_CONTCT

return
