#!/bin/bash
set -e
STATUS_FILE=$(node - <<'NODE'
import config from './config.js';
console.log(config.statusFile || './static/status.json');
NODE
)
ESC_PATH=$(printf '%s\n' "$STATUS_FILE" | sed 's/[&/]/\\&/g')
sed -i -E "s|(fetch\(['\"])(\.\/status\.json)(['\"])|\1${ESC_PATH}\3|" static/client.js
exec node watcher.js

