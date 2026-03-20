#!/bin/bash

eval "$(ssh-agent -s)"
chmod 700 "$HOME/.ssh/id_ed25519"
ssh-add "$HOME/.ssh/id_ed25519"
cat "$HOME/.ssh/id_ed25519.pub"

# After that, don't forget to run
#
# ```bash
# ssh git@github.com
# ```
