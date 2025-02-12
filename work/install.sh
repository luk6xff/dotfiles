#!/bin/sh
# ------------------------------------------------------------------
#
# This script checks for work-specific installation scripts (named worksetup-*.sh)
# in the current directory. If there is one such script, it will be run automatically.
# If there are multiple, the user will be prompted to choose which one to execute.
# ------------------------------------------------------------------

# Change to the directory of this script (in case the script is run from elsewhere)
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
cd "$SCRIPT_DIR" || exit 1

echo ">>> Start installing WORKSETUP SPECIFIC STUFF..."

# Find all work-specific scripts in the current directory.
work_scripts=$(ls worksetup-*.sh 2>/dev/null)

# If no scripts are found, exit.
if [ -z "$work_scripts" ]; then
  echo ">>>> No work-specific scripts (worksetup-*.sh) found. Nothing to install."
  exit 0
fi

# Count the number of work-specific scripts.
count=0
for script in $work_scripts; do
  count=$((count + 1))
done

# If only one script is found, run it automatically.
if [ $count -eq 1 ]; then
  echo ">>>> Found one work-specific script: $work_scripts"
  echo ">>>> Running $work_scripts..."
  bash "$work_scripts"
  exit $?
fi

# If more than one script is found, list them and prompt the user.
echo ">>>> Multiple work-specific scripts found. Please choose one to run:"
index=1
for script in $work_scripts; do
  echo "  $index) $script"
  index=$((index + 1))
done

# Prompt user for selection.
printf ">>>> Enter the number of the script to run: "
read choice

# Validate the selection and map it to the corresponding script.
index=1
chosen=""
for script in $work_scripts; do
  if [ "$index" -eq "$choice" ]; then
    chosen="$script"
    break
  fi
  index=$((index + 1))
done

if [ -z "$chosen" ]; then
  echo ">>>> Invalid selection. Exiting."
  exit 1
fi

echo ">>>> Running $chosen..."
bash "$chosen"
exit $?
