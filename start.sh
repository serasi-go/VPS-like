#!/bin/bash

# Go to app directory
#cd /home/railway/app

# Start your app (bot/server)
npm start &

# Start VS Code (main UI)
code-server --bind-addr 0.0.0.0:3000 \
  --auth password \
  --password railway &

# Optional terminal (may not be accessible)
ttyd -p 3001 bash &

# Keep container alive
wait
