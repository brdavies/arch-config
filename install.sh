# Root directory for git configuration repository.
#
# TODO: Auto calculate this value based on the location of this script
# file.
cfg_dir=~/.config

# Backup directory for files modified by this script.
backup_dir=${cfg_dir}/backup

mkdir -p ${backup_dir}

# Bash
mv -i ~/.bash_profile ${backup_dir}
ln -s ${cfg_dir}/bash/.bash_profile ~/.bash_profile

mv -i ~/.bashrc ${backup_dir}
ln -s ${cfg_dir}/bash/.bashrc ~/.bashrc

# zsh
mv -i ~/.zshrc ${backup_dir}
ln -s ${cfg_dir}/zsh/.zshrc ~/.zshrc

# Git
mv -i ~/.gitconfig ${backup_dir}
ln -s ${cfg_dir}/git/.gitconfig ~/.gitconfig

# Ratpoison window manager
mv -i ~/.ratpoisonrc ${backup_dir}
ln -s ${cfg_dir}/ratpoison/.ratpoisonrc ~/.ratpoisonrc

# Xorg
mv -i ~/.Xdefaults ${backup_dir}
ln -s ${cfg_dir}/xorg/.Xdefaults ~/.Xdefaults

mv -i ~/.xinitrc ${backup_dir}
ln -s ${cfg_dir}/xorg/.xinitrc ~/.xinitrc

# tmux terminal multiplexer
mv -i ~/.tmux.conf ${backup_dir}
ln -s ${cfg_dir}/tmux/.tmux.conf ~/.tmux.conf

# tmux terminal multiplexer
mv -i ~/.scm_breeze ${backup_dir}
ln -s ${cfg_dir}/scm_breeze ~/.scm_breeze

# ssh
mv -i ~/.ssh ${backup_dir}
ln -s ${cfg_dir}/.ssh ~/.ssh
chmod 600 ${cfg_dir}/.ssh/id_ecdsa
chmod 600 ${cfg_dir}/.ssh/id_rsa
chmod 600 ${cfg_dir}/.ssh/id_rsa.thorium

mv -i ~/.fonts ${backup_dir}
ln -s ${cfg_dir}/.fonts ~/.fonts
fc-cache -v

# vim
mv -i ~/.vimrc ${backup_dir}
ln -s ${cfg_dir}/vim/.vimrc ~/.vimrc
