#! /bin/bash

psql -U ${user} pg_dump wingspan_game > wingspan_backup_$datetime.dump

# display date for backup once complete and save to log file
echo "back up complete for "+date > backup_restore.log

# restore db to read versions for games table
psql -U ${user} pg_restore -a -d wingspan_game -t player_game < wingspan_backup_$datetime.dump

# display log note once restored and save to log file
echo "player games table restored for "+date > backup_restore.log