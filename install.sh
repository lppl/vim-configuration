#!/usr/bin/env bash

main() {
	install_vim_deps
	link_vimfiles
	install_vundle
	install_command_t
}

install_vim_deps() {
	sudo aptitude update -y
	sudo aptitude install -y vim
}

link_vimfiles() {
	ln -sf "$PWD/vimrc" ~/.vimrc
	ln -sf "$PWD/vim" ~/.vim
}

install_vundle() {
	git clone https://github.com/VundleVim/Vundle.vim.git vim/bundle/Vundle.vim
	vim +PluginInstall +qall
}

install_command_t() {
	sudo aptitude install -y vim-nox
	PATH=$PWD
	cd vim/bundle/Command-T/ruby/commnad-t/
	ruby extconf.rb
	make
	cd $PATH
}

main




