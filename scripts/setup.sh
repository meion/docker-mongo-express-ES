#!/bin/bash

mongodb=$(getent hosts ${MONGO} | awk '{ print $1 }')


port=${PORT:-27017}

echo "Waiting for startup.."
until mongo --host ${mongodb}:${port} --eval 'quit(db.runCommand({ ping: 1 }).ok ? 0 : 2)' &>/dev/null; do
  printf '.'
  sleep 1
done

echo "Started.."
echo "setup.sh; time now: $(date +"%T")"

mongo --host ${mongodb}:${port} <<EOF
    use admin
    db.createUser(
        {
            user: ${USER},
            pwd: #{pwd},
            roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]
        }
    )
EOF

mongo --host ${mongodb}:${port} <<EOF
   var cfg = {
        "_id": "${RS}",
        "members": [
            {
                "_id": 0,
                "host": "${mongodb}:${port}"
            }
        ]
    };
    rs.initiate(cfg, { force: true });
    rs.config();
EOF
