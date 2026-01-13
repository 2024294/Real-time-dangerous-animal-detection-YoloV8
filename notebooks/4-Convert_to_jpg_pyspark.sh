# 'Step - 4' : Image Convert
# In this step, I applied a script to convert all image types to JPG format to simplify the following processing steps. To prevent data loss, I also created a backup folder.

#!/bin/bash

# Create a backup folder named 'backup_conver' to avoid accidental data loss
mkdir -p backup_conver

# Move original files to the backup folder
mv *.{jpg,jpeg,png,bmp,gif} backup_conver/ 2>/dev/null

# Loop through all image files in the backup folder
for file in backup_conver/*.{jpg,jpeg,png,bmp,gif}; do
    # Skip if no matching files are found
    [ -e "$file" ] || continue  

    # Extract the base filename without the extension
    base_name=$(basename "$file" | sed 's/\.[^.]*$//')

    # Convert the image to .jpg format
    convert "$file" "${base_name}.jpg"

    echo "Converted: $file → ${base_name}.jpg"
done

echo "Image conversion completed!"

