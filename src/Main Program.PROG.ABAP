*&---------------------------------------------------------------------*
*& Report ZJS_RPS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zjs_rps.

INCLUDE : zjs_rps_data,
          zjs_rps_screen,
          zjs_rps_events.

CLASS zcl_rps_game DEFINITION.
  PUBLIC SECTION.
    METHODS: play_game
      IMPORTING iv_user_choice TYPE i
      EXPORTING ev_result      TYPE string
                user_choice    TYPE char20
                system_choice  TYPE char20
                result         TYPE string.

    METHODS: generate_random_number
      RETURNING VALUE(rv_random) TYPE i.

  PRIVATE SECTION.
    METHODS: determine_result
      IMPORTING iv_user_choice   TYPE i
                iv_system_choice TYPE i
      EXPORTING ev_result        TYPE string
                user_choice      TYPE char20
                system_choice    TYPE char20.
ENDCLASS.

CLASS zcl_rps_game IMPLEMENTATION.

  METHOD play_game.
    DATA lv_system_choice TYPE i.

    " Generate random system choice using a method
    lv_system_choice = me->generate_random_number( ).

    " Determine the result
    me->determine_result(
      EXPORTING iv_user_choice    = iv_user_choice
                iv_system_choice  = lv_system_choice
      IMPORTING ev_result          = ev_result
                user_choice        = user_choice
                system_choice      = system_choice
    ).
  ENDMETHOD.

  METHOD generate_random_number.

    DATA : lo_ran TYPE REF TO cl_abap_random_int.
    data : lv_seed type i.

    lv_seed = sy-uzeit * 7 .

    CLEAR : rv_random.

    lo_ran = cl_abap_random_int=>create( min  = 1
                                         max  = 3
                                         seed = lv_seed ).
    rv_random = lo_ran->get_next( ).

  ENDMETHOD.

  METHOD determine_result.

    CLEAR : lv_choice1,
            lv_choice2.

    " Get system and user choices
    READ TABLE lt_choices INTO lv_choice1 INDEX iv_system_choice.
    IF sy-subrc = 0.
      system_choice = lv_choice1-choice.
    ENDIF.
    READ TABLE lt_choices INTO lv_choice2 INDEX iv_user_choice.
    IF sy-subrc = 0.
      user_choice = lv_choice2-choice.
    ENDIF.

    " Determine result based on user and system choices
    CASE iv_user_choice.
      WHEN 1. " User chose Rock
        IF iv_system_choice = 1.
          ev_result = 'Draw'.
        ELSEIF iv_system_choice = 2.
          ev_result = 'System wins! (Paper covers Rock)'.
        ELSE.
          ev_result = 'You win! (Rock crushes Scissors)'.
        ENDIF.
      WHEN 2. " User chose Paper
        IF iv_system_choice = 1.
          ev_result = 'You win! (Paper covers Rock)'.
        ELSEIF iv_system_choice = 2.
          ev_result = 'Draw'.
        ELSE.
          ev_result = 'System wins! (Scissors cut Paper)'.
        ENDIF.
      WHEN 3. " User chose Scissors
        IF iv_system_choice = 1.
          ev_result = 'System wins! (Rock crushes Scissors)'.
        ELSEIF iv_system_choice = 2.
          ev_result = 'You win! (Scissors cut Paper)'.
        ELSE.
          ev_result = 'Draw'.
        ENDIF.
      WHEN OTHERS.
        ev_result = 'Invalid choice.'.
    ENDCASE.
    result = ev_result.
  ENDMETHOD.

ENDCLASS.

AT SELECTION-SCREEN.

  CASE sy-ucomm.
    WHEN 'ROCK'.
      user_choice1 = 1.
    WHEN 'PAPER'.
      user_choice1 = 2.
    WHEN 'SCISSOR'.
      user_choice1 = 3.
  ENDCASE.

  DATA(lo_game) = NEW zcl_rps_game( ).

  IF user_choice1 IS NOT INITIAL.
    " Play the game
    lo_game->play_game(
      EXPORTING iv_user_choice     = user_choice1
      IMPORTING ev_result          = lv_result
                user_choice        = user_choice
                system_choice      = system_choice
                result             = result
                ).

    " Call output screen
    CALL SCREEN '2000'.
  ELSE.
    MESSAGE 'User did not choose any option.' TYPE 'E'.
  ENDIF.
