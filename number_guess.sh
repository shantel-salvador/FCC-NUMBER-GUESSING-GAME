#!/bin/bash

# Database connection
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Ask for username
echo "Enter your username:"
read username

# Check if the user exists
user_id=$($PSQL "SELECT user_id FROM users WHERE username='$username'")

if [[ -z $user_id ]]; then
  # New user
  echo "Welcome, $username! It looks like this is your first time here."
  $PSQL "INSERT INTO users(username) VALUES('$username')" > /dev/null
else
  # Existing user
  games_played=$($PSQL "SELECT games_played FROM users WHERE username='$username'")
  best_game=$($PSQL "SELECT best_game FROM users WHERE username='$username'")
  echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
fi

# Generate a random number between 1 and 1000
secret_number=$(( RANDOM % 1000 + 1 ))
number_of_guesses=0

# Start the guessing game
echo "Guess the secret number between 1 and 1000:"
while true; do
  read guess
  if [[ ! $guess =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi
  number_of_guesses=$((number_of_guesses + 1))
  if [[ $guess -lt $secret_number ]]; then
    echo "It's higher than that, guess again:"
  elif [[ $guess -gt $secret_number ]]; then
    echo "It's lower than that, guess again:"
  else
    echo "You guessed it in $number_of_guesses tries. The secret number was $secret_number. Nice job!"
    $PSQL "UPDATE users SET games_played = games_played + 1 WHERE username='$username'" > /dev/null
    if [[ $best_game -eq 0 || $number_of_guesses -lt $best_game ]]; then
      $PSQL "UPDATE users SET best_game = $number_of_guesses WHERE username='$username'" > /dev/null
    fi
    break
  fi
done
