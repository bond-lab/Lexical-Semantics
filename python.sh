#!/bin/bash

mkdir -p etc

# Create the virtual environment if missing
if [ ! -d ".venv-run" ]; then
  echo "Creating virtual environment..."
  uv venv '.venv-run' --python 3.12
fi
uv pip install wn --python .venv-run
exec .venv-run/bin/python -i -c "
import wn
wn.config.data_directory = 'etc/wn_data'
# any other setup here
"
