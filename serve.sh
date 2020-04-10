#!/bin/bash
echo "Ctrl+click on the link below"
python3 -m http.server
# sensible-browser http://0.0.0.0:8000/ # does not work
