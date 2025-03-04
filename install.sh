#!/bin/bash

# Verify if SCRIPT_DIR is correctly set
SCRIPT_DIR="$(dirname "$0")"

# Load utility functions
UTILS_FILE="$SCRIPT_DIR/lib/utils.sh"
if [ -f "$UTILS_FILE" ]; then
    source "$UTILS_FILE"
else
    echo "Error: Utility functions file $UTILS_FILE not found!"
    exit 1
fi

# Load configurations
CONFIG_FILE="$SCRIPT_DIR/config/settings.conf"
if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
else
    echo "Error: Configuration file $CONFIG_FILE not found!"
    exit 1
fi

# Define log file
LOG_FILE="$SCRIPT_DIR/logs/script.log"

# Function to display menu
show_menu() {
    echo "Welcome to $APP_NAME!"
    echo "1) Update System"
    echo "2) Install Programs"
    echo "3) Install Flatpaks"
    echo "4) Install .deb Packages"
    echo "5) Run All"
    echo "0) Exit"
    read -p "Choose an option: " choice
    case $choice in
        1) run_script "system_update.sh" "Updating system..." ;;
        2) run_script "install_programs.sh" "Installing programs..." ;;
        3) run_script "install_flatpaks.sh" "Installing Flatpaks..." ;;
        4) run_script "install_programs_debs.sh" "Installing .deb packages..." ;;
        5) run_all ;;
        0) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid option!" ;;
    esac
}

# Function to execute a script
run_script() {
    local script_name=$1
    local message=$2
    if [ -f "$SCRIPT_DIR/bin/$script_name" ]; then
        echo "$message"
        bash "$SCRIPT_DIR/bin/$script_name"
    else
        echo "Error: $script_name not found!"
    fi
}

# Function to run all scripts
run_all() {
    run_script "system_update.sh" "Updating system..."
    run_script "install_programs.sh" "Installing programs..."
    run_script "install_flatpaks.sh" "Installing Flatpaks..."
    run_script "install_programs_debs.sh" "Installing .deb packages..."
    echo "All tasks completed!"
}

# Main function
main() {
    chmod +x bin/*
    log_info "Starting project: $APP_NAME (v$VERSION)" "$LOG_FILE"
    while true; do
        show_menu
    done
}

# Execute main function
main
