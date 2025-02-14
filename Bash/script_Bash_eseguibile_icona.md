#   Script creation
-   es. <SCRIPT_PATH>/<SCRIPT_NAME>.sh

#   Script icon creation
-   es. <SCRIPT_PATH>/<SCRIPT_ICON>.png

#   Exec file <EXEC_SCRIPT_PATH><FILENAME>.desktop creation: 
-   <EXEC_SCRIPT_PATH> può essere
-   una directory come ~/.local/share/applications/ se lo script deve essere disponibile solo per il singolo utente
-   oppure /usr/share/applications/ per renderlo disponibile a tutti gli utenti

#   Exec file update:

- Version=1.0
- Type=Application
- Name=NomeDelLauncher
- Comment=Descrizione del comando
- Exec=<SCRIPT_PATH>/<SCRIPT_NAME>.sh
- Icon=<SCRIPT_PATH>/<SCRIPT_ICON>.png
- Terminal=true
- Categories=Utility;

#   Make the .desktop file executable:
- chmod +x <EXEC_SCRIPT_PATH><FILENAME>.desktop
