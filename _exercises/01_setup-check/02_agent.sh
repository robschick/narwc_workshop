#!/usr/bin/env bash
# Setup check 2 of 2: the terminal agent (OPTIONAL)
# Not required. Tier 3 is a demonstration — you watch, you don't type.

pa --version \
  || claude --version \
  || echo "No terminal agent installed. That is fine — tier 3 is watched, not typed."
