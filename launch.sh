#!/usr/bin/env bash

set -eo pipefail

APP_DIR=/opt/corekeeper
LOG_DIR=/var/log/corekeeper
ID_FILE=GameID.txt
START_TIME=$(date -Iseconds)

cd "$APP_DIR/steam"

if [ -f "$ID_FILE" ]; then
    rm "$ID_FILE"
fi

Xvfb :99 -screen 0 1x1x24 -nolisten tcp &

DISPLAY=:99 LD_LIBRARY_PATH="$LD_LIBRARY_PATH:linux64" \
    ./CoreKeeperServer \
    -batchmode \
    -logfile "$LOG_DIR/${START_TIME}.log" &

COREKEEPER_PID=$!

while [ ! -f "$ID_FILE" ]; do
    sleep 0.1
done

GAME_ID=$(cat "$ID_FILE")
echo "Started CoreKeeper server with game ID $GAME_ID"

wait $COREKEEPER_PID
