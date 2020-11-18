#!/usr/bin/env bash
confirm() {
    # call with a prompt string or use a default
    read -r -p "${1:-Are you sure? [y/N]} " response
    case "$response" in
        [yY][eE][sS]|[yY]) 
            true 
            ;;
        *)
            exit 1
            ;;
    esac
}

echo "select any one ************"
echo "  1)Node.js"
echo "  2)MongoDB"
echo "  3)vscode"
echo "  4)LAMP" 
echo "  5)my vscode recommended Extensions" 


read n
confirm
case $n in
  1) echo "You chose Node.js"
echo "select Node.js version  ************"
echo "  1)Node.js Current (vxx.x):"
echo "  2)Node.js LTS (vxx.x):"
echo "  3)Node.js v15.x:"
echo "  4)Node.js v14.x:"
echo "  5)Node.js v12.x:"
echo "  6)Node.js v10.x:" 

read n

case $n in
  1) 
  curl -sL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt-get install -y nodejs;;
  2) curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs;;
  3) # Using Ubuntu
curl -sL https://deb.nodesource.com/setup_15.x | sudo -E bash -
sudo apt-get install -y nodejs
;;
  4)# Using Ubuntu
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs
 ;;
  5)# Using Ubuntu
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
 ;;
  6) # Using Ubuntu
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs
;;
  *) echo "wrong option try again"
  exit 1 ;;
esac
  ;;
  2) echo "You chose Option 2"
  	echo "Checking ubuntu version...."
     echo "UBUNTU version $a"
     echo "Checking OS architecture!"
     string="$(uname --machine)"
     if [ $string != "x86_64" ]
then
  echo "Architecture $string not supported "  
  exit 1

fi
	echo "Installing MongoDB...."
    wget -qO - 'https://www.mongodb.org/static/pgp/server-4.4.asc'| sudo apt-key add -

if [[ $a =~ "20" ]];
then 
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
elif [[ $a =~ "18" ]];
then
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
elif [[ $a =~ "16" ]];
then
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
else
echo "error occurred"
   echo "None of the condition met"
fi
sudo apt-get update
sudo apt-get install -y mongodb-org
	echo "Starting Mongodb Service..."
sudo systemctl start mongod
	echo "Service started (Hopefully)..."
	echo "Run 'mongo' to connect to the local server which is running on 27017"

  ;;
  3) 
  sudo apt update
  sudo apt install code
  ;;
  4)
	echo "Installing lamp stack.."
	sudo apt update
	sudo apt install apache2 -y
	sudo apache2ctl configtest

	echo "Adjust the Firewall to Allow Web Traffic"
	sudo ufw app list
	sudo ufw app info "Apache Full"

	echo "Allow incoming traffic for this profile"
	sudo ufw allow in "Apache Full"

	echo "installing mysql.."
	sudo apt install mysql-server -y

	echo "installing php.."
	sudo apt install php libapache2-mod-php php-mcrypt php-mysql -y

	sudo systemctl status apache2
	echo "LAMP Stack Installed";;
    5)
	echo "Installing my vscode Extensions.."
code --install-extension adamwalzer.string-converter
code --install-extension christian-kohler.path-intellisense
code --install-extension CoenraadS.bracket-pair-colorizer-2
code --install-extension eamodio.gitlens
code --install-extension HookyQR.beautify
code --install-extension johnpapa.Angular2
code --install-extension jolaleye.horizon-theme-vscode
code --install-extension mervin.markdown-formatter
code --install-extension Nimda.deepdark-material
code --install-extension steoates.autoimport
code --install-extension Vtrois.gitmoji-vscode
code --install-extension xabikos.JavaScriptSnippets
     ;;
#   *) echo "invalid option";;
esac