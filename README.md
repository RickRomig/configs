# configs

## My configuration files
Configuration files used for Linux computers on Mosfanet. Some may need to be modified for particular systems and situations.
### Home directory
- `.bash_aliases` - Bash aliases and functions.
- `.bash_logout` - commands to be executed when the login shell exits.
- `.bashrc` - customized `.bashrc`. Sets manpager, function to parse git branch in prompt, customized PS1 prompt, launches Neofetch/Fastfetch.
- `.face` - .png image.
- `.imwheelrc` - configurations for mouse wheel behavior.
- `.inputrc` - sets bash options and keybindings.
- `.profile` - sets path variable and exports environment variables.
### .config directory
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
**NOTE:** In `config`, resize parameters for gedit floating window for different screen resolutions (75%):
	- 1024x600 -> 758 450
	- 1280x800 -> 960 600
	- 1368x768 -> 1024 576
	- 1440x900 -> 1080 675
	- 1680x1050 -> 1260 780
	- 1920x1080 -> 1440 800
#### keepassxc
- `keepassxc.ini` - KeePassXC configuration file.
#### keybindings-backup.dconf
- `keybindings-backup.dconf` - Keybindings for the Cinnamon DE. Stored in `~/.config`.
#### kitty
- `bindings.list` - list of kitty keybindings displayed by `kkb` script.
- `kitty.conf` - Kitty configuration file.
#### marktext
- `prefences.json` - MarkText preferences.
#### micro
 - `bindings.json` - Micro keybindings.
 - `settings.json` - Micro configuration.
#### nano
- `nanorc` - basic Nano configuration file. Recommend copying `/etc/nanorc` to `~/.config/nano/nanorc` and running `nano.sed` against it.
#### neofetch
- `config.conf` - customized Neofetch configuration.
- `default.conf` - Default Neofetch configuration.
- `mosfanet.conf` - Standard configuration template for my computers.
#### polybar
- `config.ini` - Polybar configuration file.
- `polybar-i3` - Polybar launch script, lanuched by ~/.config/i3/autostart.
#### rofi
- `arc_dark_colors.rasi` - Arc Dark theme.
- `arc_dark_transparent_colors.rasi` - Transparent colors for Arc Dark theme.
- `config.rasi` - i3 Rofi configuration.
#### terminator
- `config` - Terminator terminal emulator configuration.
#### VSCodium
- `User/settings.json` - VSCodium configuration and settings.
### local/bin
- `autoxrandr.sh` - configures multiple monitors.
- `start-conky.sh` - launches conky from ~/.config/autostart/conky.desktop.
### X11
**NOTE:** Place X11 files in `/etc/X11/xorg.conf.d/`
- `8300-usdt-gitea/10-monitor.conf` - display configuration.
- `hp-850-g3/10-intel-brightness.conf` - configuration for Intel backlight functionality.
- `hp-probook-6570/10-monitor.conf` - dual monitor configuration.
- `probook-6570/10-monitor.conf` - dual monitor configuration.
- `probook-6570/20-intel-backlight.conf` - configuration for Intel backlight functionality.
- `20-intel-backlight.conf` - basic configuration for Intel backlight functionality.
### redshift.conf
- `redshift.conf` - configuration file for redshift.
### refresh_nemo_actions
- `refresh_nemo_actions` - Adds refresh option to Nemo context menu. Place in `/usr/share/nemo/actions/`
### slick-greeter.conf
- `/etc/lightdm/slick-greeter.conf` - configuration file for slick-greeter in lightdm.
#### Rick Romig (*The Luddite Geek*)
##### 17 December 2024
