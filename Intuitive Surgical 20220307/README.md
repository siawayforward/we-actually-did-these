# Instructions

For this project, the following steps were completed to fulfill design of a PostgreSQL database, and a process to backup and restore a database instance.

## Designing Database

After reviewing [this video](https://www.youtube.com/watch?v=lgDgcLI2B0U) and page for the Wingspan game, I had some idea of what to start with when designing the database. These are the tables I came up with:

- `bird`: defining attributes of the bird
- `card_asset`: attributes of each bird card, where card data is uploaded to (initially, I made this table to have a foreign key for the `bird_id` because of which comes first - chicken or the egg? But then switched the bird table to have the foreign key for `card_id` so that it is defined with the bird and then set on the card assets table as a unique identifier. The tradeoff here is that you have to update both at the same time. Given the size of both tables and the 1:1 relationship (designed the bird keys as unique IDs as well), this would not happen often and only once in a while if the game creator decides to change the cards and rules of the game)
- `user`: players of the game
- `player_game`: game events for each round and player
- `egg`: the value and color assigned to each egg token
- `food`: the attributes and value of each food token
- `habitat`: the bird locations (this was initially not defined. I initially chose to make it an `enum` because the locations are not likely to change between the three options. However, we're following the DB design specifications outlined in the question).

These tables and notes are all saved [here](https://github.com/siawayforward/we-actually-did-these/blob/main/Intuitive%20Surgical%2020220307/1-%20DB%20Design%20and%20Assumptions.xlsx)

## Actual Database

From the above, I created a postgreSQL instance (of which the creation script is attached). This was mainly so that when designing the queries, it was more tangible and I could test all the joins. There are two files:

- [wingspan](https://github.com/siawayforward/we-actually-did-these/blob/main/Intuitive%20Surgical%2020220307/wingspan_20220308.sql): demonstrates how you can restore/recreate the database
- [bird](https://github.com/siawayforward/we-actually-did-these/blob/main/Intuitive%20Surgical%2020220307/bird_table_20220308.sql): demonstrates table creation, most of which is accounted for in the first script

## Query and View Design

As mentioned above, the actual instance was helpful for me to design the queries. Something I want to note here is schema specification. I ran these from the `public` schema that every postgreSQL DB is created with. The queries may need to be changed to add `public.` before the field name e.g. for `SELECT bird FROM table;`, the change would be `SELECT public.bird FROM table;`.

- The queries to design a player game points view and answering the questions presented are in [this file](Intuitive Surgical 20220307/2 - DB Views and Queries.txt)

## Backup and Restore Script

Next was to design a script that would backup and restore the database (or a portion of it) on a schedule. I chose to use a shell script because it required the least amount of work given the timeline of the exercise. It is a very general script that leverages `psql` command line actions to dump and restore the database (or tables or form of writing tables) into a dump or sql file. [Here](https://github.com/siawayforward/we-actually-did-these/blob/main/Intuitive%20Surgical%2020220307/backup_and_restore_db.sh) is the script

I also wanted to point out some arguments that may be useful to add for security and depending on the server an instance is being run/changed/manipulated from. These are all below. The main ones are usually required (username, password, host). However, if already in a role that has admin access or a localhost (like I was in), then you can work with the `--no-password` argument

```sh
--host "localhost" --port "5432" --username "postgres" --no-password --verbose --format=c --blobs --schema-only --create --clean --inserts --column-inserts --load-via-partition-root "wingspan_game"
```

The shell file would be scheduled to run from a crontab file. The parts of the command are broken down in [this text file](https://github.com/siawayforward/we-actually-did-these/blob/main/Intuitive%20Surgical%2020220307/3%20-%20scheduled_job_command.txt). The TLDR version below:

```sh
# open a file in terminal and edit to add the below (crontab -e to create and edit)
$ 0 0 * * /home/$user/db_store_dir/var/lib/backup_and_restore_db.sh
```

Once this is set, the script would run everyday at midnight and save a log entry.

## API Design

For this last question, I decided not to attempt it because even though I know how to use and make small APIs, it is not my area of expertise. So in a way, thank you for making it optional.
