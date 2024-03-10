REMOTE_USER="pi"
REMOTE_HOST="raspberrypi.local"
REMOTE_PASSWORD="raspberry"
REMOTE_PROJECT_DIR="~/my-project" # This directory should be created in raspberry pi to receive the files
MAIN_FILE="main.c"

START_TIME=$(date +%s%3N)
echo "Syncing files with raspberry pi..."

# Sync this directory with raspberry pi REMOTE_PROJECT_DIR
sshpass -p $REMOTE_PASSWORD rsync -r . $REMOTE_USER@$REMOTE_HOST:$REMOTE_PROJECT_DIR

TIME_DIFF=$(echo "scale=3; ($(date +%s%3N) - $START_TIME) / 1000" | bc)
START_TIME=$(date +%s%3N)
echo "> Done in: $TIME_DIFF seconds"
echo "Compiling and running the project in raspberry pi..."
echo "==============================================="

# Compile and run the project in raspberry pi using gcc
sshpass -p $REMOTE_PASSWORD \
    ssh $REMOTE_USER@$REMOTE_HOST \
        "cd $REMOTE_PROJECT_DIR \
        && gcc -o main $MAIN_FILE -l wiringPi\
        && ./main"

END_TIME=$(date +%s%3N)
TIME_DIFF=$(echo "scale=3; ($END_TIME - $START_TIME) / 1000" | bc)
echo "==============================================="
echo "> Done in: $TIME_DIFF seconds"