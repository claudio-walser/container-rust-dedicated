#!/bin/bash

# Enable debugging
# set -x

# Print the user we're currently running as
echo "Running as user: $(whoami)"

# install rust dedicated server
steamcmd +runscript /app/install.txt

# install oxide
# Check if Oxide is enabled
if [ "$RUST_OXIDE_ENABLED" = "1" ]; then
	. /app/oxide-install.sh
fi


# Set the working directory
cd /steamcmd/rust

# Run the server
echo "Starting RustDedicated"
printenv
/steamcmd/rust/RustDedicated \
	-batchmode -load +server.secure 1 \
	+server.ip 0.0.0.0 \
	+server.port $RUST_SERVER_PORT \
	+server.tickrate $RUST_SERVER_TICKRATE \
	+server.hostname $RUST_SERVER_NAME \
	+server.identity $RUST_SERVER_IDENTITY \
	+server.seed $RUST_SERVER_SEED \
	+server.maxplayers $RUST_SERVER_MAXPLAYERS \
	+server.worldsize $RUST_SERVER_WORLDSIZE \
	+server.saveinterval $RUST_SERVER_SAVE_INTERVAL \
	+rcon.ip 0.0.0.0 \
	+rcon.port $RUST_RCON_PORT \
	+rcon.password $RUST_RCON_PASSWORD

exit 0
