#!/bin/bash
CONF="/etc/calamares/modules/unpackfs.conf"

if [ -f "/run/archiso/copytoram/airootfs.sfs" ]; then
    # Если мы в оперативке, прописываем короткий путь
    sed -i 's|source: .*airootfs\.sfs|source: /run/archiso/copytoram/airootfs.sfs|g' "$CONF"
elif [ -f "/run/archiso/bootmnt/arch/x86_64/airootfs.sfs" ]; then
    # Если мы на флешке, прописываем длинный путь
    sed -i 's|source: .*airootfs\.sfs|source: /run/archiso/bootmnt/arch/x86_64/airootfs.sfs|g' "$CONF"
fi

exec calamares "$@"
