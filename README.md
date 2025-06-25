# configs

## My configuration files
Configuration files used for Linux computers and virtual machines on Mosfanet. Some may need to be modified for particular systems and situations.
### Home directory
- `.bash_aliases` - Bash aliases and functions.
- `.bash_logout` - commands to be executed when the login shell exits.
- `.bashrc` - customized `.bashrc`. Sets manpager, function to parse git branch in prompt, custom PS1 prompt, launches Fastfetch.
- `.face` - .png image.
- `.imwheelrc` - configurations for mouse wheel behavior.
- `.inputrc` - sets bash options and keybindings.
- `.profile` - sets path variable and exports environment variables.
- icons - directory of icons for dunst notifications.
### .config directory
#### backgrounds
- SFW/PG-13 backgrounds for `feh`
#### bat
- `config` - configuration file for the Bat utility.
#### bluefish
- `rcfile-2.0` - configuration file for Bluefish editor.
#### dsh
- `dsh.conf' - dsh configguration file, located in `/etc/dsh/`.
- `machines.list` - IP addresses of all Linux systems on the network.
- `group/all` - symbolic link to `machines.list`
- `group/desktops` - IP addresses of all Linux desktops on the network.
- `group/i3wm` - IP addresses of all computers with i3wm on the network.
- `group/laptops` - IP addresses of all Linux laptops on the network.
#### dunst
- `dunstrc` - configuration file for notifications on i3wm systems.
#### fastfetch
- `config.jsonc` - customized Fastfetch configuration file.
- `config.jsonc.ascii` - customized Fastfetch configuration file using ASCII logo.
- `atheism.png` - Logo image for Fastfetch. Install in `~/.local/share/fastfetch/logos/`.
- `atheist.txt` - ASCII logo image for Fastfetch. Install in `~/.local/share/fastfetch/logos/`.
#### i3
- `autostart.sh` - script to launch i3wm and necessary services.
- `bar.conf` - configuration file for Bumblebee-Status bar (for reference only).
- `bindings.list` - list of i3wm keybindings displayed by `i3kb` script.
- `config` - i3wm configuration file.
- `dmconf` - dmenu script to edit configuration files.
- `logout` - script to suspend, lock screen, logout, reboot, power off, or kill current user.
- `sxhkd/sxhdkrc` - i3wm keybindings.
- `workspaces.conf` - defines and assigns i3wm workspaces.
**NOTE:** In `config`, resize parameters for floating window for different screen resolutions (75%):
	- 1024x600 -> 758 450
	- 1280x800 -> 960 600
	- 1368x768 -> 1024 576
	- 1440x900 -> 1080 675
	- 1680x1050 -> 1260 780
	- 1920x1080 -> 1440 800
#### keepassxc
- `keepassxc.ini` - KeePassXC configuration file.
#### kitty
- `bindings.list` - list of kitty keybindings displayed by `kkb` script.
- `kitty.conf` - Kitty configuration file.
#### local
- `bin/autoexrander` - sets up dual monitors in i3wm.
- `bin/current_wx.sh` - bring up current weather conditions.
- `bin/start-conky' - autostart conky on bootup.
- `leave.txt` - message file used by leave() in functionlib and .bashrc MOTD.
#### marktext
- `prefences.json` - MarkText preferences.
#### micro
 - `bindings.json` - Micro keybindings.
 - `settings.json` - Micro configuration.
#### mint (Cinnamon)
 - `keybindings-backup.dconf` - Keybindings for the Cinnamon DE. Stored in `~/.config`.
 - `/usr/share/nemo/actions/refresh_nemo_actions` - Adds refresh option to Nemo context menu.
#### nano
- `nanorc` - basic Nano configuration file. Recommend copying `/etc/nanorc` to `~/.config/nano/nanorc` and running `nano.sed` against it.
#### neofetch
- `config.conf` - customized Neofetch configuration.
- `default.conf` - Default Neofetch configuration.
- `mosfanet.conf` - Standard configuration template for my computers.
#### picom
- picom.bread.conf - customize picom configuration from BreadOnPenguins.
- picom.conf - default picom configuration with background set to `xrender`.
- picom.minimal.conf - absolute minimal configuration.
#### polybar
- `config.ini` - Polybar configuration file.
- `polybar-i3` - Polybar launch script, lanuched by `~/.config/i3/autostart`.
#### rofi
- `arc_dark_colors.rasi` - Arc Dark theme.
- `arc_dark_transparent_colors.rasi` - Transparent colors for Arc Dark theme.
- `config.rasi` - i3 Rofi configuration.
#### sudoers
- `0pwfeedback` - enables password feedback with asterisks.
- `10timeout` - sets default sudo timeout to 30 minutes.
#### systemd/user
- `imwheel.service - systemd service for imwheel.
#### terminator
- `config` - Terminator terminal emulator configuration.
#### VSCodium
- `User/settings.json` - VSCodium configuration and settings.
### local/bin
- `autoxrandr.sh` - configures multiple monitors.
- `start-conky.sh` - launches conky from ~/.config/autostart/conky.desktop.
### X11
**NOTE:** Place X11 files in `/etc/X11/xorg.conf.d/` as needed.
- `8300-usdt-gitea/10-monitor.conf` - display configuration.
- `hp-850-g3/10-intel-brightness.conf` - configuration for Intel backlight functionality.
- `hp-probook-6570/10-monitor.conf` - dual monitor configuration.
- `lenovo/10-monitor.conf` - dual monitor configuration.
- `probook-6570/10-monitor.conf` - dual monitor configuration.
- `probook-6570/20-intel-backlight.conf` - configuration for Intel backlight functionality.
- `10-force-kvm.conf - forces detection of monitor on a KVM switch.
- `20-intel-brightness.conf` - basic configuration for Intel backlight functionality.
### redshift.conf
- `~/.config/redshift.conf` - configuration file for redshift.
### sleep.conf
- `/etc/systemd/sleep.conf` - SystemD configuration file, disables sleep/suspend/hibernation.
#### Rick Romig (*The Luddite Geek*)
##### 25 June 2025
