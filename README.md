# Comparison of different backup strategies

A bookstore postgres database is populated by python script. Every minute a new randomly generated book is created and sent to bookstore.

Other scripts will perform backups every hour using different kinds of repository models: 
- Full
- Incremental
- Differential
- Reverse Delta
- CDP

## Full backup
The simplest repository type. Every hour a script will save a full database dump to the disc with corresponding name.
## Incremental
## Differential
## Reverse Delta
## CDP

## Comparison

After 48 hours all repository models are compared.

| Repository Model | Size | Ability to Roll Back at Specific Time Point | Speed of Roll Back | Cost |
|------------------|------|---------------------------------------------|--------------------|------|
| Full             |      |                                             |                    |      |
| Incremental      |      |                                             |                    |      |
| Differential     |      |                                             |                    |      |
| Reverse Delta    |      |                                             |                    |      |
| CDP              |      |                                             |                    |      |