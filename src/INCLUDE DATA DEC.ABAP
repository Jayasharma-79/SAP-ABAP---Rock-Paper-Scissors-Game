*&---------------------------------------------------------------------*
*& Include          ZJS_RPS_DATA
*&---------------------------------------------------------------------*

DATA: user_choice   TYPE i,
      system_choice TYPE qf00-ran_int,
      result        TYPE string,
      text_title    TYPE string,
      text_vs       TYPE string,
      lv_title      TYPE string.

TYPES: BEGIN OF ty_choice,
         s_no   TYPE i,
         choice TYPE char20,
       END OF ty_choice.

DATA: lt_choices TYPE TABLE OF ty_choice,
      lv_choice1 TYPE ty_choice,
      lv_choice2 TYPE ty_choice.
