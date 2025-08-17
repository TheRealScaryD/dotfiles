if status is-interactive
    # Commands to run in interactive sessions can go here

    #Fish Greeting Pokemon Go Colorscripts
    function fish_greeting
        pokemon-go-colorscripts --no-title -r -s | fastfetch -c $HOME/.config/fastfetch/config-pokemon.jsonc --logo-type file-raw --logo-height 10 --logo-width 5 --logo -
    end

    #Set Default Editor
    set -gx EDITOR nvim

    #Set Default Browser
    set -gx BROWSER firefox

    #Set fish escape delay for sudope plugin (Restore ESC-ESC functionality)
    set fish_escape_delay_ms 1000

    # XDG Base Directory Specification
    set -q XDG_CACHE_HOME || set -U XDG_CACHE_HOME $HOME/.cache
    set -q XDG_CONFIG_HOME || set -U XDG_CONFIG_HOME $HOME/.config
    set -q XDG_DATA_HOME || set -U XDG_DATA_HOME $HOME/.local/share
    set -q XDG_STATE_HOME || set -U XDG_STATE_HOME $HOME/.local/state
    set -q XDG_DESKTOP_DIR || set -U XDG_DESKTOP_DIR $HOME/Desktop
    set -q XDG_DOCUMENTS_DIR || set -U XDG_DOCUMENTS_DIR $HOME/Documents
    set -q XDG_DOWNLOAD_DIR || set -U XDG_DOWNLOAD_DIR $HOME/Downloads
    set -q XDG_MUSIC_DIR || set -U XDG_MUSIC_DIR $HOME/Music
    set -q XDG_PICTURES_DIR || set -U XDG_PICTURES_DIR $HOME/Pictures
    set -q XDG_VIDEOS_DIR || set -U XDG_VIDEOS_DIR $HOME/Videos

    #Settings for NNN File Manager
    set -x NNN_FIFO '/tmp/nnn.fifo'
    set -x NNN_PLUG 'i:imgview;p:preview-tui;w:wallpaper'
    set -x SPLIT h # or "v" for vertical split
    set -x NNN_OPTS eH
    set -x NNN_PREVIEWDIR '$XDG_CACHE_HOME/nnn/previews'

    # Set-up icons for files/directories in terminal using lsd
    abbr -a ls lsd #ls=lsd
    abbr -a l 'lsd -l' #l=ls -l
    abbr -a la 'lsd -a' #la=la -a
    abbr -a lla 'lsd -la' #lla=ls -la
    abbr -a lt 'lsd --tree' #lt=ls --tree

    #Set fzf plugin defaults
    set fzf_fd_opts --hidden #Show hidden files
    #Ctrl-o will open the selected file/directory in Neovim
    set fzf_directory_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"

    #Utilize zoxide - cd "jump" utility
    zoxide init --cmd cd fish | source
end
