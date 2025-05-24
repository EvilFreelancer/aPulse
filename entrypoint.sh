#!/bin/bash
set -e

STATUS_FILE=$(node -e "
  const fs = require('fs');
  const path = require('path');

  const configRaw = fs.readFileSync('./config.js', 'utf8');
  const match = configRaw.match(/statusFile\s*:\s*['\"](.*?)['\"]/);
  const result = match ? match[1] : './static/status.json';
  console.log(result);
")

STATUS_DIR=$(dirname "$STATUS_FILE")

if [ "$STATUS_DIR" != "./static" ]; then
  echo "Copying static files to: $STATUS_DIR"
  mkdir -p "$STATUS_DIR"
  cp -r static/* "$STATUS_DIR"
else
  echo "statusFile is in ./static; skipping copy."
fi

exec node watcher.js
