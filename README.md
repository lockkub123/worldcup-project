World Cup Project

This project is part of the FreeCodeCamp Relational Database Certification. It involves creating, managing, and querying a PostgreSQL database containing data on World Cup matches from 2014 and 2018.

Project Overview

The main objective of this project is to create a database named worldcup that contains information about matches, teams, and results of World Cup games. You will use SQL to insert data and create queries that match expected outputs.

Files Included:

games.csv: Contains the match data (year, round, teams, goals).

insert_data.sh: A shell script to insert data from games.csv into the database.

queries.sh: A shell script to execute queries on the database and match the output to the requirements.

worldcup.sql: Contains the SQL dump of the database structure and data for the project.

expected_output.txt: Provides the expected output for specific queries to ensure accuracy.

How to Use

Create Database: Connect to PostgreSQL and create the worldcup database.

Insert Data: Run insert_data.sh to insert match data into the database.

Query the Database: Use queries.sh to query the database and verify the results with expected_output.txt.

Testing: The project can be tested using worldcuptest as a separate test database.

Requirements

Ensure PostgreSQL is installed and configured properly. All necessary SQL commands are executed using shell scripts for automated insertion and query.

Running Scripts

Make sure both insert_data.sh and queries.sh have executable permissions by running:

chmod +x insert_data.sh queries.sh

To run each script:

./insert_data.sh
./queries.sh

Notes

Make sure to use the correct username for PostgreSQL (e.g., freecodecamp or postgres).

The database must match the required structure and contain accurate data to pass all tests on FreeCodeCamp.

