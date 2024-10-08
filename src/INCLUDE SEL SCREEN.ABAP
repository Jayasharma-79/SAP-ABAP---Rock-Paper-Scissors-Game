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

  lv_choice1-s_no = 1.
  lv_choice1-choice = 'Rock'.
  APPEND lv_choice1 TO lt_choices.

  lv_choice1-s_no = 2.
  lv_choice1-choice = 'Paper'.
  APPEND lv_choice1 TO lt_choices.

  lv_choice1-s_no = 3.
  lv_choice1-choice = 'Scissors'.
  APPEND lv_choice1 TO lt_choices.

AT SELECTION-SCREEN.

  CASE sy-ucomm.
    WHEN 'ROCK'.
      user_choice = 1.
      PERFORM output.
    WHEN 'PAPER'.
      user_choice = 2.
      PERFORM output.
    WHEN 'SCISSOR'.
      user_choice = 3.
      PERFORM output.
  ENDCASE.

FORM output .
  CALL FUNCTION 'QF05_RANDOM_INTEGER'
    EXPORTING
      ran_int_max   = 3
      ran_int_min   = 1
    IMPORTING
      ran_int       = system_choice
    EXCEPTIONS
      invalid_input = 1
      OTHERS        = 2.
  IF sy-subrc <> 0.
    MESSAGE 'Error Occured' TYPE 'E'.
  ENDIF.

  " Determine system's choice
  READ TABLE lt_choices INTO lv_choice1 INDEX system_choice.

  IF sy-subrc = 0.
    READ TABLE lt_choices INTO lv_choice2 INDEX user_choice.

    IF sy-subrc = 0.
      CASE user_choice.
        WHEN 1.                          " User chose Rock
          IF system_choice = 1.
            result = 'Draw'.
          ELSEIF system_choice = 2.
            result = 'System wins! (Paper covers Rock)'.
          ELSE.
            result = 'You win! (Rock crushes Scissors)'.
          ENDIF.
        WHEN 2.                          " User chose Paper
          IF system_choice = 1.
            result = 'You win! (Paper covers Rock)'.
          ELSEIF system_choice = 2.
            result = 'Draw'.
          ELSE.
            result = 'System wins! (Scissors cut Paper)'.
          ENDIF.
        WHEN 3.                          " User chose Scissors
          IF system_choice = 1.
            result = 'System wins! (Rock crushes Scissors)'.
          ELSEIF system_choice = 2.
            result = 'You win! (Scissors cut Paper)'.
          ELSE.
            result = 'Draw'.
          ENDIF.
        WHEN OTHERS.
          result = 'You did not choose any of rock, paper and scissor.'.
      ENDCASE.

    ENDIF.

  ENDIF.

  CALL SCREEN '2000'. "calling output screen

ENDFORM.
