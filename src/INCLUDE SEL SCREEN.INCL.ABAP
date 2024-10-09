*&---------------------------------------------------------------------*
*& Include          ZJS_RPS_SCREEN
*&---------------------------------------------------------------------*

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME.

  SELECTION-SCREEN COMMENT 37(30) TEXT-001.
  SELECTION-SCREEN SKIP 1.
  SELECTION-SCREEN COMMENT 40(14) TEXT-002.

SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME.

  SELECTION-SCREEN PUSHBUTTON 20(10) p_rock USER-COMMAND rock.
  SELECTION-SCREEN PUSHBUTTON 40(10) p_paper USER-COMMAND paper.
  SELECTION-SCREEN PUSHBUTTON 60(10) p_sci USER-COMMAND scissor.

SELECTION-SCREEN END OF BLOCK b2.

INITIALIZATION.
  " Assign text to pushbuttons
  p_rock = 'Rock'.
  p_paper = 'Paper'.
  p_sci = 'Scissors'.

  REFRESH : lt_choices.

  lv_choice1-s_no = 1.
  lv_choice1-choice = 'Rock'.
  APPEND lv_choice1 TO lt_choices.

  lv_choice1-s_no = 2.
  lv_choice1-choice = 'Paper'.
  APPEND lv_choice1 TO lt_choices.

  lv_choice1-s_no = 3.
  lv_choice1-choice = 'Scissors'.
  APPEND lv_choice1 TO lt_choices.
