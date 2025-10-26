{ pkgs, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["python-2.7.18.12" "electron-25.9.0"];
    cudaSupport = true;
};

  environment.systemPackages = with pkgs; [
    #some gui applications
    audacious
    chromium
	firefox
	spotify
	telegram-desktop
	r2modman
	osu-lazer
	mpv
	zoom-us
    kitty
    flameshot
    onlyoffice-bin
    protonvpn-gui
    vesktop
    qbittorrent
    google-chrome
    protonup-qt
    kdePackages.dolphin
    element-desktop
    fluffychat
    #xfce.thunar
    #xfce.thunar-volman
    #gvfs
    #xfce.tumbler
	upscayl
	kdePackages.ark
	droidcam
	audacity
	#jetbrains.pycharm-community-bin
	shotcut
	vscodium

    
    #overrided packages
    #(discord.override {
    #  withOpenASAR = true;
    #  withVencord = true;
    #})
    
    (heroic.override {
      extraPkgs = pkgs: [
        pkgs.gamemode
      ];
    })

    #wm
    #seatd
    #pavucontrol
    #dconf
    #polkit
    #waybar
    #hyprland
    #xdg-desktop-portal-hyprland
    #kdePackages.xdg-desktop-portal-kde
    #rofi
    #catppuccin-kvantum
    #hyprpaper
    #playerctl
    #kdePackages.qtwayland
    #grim
    #slurp
    #networkmanagerapplet 
    #qt6ct   
    #mako
    #hyprlock
    #hyprpolkitagent
    #hyprshot
    #hyprland-qt-support
    #hyprsysteminfo
    #hyprland-qtutils
    #hyprgraphics
    #hyprutils
    #mpvpaper
    #broot
    
    #important shitt fr fr
    mangohud
    v4l-utils
    #spice_gtk
    #fftw-single
    zulu24
    winetricks
    #kdePackages.kolourpaint
    #kdePackages.sddm-kcm # Configuration module for SDDM
    #kdePackages.wallpaper-engine-plugin
    kdiff3 
    kdePackages.qtbase
    kdePackages.qtwayland
    kdePackages.qtmultimedia
    kdePackages.partitionmanager
    haruna
    wayland-utils
    wl-clipboard
    wine64
    docker-compose
    freerdp
    nodejs_24
    gnumake
    gcc
    rustc
    cargo
    nodejs
    python
    fastfetch
    file
    rar
    unrar
    tree
    wget
    git
    htop
    btop
    nix-index
    unzip
    ffmpeg
    cava
    zip
    ntfs3g
    yt-dlp
    brightnessctl
    openssl
    pkg-config
    lazygit
    xwayland
    wl-clipboard
    cliphist
    pipewire
    pulseaudio
    #pamixer
    home-manager
    spice-vdagent
    papirus-nord
    steam-run
    appimage-run
    #papirus-icon-theme
    tela-icon-theme
    nix-ld
    plasmusic-toolbar
    kurve
    #kdePackages.wallpaper-engine-plugin
    #kdePackages.kvantum
    #qt5ct
    #some libs
    (python3.withPackages (ps: with ps; [
        requests
        websockets
        discord
        spotipy
        ytmusicapi
        yt-dlp
        colorama
        python-telegram-bot
        streamlit
        PyGithub
        rich
        pyside6
        toml
        
         ]))
    kdePackages.qtwebsockets
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
  ];

  fonts.packages = with pkgs; [
  	corefonts
	ubuntu-sans
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk-sans
    nerd-fonts.mononoki
  ];
}
