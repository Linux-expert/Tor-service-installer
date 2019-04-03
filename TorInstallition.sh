#!/bin/bash 
tput reset
    echo "Please wait to install tor..."
    sleep 2
sudo pacman -S tor
sudo systemctl enable tor.service
sudo systemctl restart tor.service
sudo systemctl enable tor.service
    echo "Tor service enable !"
    read -p "Do you want to install tor socks? (size : 200.7 kb) (y/n) : " tor_socks
if [ "$tor_socks" == "y" ];then
    sudo pacman -S torsocks
fi
    read -p "Do you want to install tor browser? (size : 71.7 mb) (y/n) : " tor_browser
if [ "$tor_browser" == "y" ];then
    sudo torsocks wget https://dist.torproject.org/torbrowser/8.0.8/tor-browser-linux64-8.0.8_en-US.tar.xz
    tar -xf tor-browser-linux64-8.0.8_en-US.tar.xz
    chmod +x $HOME/tor-browser_en-US/start-tor-browser.desktop
    cd tor-browser_en-US
    ./start-tor-browser.desktop
    echo "Tor browser installed !"
    echo "Good bye !"
fi
exit
if [ "$tor_socks" == "n" ];then
    echo "Good bye !"
fi
exit
