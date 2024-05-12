#### Vim ####

cd ~/ # go to the Home directory
mkdir git # make a folder name git if it still doesn't exist.
cd git # go to git/ folder

git clone https://github.com/vim/vim # clone vim repository in the cwd

cd vim/ # go to the just cloned vim directory

# check and download dependencies:
sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
  libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
  libcairo2-dev libx11-dev libxpm-dev libxt-dev

sudo apt-get install ruby-dev # i'm not entirely sure this is needed but it was in the guide: https://vim.fandom.com/wiki/Building_Vim#Building_Vim_on_Ubuntu
  
# clean
  make distclean
# configure vim compilation to enable all non-gui features, like clipping.
./configure --with-features=huge --enable-gui=gnome2
# make and install vim:
make
sudo make install
cd ~/ # go back to the Home directory.

#### End Vim installation. ####

