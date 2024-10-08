# SAP-ABAP---Rock-Paper-Scissors-Game

This is a simple Rock, Paper, Scissors game built using SAP ABAP. It allows the user to select either Rock, Paper, or Scissors, and the system randomly selects an option as well. The result of the match is then displayed (win, lose, or draw).

## Features
- User can choose from Rock, Paper, or Scissors using buttons.
- The system randomly selects an option.
- The result is displayed after every selection.
- Simple ABAP coding practices are demonstrated, such as working with internal tables, random number generation, and selection screen events.
   
## Screens
Main Screen (Selection Screen): Allows the user to pick Rock, Paper, or Scissors via pushbuttons.
Output Screen: Displays the result of the game.

## How it works
- User's choice is captured via the pushbuttons.
- The system randomly picks one of the three choices.
- The result is determined based on the rules of the Rock, Paper, Scissors game.
- The result (win, lose, or draw) is displayed on the output screen.

## File Structure
### Main program for the Rock, Paper, Scissors game
- ZJS_RPS
### Includes:
- ZJS_RPS_DATA: Contains the internal tables, types, and data variables.
- ZJS_RPS_SCREEN: Contains the selection screen setup and buttons for Rock, Paper, and Scissors.
- ZJS_RPS_EVENTS: Contains the screen events handling, including the button clicks and screen transitions.

## Sample Case
User clicks on the "Rock" button.
<img width="791" alt="image" src="https://github.com/user-attachments/assets/64d198f3-9f28-4fe8-ace7-e8c01575d8d0">

System randomly selects: "Scissors."
<img width="544" alt="image" src="https://github.com/user-attachments/assets/bbe28b01-6cbd-4452-8c22-8f9c289b1050">

Result will be displayed as :
"You win! (Rock crushes Scissors)"

## Thanks!!
