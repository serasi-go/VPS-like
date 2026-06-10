#!/bin/bash

# Start your bot/app
npm start &

# Start VS Code (main UI)
code-server --bind-addr 0.0.0.0:3000 --auth password --password railway &

# Optional: terminal (might not be accessible externally)
ttyd -p 3001 bash &

wait
