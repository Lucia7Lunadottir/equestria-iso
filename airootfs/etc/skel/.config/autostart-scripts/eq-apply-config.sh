#!/bin/bash
# Применяем только один раз
if [ -f ~/.config/.eq-configured ]; then exit 0; fi

# Копируем конфиг обоев
cp /etc/skel/.config/plasma-org.kde.plasma.desktop-appletsrc ~/.config/plasma-org.kde.plasma.desktop-appletsrc

# Перезапускаем plasmashell через его systemd-сервис: запущенный руками
# «plasmashell &» живёт вне сервиса, и упавшую панель некому поднять
if systemctl --user cat plasma-plasmashell.service >/dev/null 2>&1; then
    systemctl --user restart plasma-plasmashell.service
else
    kquitapp6 plasmashell 2>/dev/null
    sleep 2
    setsid -f plasmashell >/dev/null 2>&1
fi

touch ~/.config/.eq-configured
