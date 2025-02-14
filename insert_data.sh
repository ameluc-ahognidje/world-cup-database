#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS 
  do
    if [[ $YEAR != "year" ]]
    then
      TEAM_ID_WINNER=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
      TEAM_ID_OPPONENT=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
      if [[ -z $TEAM_ID_WINNER ]]
      then
        INSERTION=$($PSQL "INSERT INTO teams (name) VALUES ('$WINNER')")
        if [[ $INSERTION == "INSERT 0 1" ]]
        then
          echo Inserted into name: $WINNER
        fi
      elif [[ -z $TEAM_ID_OPPONENT ]]
      then
        INSERTION=$($PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT')")
        if [[ $INSERTION == "INSERT 0 1" ]]
        then
          echo Inserted into name: $OPPONENT
        fi
      fi
    fi
done

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS 
  do
    if [[ $YEAR != "year" ]]
    then
      TEAM_ID_WINNER=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
      TEAM_ID_OPPONENT=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
      GAME_ID=$($PSQL "SELECT game_id FROM games WHERE year=$YEAR AND round='$ROUND' AND winner_id=$TEAM_ID_WINNER AND opponent_id=$TEAM_ID_OPPONENT")
      if [[ -z $GAME_ID ]]
      then
        GAME_INSERTION=$($PSQL "INSERT INTO games (year, round, winner_id, winner_goals, opponent_id, opponent_goals) VALUES ($YEAR, '$ROUND', $TEAM_ID_WINNER, $WINNER_GOALS, $TEAM_ID_OPPONENT, $OPPONENT_GOALS)")
        if [[ $GAME_INSERTION == "INSERT 0 1" ]]
        then
          echo Inserted into year, round, winner_goals, opponent_goals: $YEAR, $ROUND, $WINNER_GOALS, $OPPONENT_GOALS
        fi
      fi
    fi
done
