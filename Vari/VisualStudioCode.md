#	Installation
	
	sudo apt update
	sudo apt install wget gpg
	wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
	sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
	sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
	sudo apt update
	sudo apt install code

#	Unistallation

	sudo apt remove code
	rm -rf ~/.config/Code

#	Update new version

	sudo apt update
	sudo apt upgrade code
		