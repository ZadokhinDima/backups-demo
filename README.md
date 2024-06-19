# Comparison of different backup strategies

A bookstore postgres database is populated by python script. Every minute a new randomly generated book is created and sent to bookstore.

Other scripts will perform backups every hour using different kinds of repository models: 
- Full
- Incremental
- Differential
- Reverse Delta
- CDP

## Full backup

The simplest repository type. Every 10 minutes a script will save a full database dump to the disc with corresponding name.
We have ability to recover from any snapshot and it is relatively quick operation as only one dump file is executed. Also this method is failsafe as it is very easy to recover from snapshot.

The downside of this method is storage required. For each snapshot we have a full backup file which causes a great redundancy if difference between snapshots is not too big.

In my case a full backup had size ~ 5 MB. Which requires *5\*6=30* MB per hour.

Cron configuration: 
```
0/10 * * * * /Users/dimonster/Desktop/projector/backups-demo/full_backup.sh
```

## Other types

Creating a diff sql using postgres tools is harder then full bachup. 

I created other types of backups using pgbackrest tool.

## Incremental
The main advantage of this backup type is storage size. The full backup was created only once per hour and each 10 minutes only small diff was created.

On the other hand it is harder to rollback system to one of this incremental states. I needed to execute 6 sql files to rollback to a state at 50 minutes. 


## Differential

Now to any rollback I needed to execute 2 sql files: hourly full backup + diff backup. On the other hand diff backups are slightly bigger then in previous mode.

## Reverse Delta

Similar to incremental but now it is easier to rollback to states which are closer to current moment.

## CDP

I can rollback to any point in time which was not available in other methods.