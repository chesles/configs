if exists("did_load_filetypes") 
  finish 
endif 
augroup filedetect 
  " DrRacket language
  au! BufRead,BufNewFile *.rkt  setfiletype racket
	" Kynetx Rule Language (KRL)
	au BufNewFile,BufRead *.krl     setf krl  
augroup END
