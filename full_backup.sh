#!/bin/bash

# Add Docker to the PATH
PATH=/usr/local/bin:$PATH

# Define the name of the PostgreSQL container
POSTGRES_CONTAINER="backups-demo-postgresql-1"

# Define the name of the database
DATABASE_NAME="books"

# Define the output directory for the database dump
OUTPUT_DIR="/Users/dimonster/Desktop/projector/backups-demo/backups/full"

# Generate a timestamp for the database dump filename
TIMESTAMP=$(date +"%Y-%m-%dT%H:%M:%S")

# Run the database dump command
docker exec -t "$POSTGRES_CONTAINER" pg_dump -U postgres "$DATABASE_NAME" > "$OUTPUT_DIR/Full_$TIMESTAMP.sql"

# Check if the database dump was successful
if [ $? -eq 0 ]; then
    echo "Database dump completed successfully."
else
    echo "Database dump failed."
fi