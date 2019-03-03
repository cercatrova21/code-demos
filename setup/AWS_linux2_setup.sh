# Script for building toolkit for teachbitcoin code-demos and exercises.
# Only for AWS linux 2.

# Build BX
# Build dependencies
# sudo yum install autoconf automake libtool pkgconfig boost-devel
# sudo yum groupinstall "Development Tools"
# wget https://raw.githubusercontent.com/libbitcoin/libbitcoin-explorer/version3/install.sh
# sudo chmod +x install.sh
# sudo ./install.sh

# Download BX binary
wget https://github.com/libbitcoin/libbitcoin-explorer/releases/download/v3.2.0/bx-linux-x64-qrcode
sudo chmod +x bx-linux-x64-qrcode
sudo cp bx-linux-x64-qrcode /usr/local/bin/bx
sudo mkdir /usr/local/etc/libbitcoin
sudo cp bx_config_files/bx_testnet.cfg /usr/local/etc/libbitcoin/bx_testnet.cfg
sudo cp bx_config_files/bx_mainnet.cfg /usr/local/etc/libbitcoin/bx_mainnet.cfg
sudo cp bx_config_files/bx.cfg /usr/local/etc/libbitcoin/bx.cfg
echo 'export BX_CONFIG="/usr/local/etc/libbitcoin/bx.cfg"' >> $HOME/.bashrc

#Install miniconda, jupyter, bash kernel.
wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh
sudo chmod +x Miniconda2-latest-Linux-x86_64.sh
./Miniconda2-latest-Linux-x86_64.sh
source $HOME/.bashrc

pip install bash_kernel --user
python -m bash_kernel.install

if ! command -v jq >/dev/null;
then
    if command -v dnf >/dev/null;
    then
        sudo dnf install jq
    elif command -v apt-get >/dev/null; then
        sudo apt-get install jq
    else
        echo "Please install 'jq' using your package manager"
    fi
fi

source $HOME/.bashrc
