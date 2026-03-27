#!/usr/bin/env bash

# Копируем логотип Equestria OS в тему Plymouth после установки пакетов
if [[ -f /etc/equestria-branding/plymouth-watermark.png ]]; then
    mkdir -p /usr/share/plymouth/themes/spinner
    cp /etc/equestria-branding/plymouth-watermark.png \
       /usr/share/plymouth/themes/spinner/watermark.png
fi
