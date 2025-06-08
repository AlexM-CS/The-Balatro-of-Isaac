# Yeah, no WAY am I making over 600 files by hand for this mod.
# If you thought I was, you might be insane.

# Anyways, the only point of this file is to create the needed files/directories
# for any Jokers I haven't implemented yet. Namely, everything page 3 and beyond.

import os

# We'll be reading this file and looking for every Joker in it
file = open("definitions.lua")

# Read until the end
while True:
    line = file.readline()

    # End of file, stop reading
    if line == f"":
        break

    # Joker has not been made yet (probably)
    if line[:8] == f"    -- \"":
        # line[8] until line[len(line) - 3] are the characters we care about
        # We'll be splitting this substring by "/" to find the directory it
        # belongs in
        filepath = line[8:len(line) - 3]
        directory, item = filepath.split(f"/")
        
        # As a safeguard, we'll check to make sure that the directory doesn't exist
        try:
            os.mkdir(directory)
            print(f"Directory '{directory}' created successfully.")
        except FileExistsError:
            print(f"Directory '{directory}' already exists.")

        file_content = f"""
SMODS.Joker {{
    key = {item},
    loc_txt = {{
        name = {item},
        text = {{
            "Placeholder"
        }}
    }}
}}"""

        try:
            path = os.path.join(directory, f"{item}.lua")
            write_file = open(path, f"w")
            print(f"File '{item} created successfully in directory '{directory}'.")
            write_file.write(file_content)
            print(f"File '{item}' written to successfully.")
        except Exception as e:
            print(f"Unexpected exception occured:")
            print(e)