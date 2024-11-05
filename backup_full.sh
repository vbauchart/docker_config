#!/bin/bash -xe

exec >  >(ts|tee -ia /var/log/backup.log)
exec 2> >(ts|tee -ia /var/log/backup.log >&2)


BACKUP_DIR=/home/vincent/backup

tar czvf "$BACKUP_DIR/home.tar.gz" \
	--exclude="$BACKUP_DIR" \
       	--exclude=/home/vincent/downloads \
	--exclude=/home/vincent/docker/nextcloud \
	--exclude=/home/vincent/encfs* \
	--exclude=/home/vincent/gocryptfs* \
	--exclude='/home/vincent/docker/influxdb*' \
	--exclude=/home/vincent/docker/prometheus \
	--exclude=/home/swapfile \
	--exclude='/home/vincent/docker/postgres*' \
	--one-file-system \
	/home/

docker compose -f /srv/docker_config/docker-compose.yaml exec -u postgres database pg_dumpall | gzip >$BACKUP_DIR/database_backup.sql.gz

tar czvf $BACKUP_DIR/vaultwarden.tar.gz /home/vincent/docker/vaultwarden

tar czvf $BACKUP_DIR/docker-compose.tar.gz /home/docker/build/

source "$(dirname $(readlink -f "$0"))/backup.env"

HOST=$(hostname)

restic snapshots --host $HOST

restic backup "$BACKUP_DIR"

restic check
restic forget --host $HOST --keep-last 5 --prune

restic snapshots
