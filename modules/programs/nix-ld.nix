{ pkgs, ... }: {
  programs.nix-ld.enable = true;

  programs.nix-ld.libraries = with pkgs; [

    webkitgtk_4_1
    xorg.libX11
    ocamlPackages.alsa
    alsa-lib
    glib
    glibc
    gtk3
    gtk4
    gdk-pixbuf
    libsoup_3

  ];

}
