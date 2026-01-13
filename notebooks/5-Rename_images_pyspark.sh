# 'Step - 5' : Image Rename
# In this step, I applied a script to rename images from the selected classes systematically to simplify the following processing steps. To prevent data loss, I also created a backup folder.
# The output will be like this:
# /hawk
#├── backup_rename
#│   ├── image1.jpg
#│   ├── image2.png
#│   ├── image3.jpg
#│   └── ... (other original image files)
#├── real_hawk_1.jpg
#├── real_hawk_2.jpg
#├── real_hawk_3.png
#└── ... (other renamed image files)

#!/bin/bash

# Create a backup folder named 'backup_rename' to avoid accidental data loss
mkdir -p backup_rename

# Copy all image files to the backup folder
cp *.{jpg,jpeg,png,bmp,gif} backup_rename/ 2>/dev/null

# Counter starts at 1
counter=1

# Loop through all common image formats
for file in *.{jpg,jpeg,png,bmp,gif}; do
    # Skip if no matching files are found
    [ -e "$file" ] || continue  

    # Extract the file extension
    extension="${file##*.}"

    # Generate new file name in the format real_hawk_1.jpg
    new_name="real_hawk_${counter}.${extension}"

    # Check if the new file name already exists (to avoid overwriting)
    while [ -e "$new_name" ]; do
        ((counter++))
        new_name="real_hawk_${counter}.${extension}"
    done

    # Rename the file
    mv "$file" "$new_name"

    # Increment the counter
    ((counter++))
done

echo "Backup created in the 'backup_rename' folder."
echo "Renaming completed!"

