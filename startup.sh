#!/bin/sh -eu

# echo "Starting NFS Server"

# rpcbind
# rpc.statd
# rpc.nfsd

# echo "Started"

# exec rpc.mountd --foreground
# # echo "Done all tasks - Running continious loop to keep this container alive"
# # while true; do
# #   sleep 3600
# # done
/usr/sbin/exportfs -r
/sbin/rpcbind --
# /usr/sbin/rpc.statd
/usr/sbin/rpc.nfsd |:
/usr/sbin/rpc.mountd -F