#!/bin/bash

# Define source and destination directories
declare -A mappings=(
    ["kitty"]=".config/kitty"
    ["nvim"]=".config/nvim"
    ["tmux"]=".config/tmux"
    ["zsh"]=".config/zsh"
)

# Iterate over the mappings and copy the folders
for folder in "${!mappings[@]}"; do
    src_folder="$folder"
    dest_folder="${mappings[$folder]}"

    # Check if source folder exists
    if [ -d "$src_folder" ]; then
        echo "Copying $src_folder to $dest_folder"
        cp -r "$src_folder" "$dest_folder"
    else
        echo "Warning: $src_folder does not exist. Skipping."
    fi
done

echo "Copy process Complete"
