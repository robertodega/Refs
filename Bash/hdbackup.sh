#!/bin/bash

containers=(Multimedia Home)
folders=(/home/roby/Documenti /home/roby/Immagini /home/roby/Musica)

start_time=$(date +"%H:%M:%S")
start_time_sec=$(date +%s)

while true; do
    clear
    echo "**************************************** HD backup Utility ****************************************"

    echo ""
    echo "Select your backup disk support:"
    echo "1) Toshiba"
    echo "2) Hamlet"
    echo "0) Exit"
    read -p "Digit the corresponding number (1-2): " hdsupport

    if [[ "$hdsupport" == "1" || "$hdsupport" == "2" || "$hdsupport" == "0" ]]; then
        break
    else
        echo "Invalid value. Please try again."
    fi
done

if [[ "$hdsupport" == "0" ]]; then
    echo ""
    echo "Thank you!"
    echo ""
    exit 0
else 
    if [[ "$hdsupport" == "1" ]]; then
        hdsupportName="Toshiba"
    else
        hdsupportName="Hamlet"
    fi
fi

hdsupportDir="/media/roby/$hdsupportName/HDBACKUP"

cd "$hdsupportDir" || { echo "Impossibile accedere a $hdsupportDir"; exit 1; }

echo ""
echo "----- Start time: $start_time -----"
echo ""
echo "...Navigated to $hdsupportDir..."
backup_dir_name=$(date +"%Y_%m_%d")
if [ ! -d "$backup_dir_name" ]; then
    echo "...Creating a new directory named '$backup_dir_name'..."
    echo ""
    mkdir "$backup_dir_name"

    cd "$backup_dir_name" || exit
    echo "...Navigated to $backup_dir_name..."
    echo "...Starting backup process..."
    echo ""

    for container in "${containers[@]}"; do
        mkdir "$container"
    done

    for folder in "${folders[@]}"; do

        #   start_folder_time=$(date +"%H:%M:%S")
        start_folder_time=$(date +%s)

        echo "--------------------------------------------------------------------------------------------------------"
        echo -n "          >   Backup of '$folder' in progres ... "
        if cp -r "$folder" .; then

            end_folder_time=$(date +%s)
            elapsed_seconds=$((end_folder_time - start_folder_time))
            elapsed_minutes=$((elapsed_seconds / 60))
            
            echo "          DONE! ($elapsed_minutes minutes)"
        else
            echo "          >   Error during the backup of '$folder'." >&2
        fi

    done

    #   --------------------------------------------------------------------------------------
    #   Backup of Multimedia directory
    start_mv_time=$(date +%s)

    mv Immagini Musica Multimedia/

    end_mv_time=$(date +%s)
    elapsed_seconds=$((end_mv_time - start_mv_time))
    elapsed_minutes=$((elapsed_seconds / 60))
    
    echo "          DONE! ($elapsed_minutes minutes)"

    echo "--------------------------------------------------------------------------------------------------------"
    echo ""
    echo "          >   Moved 'Immagini', 'Musica' into 'Multimedia' ( $elapsed_time )"
    echo ""
    #   --------------------------------------------------------------------------------------

    #   --------------------------------------------------------------------------------------
    #   Backup of Home directory
    echo "--------------------------------------------------------------------------------------------------------"

    start_thunderbird_time=$(date +%s)

    echo -n "          >   Backup of '/home/roby/.thunderbird/' in progres ... "
    if cp -r "/home/roby/.thunderbird/" ./Home; then
        end_thunderbird_time=$(date +%s)
        elapsed_seconds=$((end_thunderbird_time - start_thunderbird_time))
        elapsed_minutes=$((elapsed_seconds / 60))
        echo "          DONE! ( $elapsed_minutes minutes )"
    else
        echo "          >   Error during the backup of '/home/roby/.thunderbird/'." >&2
    fi

    start_bash_aliases_time=$(date +%s)

    echo -n "          >   Backup of '/home/roby/.bash_aliases' in progres ... "
    if cp  "/home/roby/.bash_aliases" ./Home; then
        end_bash_aliases_time=$(date +%s)
        elapsed_seconds=$((end_bash_aliases_time - start_bash_aliases_time))
        elapsed_minutes=$((elapsed_seconds / 60))
        echo "          DONE! ( $elapsed_minutes minutes )"
    else
        echo "          >   Error during the backup of '/home/roby/.bash_aliases'." >&2
    fi
    echo ""
    #   --------------------------------------------------------------------------------------

    #   --------------------------------------------------------------------------------------
    #   Backup of WWW directory
    echo "--------------------------------------------------------------------------------------------------------"

    start_www_time=$(date +%s)

    echo -n "        >   Backup of '/opt/lampp/htdocs/WWW/' in progres ... "
    if cp -r "/opt/lampp/htdocs/WWW/" ./WWW; then
        end_www_time=$(date +%s)
        elapsed_seconds=$((end_www_time - start_www_time))
        elapsed_minutes=$((elapsed_seconds / 60))
        echo "          DONE! ( $elapsed_minutes minutes )"
    else
        echo "          >   Error during the backup of '/opt/lampp/htdocs/WWW/'." >&2
    fi
    echo ""
    #   --------------------------------------------------------------------------------------

    while true; do
        echo ""
        echo "Do you want to proceed with ZIP operation? (long time waiting)"
        echo "1) Sure!"
        echo "2) No"
        read -p "Answer: " zipOp

        if [[ "$zipOp" == "1" || "$hdsupport" == "2" ]]; then
            break
        else
            echo "Invalid value. Please try again."
        fi
    done

    if [[ "$hdsupport" == "0" ]]; then

        # Compress the backup directory
        zip_file="${backup_dir_name}.zip"
        cd ..
        echo "--------------------------------------------------------------------------------------------------------"

        start_zip_time=$(date +%s)

        echo -n "          >   Backup zipping as '$zip_file' in progres ... "
        if zip -rq "$zip_file" "$backup_dir_name"; then
            end_zip_time=$(date +%s)
            elapsed_seconds=$((end_zip_time - start_zip_time))
            elapsed_minutes=$((elapsed_seconds / 60))
            echo "          DONE! ( $elapsed_minutes minutes )"
        else
            echo "          >   Error while zipping backup directory '$backup_dir_name'." >&2
        fi
        echo ""

        # Remove the backup directory after zipping
        echo "--------------------------------------------------------------------------------------------------------"
        echo -n "          >   Backup directory removal in progres ... "

        start_delete_time=$(date +%s)

        if rm -rf "$backup_dir_name"; then
            end_delete_time=$(date +%s)
            elapsed_seconds=$((end_delete_time - start_delete_time))
            elapsed_minutes=$((elapsed_seconds / 60))
            echo "          DONE! ( $elapsed_minutes minutes )"
        else
            echo "          >   Error while removing backup directory '$backup_dir_name'." >&2
        fi
        echo ""
    fi

else
    echo "...Directory '$backup_dir_name' already exists."
    echo ""
fi

end_time=$(date +"%H:%M:%S")
end_time_sec=$(date +%s)
final_elapsed_seconds=$((end_time_sec - start_time_sec))
final_elapsed_minutes=$((final_elapsed_seconds / 60))

echo ""
echo "----- End time: $end_time -----"
echo ""
echo "----- Elapsed time: $final_elapsed_minutes minutes -----"
echo ""

echo "**************************************** Backup process is completed ****************************************"
echo ""