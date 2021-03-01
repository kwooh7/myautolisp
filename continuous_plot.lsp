(defun pa4-con (pdfname-con)
  (setq p1 (getpoint "\n�μ⿵���� �����ϼ���... : "))
  (setq p2 (getcorner p1 "\n�μ⿵���𼭸� �����ϼ���... : "))

    (command
    "-PLOT"
    "Y"
    ""
    "AutoCAD PDF (General Documentation).pc3"
    "ISO Ȯ�� A4 (210.00 x 297.00 mm)"
    "M"
    "L"
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
    pdfname-con
    "N"
    "Y"
    )
)

(defun c:my_plot ()

  (setq pdfname  1)
  (setq oldosmode (getvar "osmode"))
  (setvar "osmode" 1)
  (setq ans "y")

  (while (not (= ans "q"))
         (pa4-con (itoa pdfname))
         (setq pdfname (1+ pdfname))
         (setq ans (getstring "\n����� : q"))
         )

  (setvar "osmode" oldosmode)
  )
