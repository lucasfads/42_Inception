sudo apt update -y

sudo apt install -y wget curl libnss3-tools

curl -s https://api.github.com/repos/FiloSottile/mkcert/releases/latest| grep browser_download_url  | grep linux-amd64 | cut -d '"' -f 4 | wget -qi -

mv mkcert-v*-linux-amd64 mkcert

chmod a+x mkcert

sudo mv mkcert /usr/local/bin/

mkcert --version
