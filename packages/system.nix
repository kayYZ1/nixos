{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

	ghostty
    
    btop
    htop
    iotop
    
    curl
    wget
    rsync

    unzip
    zip
    p7zip

    tree
    file
	lsof
	psmisc
	which
	pciutils
	usbutils

	less

	fastfetch
	lshw
	dmidecode

	killall
	pstree

  wev
  pamixer
	
	man-pages
	man-pages-posix
  ];

  documentation.man.enable = true;
  documentation.dev.enable = true;

  services.locate.enable = true;
  services.locate.package = pkgs.mlocate;
} 
