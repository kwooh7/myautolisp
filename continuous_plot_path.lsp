(defun pa4-con (pdfname-con)
  (setq p1 (getpoint "\n�μ⿵���� �����ϼ���... : "))
  (setq p2 (getcorner p1 "\n�μ⿵���𼭸� �����ϼ���... : "))
  (setq p1x (car p1))
  (setq p1y (cadr p1))
  (setq p2x (car p2))
  (setq p2y (cadr p2))
  (setq p2x-val (abs (- p2x p1x)))
  (setq p2y-val (abs (- p2y p1y)))
  (setq today_date (dater))
  (setq PATH "d:\\pdf\\")
;;; pdf���� ���� ��ġ ����� d:\pdf ������. ���� ���� ���� ���弼��.
  (setq path-pdfname-con (strcat PATH today_date pdfname-con ".pdf"))

  (if (> p2x-val p2y-val)
    (setq p-orientation "L")
    (setq p-orientation "P")
  )


  (command
    "-PLOT"		 "Y"		      ""
    "AutoCAD PDF (General Documentation).pc3"
    "ISO Ȯ�� A4 (210.00 x 297.00 mm)"	      "M"
    p-orientation	 "N"		      "W"
    p1			 p2		      "F"
    "C"			 "Y"		      "monochrome.ctb"
    "Y"			 "A"		      path-pdfname-con
    "N"			 "Y"
   )
)

(defun dater ()
	(setq d (rtos (getvar "CDATE") 2 6)
		yr (substr d 3 2)
		mo (substr d 5 2)
		day (substr d 7 2)
	)

     (strcat yr "_" mo "_" day "_")
)


(defun c:my_plot ()

  (setvar "cmdecho" 0)

  (setq pdfname 1)
  (setq oldosmode (getvar "osmode"))
  (setvar "osmode" 1)
  (setq ans "Yes") 

  (while (= ans "Yes")
    
    (pa4-con (itoa pdfname))
    (setq pdfname (1+ pdfname))
    (initget 1 "Yes No")
    (setq ans (getkword "Type <Yes/No>: "))
  )

  (setvar "osmode" oldosmode)
)
