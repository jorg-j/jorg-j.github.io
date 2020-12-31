
venv: cache/sambainstall cache/smbconfig.conf

cache/sambainstall:
	test -d cache || mkdir -p cache
	test -d /etc/samba || sudo apt install samba samba-common-bin; sudo smbpasswd -a pi
	touch cache/sambainstall

cache/smbconfig.conf: smb.conf
	sudo cp smb.conf /etc/samba/smb.conf
	sudo service smbd restart
	touch cache/smbconfig.conf

remove:
	sudo service smbd stop
	sudo apt remove --purge samba samba-common-bin -y
	sudo rm -r /etc/samba
	rm -r cache

