#!/bin/bash
set -x;

/bin/bash /entrypoint.sh mysqld > /dev/null 2>&1 &

# Remove a potentially pre-existing server.pid for Rails.
rm -f /backend/tmp/pids/server.pid

# start rails server
rails server -p 8000 -b 0.0.0.0