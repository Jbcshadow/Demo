FUNCTION z106_material_select.
*"----------------------------------------------------------------------
*"*"本地接口：
*"  IMPORTING
*"     VALUE(I_MATERIAL) TYPE  MATNR
*"  EXPORTING
*"     VALUE(R_MAKTX) TYPE  MAKTX
*"     VALUE(R_MESSAGE) TYPE  MSGTX
*"----------------------------------------------------------------------

DATA:l_matnr TYPE matnr,
     l_maktx TYPE maktx,
     l_message TYPE msgtx.


IF i_materiaL IS NOT INITIAL.
  l_matnr = i_material.
CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
  EXPORTING
    input         = l_matnr
 IMPORTING
   output        = l_matnr.

SELECT SINGLE maktx INTO l_maktx FROM makt
  WHERE matnr = l_matnr
  AND spras = '1'.
  IF sy-subrc EQ 0 AND l_maktx IS NOT INITIAL.
    r_maktx = l_maktx.
    r_message = '成功'.
   ELSE.
     r_message = '失败'.
  ENDIF.


ENDIF.




ENDFUNCTION.
