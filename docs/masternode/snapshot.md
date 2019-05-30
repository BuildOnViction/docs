From TomoChain version 1.4.0, TomoChain releases the pruned chaindata https://chaindata.tomochain.com/20190424.tar (see [the announcement](https://medium.com/tomochain/tomochain-client-v1-4-release-announcement-c3f169b5ef03))

Here is the commands to help you run the node with prunned data to save your storage.

```bash
# Login as user that has access to tmn
# Download Tomo's chaindata archive (make sure you have enough disk space available)
wget https://chaindata.tomochain.com/20190424.tar -P /tmp

# Stop your node (for tmn users)
tmn stop
# or in the node folder (for docker-compose users)
docker-compose stop

# Find the name of your volume
docker volume ls

# Remove your node old data
sudo rm -rf /var/lib/docker/volumes/NAME_OF_YOUR_VOLUME/_data/data/tomo/chaindata

# Find the name of your volume
docker volume ls

# Extract the data
cd /tmp
sudo tar xvC /var/lib/docker/volumes/NAME_OF_YOUR_VOLUME/_data/data/tomo/ -f 20190424.tar

# Start your node back(for tmn users)
tmn start
# or in the node folder (for docker-compose users)
docker-compose start

# If you're really running out of space, remove the tar file
# keeping it might be a good idea if you get stuck further before a new snapshot is released
rm /tmp/20190424.tar
```
