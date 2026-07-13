#!/usr/bin/env bash
# Инициализируем keyring в live-среде чтобы pacman работал без ошибок
pacman-key --init
pacman-key --populate archlinux
pacman-key --populate equestria-os 2>/dev/null || true

# Генерируем glibc-локали всех поддерживаемых языков. Без них смена языка
# в live даёт лишь частичный перевод: setlocale() на несуществующей локали
# откатывается в C, и KDE переводит только строки, идущие через LANGUAGE.
# Генерируем через localedef, а НЕ через /etc/locale.gen: locale.gen должен
# остаться нетронутым — eq-locale-setup восстанавливает язык пользователя
# по первой раскомментированной строке, и наши 11 локалей его бы сломали.
# Готовый locale-archive уезжает через unpackfs и в установленную систему,
# так что язык работает даже если Calamares-модуль локали молча упадёт.
for l in en_US de_DE es_ES fr_FR ja_JP pl_PL pt_BR pt_PT ru_RU uk_UA zh_CN; do
    localedef -i "$l" -f UTF-8 "$l.UTF-8"
done
