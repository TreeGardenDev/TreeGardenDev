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
```bash
sudo apt install nodejs npm
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
