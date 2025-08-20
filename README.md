# World Cup Database

A script that enters information from World Cup games into PostgreSQL, then query the database for useful statistics.

## Stack
- PostgreSQL,
- Shell

## Prerequisites
You need to have [PostgreSQL](https://www.postgresql.org) installed on your device.

## Functionalities
- Generate the database,
- Update the database with dats,
- Query different informations from the database

## Installation
1. Open a terminal and clone this repo with the command: `git clone https://github.com/ameluc-ahognidje/world-cup-database.git`,
2. Then use this command to go in the cloned folder: `cd world-cup-database`,
3. Open another terminal process or tab:
   - Import the database dump with `psql -U postgres -d worldcup -f path-to-file/worldcup.sql`,
   - Connect/launch the postgre/the database
5. Make the scripts executable with the command `chmod +x ./script-name.sh`,
6. You can now run the script with `./script-name.sh` and follow the intructions.

## About
I made this project as part of my [freeCodeCamp](https://www.freecodecamp.org/certification/ameluc/relational-database-v8) curriculum and thanks to it I learned:
- how shell scripting,
- how to work with a database of type SQL,
- how to communicate with such database from the terminal

## Updates
I have to make the script more flexible for example by asking for user credential and such because for now it is tied to the user I made it with.

## Licence
This project is under the MIT Licence - see [LICENSE](LICENSE)
