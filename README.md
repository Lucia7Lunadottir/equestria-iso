# equestria-iso

## 🌟 What's New in this Release (2026.10.27)
Everything that changed since the previous ISO (2026.07.15).

New Equestria apps (all in 10 languages, all follow your character theme):
1. GPU Manager: shows your graphics cards and recommends and installs the right driver.
2. Clock: alarms, timer and stopwatch; keeps working from the system tray.
3. Calendar: moon phases, reminders with repeats, month/week/year views.
4. Notes: notes with images and to-do checkboxes.
5. Calculator, Screen Recorder, Color Picker.
6. Audio/Video Converter: 17 audio formats, trimming, fades, speed, volume, tags, WebM/MKV.
7. Closer: closes frozen windows.
8. Clock and Calendar now open their existing window instead of starting a second copy.

Panel and appearance:
1. New panel clock: calendar with week numbers, Equestria Calendar events, other time zones.
2. Day and night themes: KDE switches between light and dark automatically (Auto / Light / Dark in the Character Theme).
3. Character themes now apply to every Equestria app, with new palettes for each character.
4. One cursor theme for the whole system (Vimix); native Plasma lock and logout screens.

Settings:
1. New "Sound" section: output and input devices, volume up to 150%, sound card profiles, microphone boost, and a diagnostics page with one-click fixes.
2. Screen brightness settings for the monitor and the graphics card.
3. Graphics card section: drivers, video memory usage, and optional warnings when RAM or video memory runs low.
4. Report a problem or suggest an idea straight from the settings.

Stability:
1. The panel and desktop restart automatically when they freeze, crash, or stop drawing because video memory ran out.
2. Optional automatic recovery from the black screen on NVIDIA (Settings → Graphics card).
3. The GPU driver is no longer replaced at boot when it was installed without DKMS.
4. Fixed notifications, Wi-Fi settings, and swap on btrfs.

Software Center and installing apps:
1. Install apps from .deb and .rpm files.
2. "Update" in an app's card now updates only that app.
3. Light Image (photo catalog) is available in the Software Center.
4. App menus refresh right after installing an app.

Other:
1. Image Finish 2.2.3: PSD files, Photoshop-like pen and text tools.
2. Proton exe Starter is more stable.
3. Installer: the installed system now also boots on computers that do not remember UEFI boot entries.

## 🌟 What's New in this Release (2026.07.15)
1. The Software Center has been improved. Bugs preventing downloading packages from the list of basic programs have been fixed.
2. Image Finish is now integrated into the ISO as a full-fledged image editor similar to Photoshop.


## 🌟 What's New in this Release (2026.07.14)
1. The localization of the RAM widget has been fixed.
2. Theme switching now works better.
3. The disk manager now has more advanced disk management features and new Switch toggles.
4. Proton settings now have some toggles for gamepads.
5. The package manager now allows you to delete the cache created by the program.
6. The store now displays the size of all package caches.
7. Fixed GPU control settings.


## 🌟 What's New in this Release (2026.07.08)

App Store:
1. Added update settings.
2. Now you can disable AUR in updates.
3. Fixed links to packages that weren't working.
4. Added other notes for Nvidia graphics cards.

Settings:
1. Added an internet configuration module so you can configure settings for fast internet access.
2. Added a GPU module for reconfiguring drivers.

Launching .exe applications:
1. Optimized settings; each application's cache size is now 20-50 MB, up from 1 GB.
2. Added more logs to help you understand what's not working.

Restore Point:
1. Fixed repositories.
2. During installation, it now displays more installation details, and if the installation fails, it will install the package without any issues.

Graphics Card Performance:
1. Drivers and Proton now work properly on Nvidia graphics cards of the Pascal series and older. (Tested on a GTX 1060 6GB)

Installer:
1. The system language is now installed during installation.
2. Settings have been changed to reduce restrictions during installation.


## 🌟 What's New in this Release (2026.06.03)

* Wi-Fi and Vulkan packages have been updated.
* The task panel changer has been improved.
* Plymouth has been updated.


## 🌟 What's New in this Release (2026.05.31)

* Fixed Tour and Welcome Hub autostart errors.


## 🌟 What's New in this Release (2026.05.30)

* **Updated System Packages:** All core components and pre-installed software have been updated to the latest available versions from the Arch Linux repositories.
* **Improved Boot Screen (Plymouth):** The boot animation now works properly and seamlessly displays the motherboard's vendor logo during system startup.
