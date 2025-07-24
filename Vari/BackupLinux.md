# Backup disco (Linux)

	sudo rsync -aAXv /* /mnt/backup --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"}

# Ripristino disco da backup

	sudo rsync -aAXv /mnt/backup/ / --exclude={"lost+found","media","mnt","proc","sys","tmp","dev","run"}
