#!/bin/bash

while true; do
    clear
    echo "=============================="
    echo "   Linux Menu Script"
    echo "=============================="
    echo "1) System Info"
    echo "2) File Operations"
    echo "3) Network Operations"
    echo "4) Exit"
    echo "=============================="
    read -p "Select an option [1-4]: " main_choice

    case $main_choice in
        1)
            while true; do
                echo "----- System Info Menu -----"
                echo "1) Show System Uptime"
                echo "2) Show Disk Usage"
                echo "3) Show Running Processes"
                echo "4) Back to Main Menu"
                read -p "Select an option [1-4]: " sys_choice

                case $sys_choice in
                    1) uptime ;;
                    2) df -h ;;
                    3) ps aux --sort=-%mem | head ;;
                    4) break ;;
                    *) echo "Invalid option, try again!" ;;
                esac
                read -p "Press Enter to continue..."
            done
            ;;
        2)
            while true; do
                echo "----- File Operations Menu -----"
                echo "1) List Files in Current Directory"
                echo "2) Create a New File"
                echo "3) Delete a File"
                echo "4) Back to Main Menu"
                read -p "Select an option [1-4]: " file_choice

                case $file_choice in
                    1) ls -lah ;;
                    2) 
                       read -p "Enter filename to create: " filename
                       touch "$filename"
                       echo "File '$filename' created."
                       ;;
                    3) 
                        read -p "Enter filename to delete: " del_file
                        rm -i "$del_file"
                        echo "File '$del_file' deleted."
                        ;;
                    4) break ;;
                    *) echo "Invalid option, try again!" ;;
                esac
                read -p "Press Enter to continue..."
            done
            ;;
        3)
            while true; do
                echo "----- Network Operations Menu -----"
                echo "1) Show IP Address"
                echo "2) Check Internet Connection"
                echo "3) Ping a Host"
                echo "4) Back to Main Menu"
                read -p "Select an option [1-4]: " net_choice

                case $net_choice in
                    1) ip a 
                       break ;;
                    2) ping -c 4 8.8.8.8 
                       break ;;
                    3) 
                       read -p "Enter host to ping: " host
                       ping -c 4 "$host"
                       break ;;
                    4) break ;;
                    *) echo "Invalid option, try again!" ;;
                esac
                read -p "Press Enter to continue..."
            done
            ;;
        4)
            echo "Exiting... Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid option, try again!"
            ;;
    esac
done