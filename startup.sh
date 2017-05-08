#!/bin/sh
echo "Starting NFS Server"

rpcbind
rpc.statd
rpc.nfsd

echo "Started"

exec rpc.mountd --foreground
# echo "Done all tasks - Running continious loop to keep this container alive"
# while true; do
#   sleep 3600
# done
