#!/bin/bash
clear

containers=(Multimedia Home)
folders=(/home/roby/Documenti /home/roby/Immagini /home/roby/Musica)

start_time=$(date +"%H:%M:%S")

echo "**************************************** HD backup Utility ****************************************"

echo ""
echo "Scegli il disco di Backup"
echo "1) Toshiba"
echo "2) Hamlet"
read -p "Digita il numero corrispondente (1-2): " hdsupport

if [[ "$hdsupport" != "1" && "$hdsupport" != "2" ]]; then
    echo "Operazione annullata."
    exit 0
fi

if [[ "$hdsupport" == "1" ]]; then
    hdsupportName="Toshiba"
else
    hdsupportName="Hamlet"
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
        echo "--------------------------------------------------------------------------------------"
        echo ""
        if cp -r "$folder" .; then
            echo "          >   Backup of '$folder' has been completed."
        else
            echo "          >   Error during the backup of '$folder'." >&2
        fi
        echo ""
    done

    #   --------------------------------------------------------------------------------------
    #   Backup of Multimedia directory
    mv Immagini Musica Multimedia/
    echo "--------------------------------------------------------------------------------------"
    echo ""
    echo "          >   Moved 'Immagini', 'Musica' into 'Multimedia'..."
    echo ""
    #   --------------------------------------------------------------------------------------

    #   --------------------------------------------------------------------------------------
    #   Backup of Home directory
    echo "--------------------------------------------------------------------------------------"
    echo ""
    if cp -r "/home/roby/.thunderbird/" ./Home; then
        echo "          >   Backup of '/home/roby/.thunderbird/' has been completed."
    else
        echo "          >   Error during the backup of '/home/roby/.thunderbird/'." >&2
    fi
    if cp  "/home/roby/.bash_aliases" ./Home; then
        echo "          >   Backup of '/home/roby/.bash_aliases' has been completed."
    else
        echo "          >   Error during the backup of '/home/roby/.bash_aliases'." >&2
    fi
    echo ""
    #   --------------------------------------------------------------------------------------

    #   --------------------------------------------------------------------------------------
    #   Backup of WWW directory
    echo "--------------------------------------------------------------------------------------"
    echo ""
    if cp -r "/opt/lampp/htdocs/WWW/" ./WWW; then
        echo "          >   Backup di '/opt/lampp/htdocs/WWW/' has been completed."
    else
        echo "          >   Error during the backup of '/opt/lampp/htdocs/WWW/'." >&2
    fi
    echo ""
    #   --------------------------------------------------------------------------------------

    # Compress the backup directory
    zip_file="${backup_dir_name}.zip"
    cd ..
    echo "--------------------------------------------------------------------------------------"
    echo ""
    if zip -r "$zip_file" "$backup_dir_name"; then
        echo "          >   Backup directory zipped as '$zip_file'."
    else
        echo "          >   Error while zipping backup directory '$backup_dir_name'." >&2
    fi
    echo ""

    # Remove the backup directory after zipping
    echo "--------------------------------------------------------------------------------------"
    echo ""
    if rm -rf "$backup_dir_name"; then
        echo "          >   Backup directory '$backup_dir_name' has been removed."
    else
        echo "          >   Error while removing backup directory '$backup_dir_name'." >&2
    fi
    echo ""

else
    echo "...Directory '$backup_dir_name' already exists."
    echo ""
fi

end_time=$(date +"%H:%M:%S")
elapsed_time=$(date -u -d "0 $end_time sec - $start_time sec" +"%H:%M:%S")

echo ""
echo "----- End time: $end_time -----"
echo ""
echo "----- Elapsed time: $elapsed_time -----"
echo ""

echo "**************************************** Backup process is completed ****************************************"
echo ""