#!/bin/bash
# Проверка свежего образа Equestria OS в виртуальной машине (QEMU + KVM, UEFI).
#
#   ./test-vm.sh              — загрузить новейший ISO из ~/equestria-out
#   NIGHT=1 ./test-vm.sh      — часы ВМ на 23:00: сразу видно ночную тему и тёмный курсор
#   BIOS=1 ./test-vm.sh       — загрузка в режиме BIOS вместо UEFI
#   ISO=путь ./test-vm.sh     — конкретный образ
#
# Диск ВМ (для проверки установки через Calamares) — ~/equestria-out/vm-disk.qcow2, 40 ГБ.
# Звук ВМ идёт в ваш PipeWire (виртуальная Intel HDA с микрофоном) — модуль «Звук»
# в «Настройках» увидит её как настоящую карту.
set -e

OUT="$HOME/equestria-out"
ISO="${ISO:-$(ls -t "$OUT"/equestria-os-*.iso 2>/dev/null | head -1)}"
[ -f "$ISO" ] || { echo "Образ не найден в $OUT — сначала ./build.sh" >&2; exit 1; }
command -v qemu-system-x86_64 >/dev/null || { echo "Нужен пакет qemu-desktop" >&2; exit 1; }

DISK="$OUT/vm-disk.qcow2"
[ -f "$DISK" ] || qemu-img create -f qcow2 "$DISK" 40G >/dev/null

firmware=()
if [ -z "$BIOS" ]; then
    code=/usr/share/edk2/x64/OVMF_CODE.4m.fd
    vars="$OUT/vm-ovmf-vars.fd"
    [ -f "$code" ] || { echo "Нужен пакет edk2-ovmf (или BIOS=1)" >&2; exit 1; }
    [ -f "$vars" ] || cp /usr/share/edk2/x64/OVMF_VARS.4m.fd "$vars"
    firmware=(-drive "if=pflash,format=raw,readonly=on,file=$code" -drive "if=pflash,format=raw,file=$vars")
fi

rtc="base=localtime"
if [ -n "$NIGHT" ]; then
    rtc="base=$(date +%Y-%m-%d)T23:00:00"
fi

echo "Образ: $ISO"
echo "Диск:  $DISK"
[ -n "$NIGHT" ] && echo "Часы ВМ: 23:00 (проверка ночной темы)"

exec qemu-system-x86_64 \
    -enable-kvm -machine q35 -cpu host -smp 4 -m 6G \
    "${firmware[@]}" \
    -rtc "$rtc" \
    -device virtio-vga-gl -display gtk,gl=on \
    -audiodev pipewire,id=snd0 -device ich9-intel-hda -device hda-duplex,audiodev=snd0 \
    -device qemu-xhci -device usb-tablet \
    -nic user,model=virtio-net-pci \
    -drive "file=$DISK,if=virtio,format=qcow2" \
    -cdrom "$ISO" -boot menu=on,order=dc
