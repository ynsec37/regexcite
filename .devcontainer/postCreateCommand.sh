#!/bin/bash

# move script rstudio into /usr/bin
sudo cp "$(pwd)/.devcontainer/rstudio.sh" /usr/bin/rstudio
sudo chmod +x /usr/bin/rstudio

# Restore renv and install staged dependencies
R -q -e 'renv::restore();'

# Define rstudio default working directory
jq --arg folder "$(pwd)/" '. + { "initial_working_directory": $folder }' .devcontainer/rstudio-prefs.json > ~/.config/rstudio/rstudio-prefs.json