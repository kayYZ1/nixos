{ config, pkgs, ... }:

{
	services.openssh.enable = true;

	networking.firewall.enable = true;
	networking.firewall.allowPing = true;

	environment.systemPackages = with pkgs; [
		iputils
		iproute2

		traceroute
		mtr

		dig
		host
		
		nmap
		tcpdump
	
		iftop
		nethogs
		bandwhich

		ethtool

		socat

		wavemon
		iw
		
		openvpn
		openssh
		sshfs
	];

	services.fail2ban.enable = true;
	services.openssh.settings = {
		PasswordAuthentication = true;
		PermitRootLogin = "no";
	};

	networking.enableIPv6 = true;
	services.ntp.enable = true;
}
