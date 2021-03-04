(defun pa4-con (pdfname-con)
  (setq p1 (getpoint "\n인쇄영역을 선택하세요... : "))
  (setq p2 (getcorner p1 "\n인쇄영역모서리 서택하세요... : "))
  (setq p1x (car p1))
  (setq p1y (cadr p1))
  (setq p2x (car p2))
  (setq p2y (cadr p2))
  (setq p2x-val (abs (- p2x p1x)))
  (setq p2y-val (abs (- p2y p1y)))
  (setq PATH "d:\\pdf\\")	;;; pdf파일 저장 위치 현재는 c:\pdf 폴더임. 폴더 없을 경우는 만드세요.
  (setq path-pdfname-con (strcat PATH pdfname-con ".pdf"))

  (if (> p2x-val p2y-val)
    (setq p-orientation "L")
    (setq p-orientation "P"))
  

    (command
    "-PLOT"
    "Y"
    ""
    "AutoCAD PDF (General Documentation).pc3"
    "ISO 확장 A4 (210.00 x 297.00 mm)"
    "M"
    p-orientation
    "N"
    "W"
    p1
    p2
    "F"
    "C"
    "Y"
    "monochrome.ctb"
    "Y"
    "A"
    path-pdfname-con
    "N"
    "Y"
    )
)

(defun c:my_plot ()

  (setvar "cmdecho" 0)//

  (setq pdfname  1)
  (setq oldosmode (getvar "osmode"))
  (setvar "osmode" 1)
  (setq ans "y")

  (while (not (= ans "q"))
         (pa4-con (itoa pdfname))
         (setq pdfname (1+ pdfname))
         (setq ans (getstring "\n종료는 : q"))
    )

  (setvar "osmode" oldosmode)
)
