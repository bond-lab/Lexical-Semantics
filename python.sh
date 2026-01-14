#!/bin/bash

mkdir -p etc
# wget https://github.com/mmihaltz/word2vec-GoogleNews-vectors/raw/refs/heads/master/GoogleNews-vectors-negative300.bin.gz

# Create the virtual environment if missing
if [ ! -d ".venv-run" ]; then
  echo "Creating virtual environment..."
  uv venv '.venv-run' --python 3.12
fi
uv pip install wn --python .venv-run
uv pip install gensim --python .venv-run
uv pip install transformers --python .venv-run
uv pip install torch --index-url https://download.pytorch.org/whl/cpu

exec .venv-run/bin/python -i -c "
import wn
wn.config.data_directory = 'etc/wn_data'
# any other setup here
"
