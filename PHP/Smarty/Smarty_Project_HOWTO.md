#   Smarty download
-   version with complete libs folder

        https://github.com/smarty-php/smarty/releases/tag/v4.5.5

#   Project creation
- unzip <DOWNLOAD_DIR>/smarty-4.5.5.zip -d /home/roby/Scaricati/
- rm -rf <DOWNLOAD_DIR>/smarty-4.5.5.zip
- cd <PROJECTS_DIR>
- mv <DOWNLOAD_DIR>/smarty-smarty-4.5.5/ .
- mkdir <NEW_PROJECT_DIR>
- cd <NEW_PROJECT_DIR>
- mkdir templates templates_c
- touch index.php templates/home.tpl
- cp -r ../smarty-4.5.5/libs/ .
- chmod 777 templates_c
- nano templates/home.tpl
- nano index.php
- sudo /opt/lampp/lampp start
- Browse http://localhost/<NEW_PROJECT_DIR>/index.php
