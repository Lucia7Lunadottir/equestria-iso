#!/bin/bash
CONF="/etc/calamares/modules/unpackfs.conf"

if [ -f "/run/archiso/copytoram/airootfs.sfs" ]; then
    # Если мы в оперативке, прописываем короткий путь
    sed -i 's|source: .*airootfs\.sfs|source: /run/archiso/copytoram/airootfs.sfs|g' "$CONF"
elif [ -f "/run/archiso/bootmnt/arch/x86_64/airootfs.sfs" ]; then
    # Если мы на флешке, прописываем длинный путь
    sed -i 's|source: .*airootfs\.sfs|source: /run/archiso/bootmnt/arch/x86_64/airootfs.sfs|g' "$CONF"
fi

# Отключаем swap и размонтируем все не-live разделы,
# чтобы Calamares мог стереть/заменить существующие разделы
swapoff -a 2>/dev/null
for mp in $(findmnt -rn -o TARGET | grep -vE '^/$|^/(run/archiso|proc|sys|dev|run|tmp)'); do
    umount -l "$mp" 2>/dev/null
done

exec calamares "$@"
