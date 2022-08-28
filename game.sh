#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=game -t --no-align -c"
NUMBER_TO_GUESS=$(( RANDOM % 1000 + 1 ))
echo "Enter your username:"
MAIN_MENU(){
  if [[ $1 ]]
  then 
    echo "$1"
  fi
  read USERNAME
  if [[ -z $USERNAME ]]
  then
    MAIN_MENU "Please enter a valid username!"
  else
    USER_RESULT=$($PSQL "SELECT * FROM users_info WHERE username='$USERNAME'")
    if [[ -z $USER_RESULT ]]
    then
      echo "Welcome, "$USERNAME"! It looks like this is your first time here."
      USERNAME_UPDATE=$($PSQL "INSERT INTO users_info(username) VALUES('$USERNAME')")
    else
      echo $USER_RESULT | while IFS="|" read ID USERNAME BG GP
      do
        echo "Welcome back, "$USERNAME"! You have played "$GP" games, and your best game took "$BG" guesses."
      done
    fi
    GAME $USERNAME
  fi
}



GAME() {
    USERNAME=$1
    echo "Guess the secret number between 1 and 1000:"
    read NUM_GUESSED
    until [[ $NUM_GUESSED =~ ^[0-9]+$ ]]
    do
      echo "That is not an integer, guess again:"
      read NUM_GUESSED
    done
    GP=$($PSQL "SELECT games_played FROM users_info WHERE username='$USERNAME'")
    until [[ $NUM_GUESSED -eq $NUMBER_TO_GUESS ]]
    do
      if [[ $NUM_GUESSED -gt $NUMBER_TO_GUESS ]]
      then 
        echo "It's lower than that, guess again:"
        read NUM_GUESSED
        BG=$(( $BG + 1 ))
      elif [[ $NUM_GUESSED -lt $NUMBER_TO_GUESS ]]
      then
        echo "It's higher than that, guess again:"
        read NUM_GUESSED
        BG=$(( $BG + 1 ))
      fi
    done
    BG=$(( $BG + 1 ))
    GP=$(( $GP + 1 ))
    echo "You guessed it in "$BG" tries. The secret number was "$NUMBER_TO_GUESS". Nice job!"
    UPDATE_GAME_GP=$($PSQL "UPDATE users_info SET games_played=$GP WHERE username='$USERNAME'")
    BG_IN_DB=$($PSQL "SELECT best_game FROM users_info WHERE username='$USERNAME'")
    if [[ ($BG -lt $BG_IN_DB && $BG_IN_DB) || (-z  $BG_IN_DB) ]]
    then
      UPDATE_GAME_BG=$($PSQL "UPDATE users_info SET best_game=$BG WHERE username='$USERNAME'")
    fi
}

MAIN_MENU

