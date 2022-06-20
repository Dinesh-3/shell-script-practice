#!/bin/sh

# Command Format = /d/MAIN/automation/branch_movement_uat.sh feature DSP-141062-get-quote-idv-validation-fix-UAT d107ac6
git --version 2>&1 >/dev/null # To avoid output printing in console
if [ $? != 0 ]; then echo -e "\n=== GIT is Not installed!!! ===\n"
fi

cd /D/DEV/BitBucketRepositories/CU210_E2020_03/s_dispatcher_motor_v2

git reset --hard && git clean -f

TYPE=$1
TITLE=$2
SOURCE="UAT"
COMMIT_ID=$3

BRANCH=$TYPE/$TITLE

echo -e "\n=== CREATING BRANCH $BRANCH ===\n"

git checkout release/$SOURCE
git pull origin release/$SOURCE
git checkout -b $BRANCH

echo -e "\n=== MERGING CHANGES FROM TRUNK TO UAT ===\n"

git fetch origin release/TRUNK

git cherry-pick -n -m 1 $COMMIT_ID

# git add .

git commit -m $TITLE

if [ $? -eq 0 ]; then
    pushChanges $BRANCH
elif [  $? -eq 1 ] then
    echo -e "\n=== Conflict Happened!!! ===\n"
    read -p "Is Conflict is Resolved? Y/N : " isConflictResolved # -s for hiding user input, -a for reading array of values
    if [isConflictResolved = "Y"] then 
        git commit -m $TITLE
        pushChanges $BRANCH
    else echo -e "\n=== You have selected N (No) Execution Terminated ===\n" exit 1
    fi
else
    echo -e "\n=== Automation Failed!!! ===\n"
fi

pushChanges()
{
    BRANCH=$1
    shift; shift;
    # Having shifted twice, the rest is now in comments ...
    COMMENTS=$@

    echo -e "\n=== PUSHING CHANGES ===\n"
    git push origin $BRANCH
    echo -e "\n=== Automation Done Successfully ===\n"
}