if [ ! -f /transmission/settings.json ]; then
	cp /settings.json /transmission/settings.json
fi
sudo apt-get update 
sudo apt-get upgrade -y
transmission-daemon --config-dir /transmission/
mono --debug /opt/NzbDrone/NzbDrone.exe /data=/config/
