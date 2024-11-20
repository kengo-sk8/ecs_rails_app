#!/bin/bash
set -e

rm -rf /web1/tmp/{pids,sockets}

mkdir -p /web1/tmp/{pids,sockets}

exec "$@"
