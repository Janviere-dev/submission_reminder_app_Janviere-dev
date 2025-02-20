# submission_reminder_app_Janviere-dev
# This is README.md. Here are the instructions on how Reminder_app works.
# Submission Reminder App

# Overview
This app is built to help educators follow up with students' submissions for their assignments and send reminders to those who haven't submitted their work. The app creates a directory structure with necessary files and scripts to facilitate the process.

## Directory Structure
submission_reminder_<user_surname>/ ├── app/ │ ├── reminder.sh├── modules/ │ ├── functions.sh├── assets/ │ ├── submissions.txt├── config/ │ ├── config.env├── startup.sh

#Installation
1. Run the provided bash script to set up the directory structure and necessary files.
    ```bash
    ./setup.sh
    ```

# Usage

# Startup Script
1. Navigate to the `submission_reminder_<user_surname>` directory.
2. Run the `startup.sh` script to start the reminder app when executed
    ./startup.sh
# Reminder Script (reminder.sh)
1. The `reminder.sh` script is located in the app subdirectory.
2. It reads environment variables and helper functions, prints the remaining time, and runs the check_submissions function.
    ./app/reminder.sh
   

# Functions Script (functions.sh)
1. The functions.sh script is located in the modules subdirectory.
2. It contains the `check_submissions` function, which reads the `submissions.txt` file and outputs students who have not submitted their assignments.
    ./modules/functions.sh
    

# Config File (config.env)
1. The config.env file is located in the config subdirectory.
2. It contains the assignment name and the number of days remaining for submission.
    bash
    ASSIGNMENT="Shell Navigation"
    DAYS_REMAINING=2
    

# Submissions File (submissions.txt)
1. The submissions.txt file is located in the assets subdirectory.
2. It contains student records with columns for student name, assignment, and submission status.
    
    student, assignment, submission status
    Chinemerem, Shell Navigation, not submitted
    Chiagoziem, Git, submitted
    Divine, Shell Navigation, not submitted
    Anissa, Shell Basics, submitted
    Assa, Shell Navigation, submitted
    Angelique, Shell Permissions, not submitted
    Alliance, Shell Permissions, submitted
    Diane, Shell Permissions, Submitted
    Anaise, Shell Permission, not submitted
    Jean, Shell Basics, not submitted 
# Authors
Janviere Munezero
# Date
18 February 2025



