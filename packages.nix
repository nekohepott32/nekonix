{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
    cudaSupport = true;
  };

  environment.systemPackages = with pkgs; [
    #some gui applications
    audacious
    chromium
	spotify
	ayugram-desktop
	r2modman
	mpv
	zoom-us
    kitty
    onlyoffice-bin
    protonvpn-gui
    vesktop
    qbittorrent
    google-chrome
    protonup-qt
    #kdePackages.dolphin
    xfce.thunar
    xfce.thunar-volman
    gvfs
    xfce.tumbler
	upscayl
	kdePackages.ark
	droidcam
    
    #overrided packages
    #(discord-canary.override {
      #withOpenASAR = true;
      #withVencord = true;
    #})
    (heroic.override {
      extraPkgs = pkgs: [
        pkgs.gamemode
      ];
    })

    #wm
    seatd
    pavucontrol
    dconf
    polkit
    waybar
    hyprland
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
    rofi
    catppuccin-kvantum
    hyprpaper
    playerctl
    kdePackages.qtwayland
    grim
    slurp
    networkmanagerapplet 
    qt6ct   
    mako
    hyprlock
    hyprpolkitagent
    hyprland-qt-support
    hyprsysteminfo
    hyprland-qtutils
    hyprgraphics
    hyprutils
    mpvpaper
    
    #important shitt fr fr
    mangohud
    v4l-utils
    #spice_gtk
    #fftw-single
    zulu24
    winetricks
    kdePackages.kolourpaint
    kdePackages.sddm-kcm # Configuration module for SDDM
    kdiff3 
    kdePackages.qtbase
    kdePackages.qtwayland
    kdePackages.qtmultimedia
    kdePackages.partitionmanager
    haruna
    wayland-utils
    wl-clipboard
    wine64
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
    pamixer
    home-manager
    spice-vdagent
    papirus-nord
    steam-run
    appimage-run
    tela-icon-theme
    nix-ld
    plasmusic-toolbar
    #kdePackages.kvantum
    #qt5ct

    #some libs
    (python3.withPackages (ps: with ps; [
        requests
        websockets
         ]))
    kdePackages.qtwebsockets
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
