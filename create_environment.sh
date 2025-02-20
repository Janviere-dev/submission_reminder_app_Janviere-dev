#!/bin/bash
# Ask user his or her name.
echo "Please provide your name:"
read user_surname;
# Create parent directory called submission_reminder_{yourName}.
parent_dir="submission_reminder_${user_surname}"
mkdir -p $parent_dir/

# Create subdirectory within parent directory using for loop
for subdir in app modules assets config
do
        mkdir -p $parent_dir/$subdir
done

# Create files inside these subdirectories.
if [ -d "submission_reminder_${user_surname}" ]; then
        touch $parent_dir/app/reminder.sh
        chmod +x $parent_dir/app/reminder.sh
fi

if [ -d "submission_reminder_${user_surname}" ]; then
        touch $parent_dir/modules/functions.sh
        chmod +x $parent_dir/modules/functions.sh
fi

if [ -d "submission_reminder_${user_surname}" ]; then
        touch $parent_dir/assets/submissions.txt
fi

if [ -d "submission_reminder_${user_surname}" ]; then
        touch $parent_dir/config/config.env
        chmod +x $parent_dir/config/config.env
fi

# Write to reminder.sh
echo '#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh                                                                                                                                                   
# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file' > $parent_dir/app/reminder.sh

# This script defines a function to check student submissions for a specific assignment. It reads a CSV file containing student names, assignments, and their submission statuses.For each student, it checks whether they have submitted the specified assignment.If a student has not submitted the assignment, a reminder message is printed.
echo '#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is "not submitted"
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}' > $parent_dir/modules/functions.sh

# This is the config file for the submission checking script. It specifies the assignment name and the number of days remaining for submission.
echo '# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2' > $parent_dir/config/config.env

# Adding more student records in submmission.txt
echo 'student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Shell Navigation, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Navigation, submitted
Assa, Shell Navigation, submitted
Angelique,Shell Navigation, not submitted
Alliance,Shell Navigation, submitted
Ange,Shell Navigation, not submitted
Diane,Shell Navigation, Submitted
Anaise, Shell Permission, not submitted
Jean,Shell Navigation, not submitted' > $parent_dir/assets/submissions.txt

# I am creating script that will be used to startup the reminder app.
touch $parent_dir/startup.sh

# Purpose: This script starts the reminder app.
# Author: Janviere Munezero
# Date: 18 February 2025

# Start the reminder app
echo '#!/bin/bash

# Check if the app started successfully
if [ -d "app" ]; then
        echo "Reminder app has started running"
fi
# Start reminder app.
bash ./app/reminder.sh' > $parent_dir/startup.sh
chmod +x "$parent_dir/startup.sh"

echo "Setup of the environment has been successfully completed in directory: $parent_dir"
