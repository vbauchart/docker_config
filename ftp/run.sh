#!/bin/bash -e

echo "films:${FILMS_PASSWORD}" |chpasswd

exec vsftpd
