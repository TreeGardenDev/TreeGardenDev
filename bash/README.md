Vim Plug: 
```bash 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
cargo install:
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

***nodejs (for coc):***

Ubuntu:
snap available if desired:
```bash
sudo snap install nodejs npm
  ```
 Ubuntu from binary:
 ```bash
 https://nodejs.org/en/download/
 Extract folder
 Should go into downloads with version name - [Version]
 
 cd /lib
 sudo mkdir node
 cd node
 sudo mv ~/Downloads/node-[version]-linux-x64 /lib/node/
 sudo nano ~/.bashrc
 To end of file:
 export PATH=/lib/node/node-[version]-linux-x64/bin:$PATH

 ```
 Arch
 ```bash
 sudo pacman -S nodejs # also installs npm
 ```
 
 OpenSuse
 ```bash
 sudo zypper install nodejs # also installs npm
 ```
 
 Fedora
 ```bash
 sudo dnf install nodejs # also installs npm
 ```
 
 PlugInstall command
 ```bash
 :PlugInstall
 ```
 
 Get Rust Analyzer:
```bash
git clone https://github.com/rust-lang/rust-analyzer.git && cd rust-analyzer
cargo xtask install --server
```

 ```bash
 :CocInstall coc-rust-analyzer
 ```
