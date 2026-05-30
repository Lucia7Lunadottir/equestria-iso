#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="equestria-os"
iso_label="EQUESTRIA_OS_$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m)"
iso_publisher="Equestria OS <https://psyche-games.com>"
iso_application="Equestria OS — Arch-based Linux Distribution"
iso_version="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y.%m.%d)"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux' 'uefi.systemd-boot')
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')
bootstrap_tarball_compression=('zstd' '-c' '-T0' '--auto-threads=logical' '--long' '-19')

file_permissions=(
  ["/root/customize_airootfs.sh"]="0:0:755"
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/root/.gnupg"]="0:0:700"
  ["/usr/local/bin/choose-mirror"]="0:0:755"
  ["/usr/local/bin/Installation_guide"]="0:0:755"
  ["/usr/local/bin/livecd-sound"]="0:0:755"
  ["/usr/local/bin/eq-liveuser-setup"]="0:0:755"
  ["/usr/local/bin/install-equestria.sh"]="0:0:755"
  ["/usr/bin/yay"]="0:0:755"
  ["/usr/local/bin/eq-locale-setup"]="0:0:755"
  ["/etc/profile.d/setup-flathub.sh"]="0:0:755"
  ["/etc/calamares/scripts/remove-ucode"]="0:0:755"
  ["/etc/calamares/scripts/init-pacman-keyring"]="0:0:755"
  ["/usr/local/bin/ensure-pacman-keyring"]="0:0:755"
  ["/etc/calamares/scripts/90-mkinitcpio-install.hook"]="0:0:644"
  ["/usr/bin/equestria-os-tutorial"]="0:0:755"
  ["/usr/bin/equestria-os-welcome"]="0:0:755"
)
