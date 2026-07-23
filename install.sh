#!/bin/bash
set -e

# Metodlar
echo "============================================="
echo "   Modbus360 macOS Quraşdırıcısı"
echo "============================================="

# macOS olub-olmadığını yoxlayırıq
if [ "$(uname)" != "Darwin" ]; then
    echo "Xəta: Bu skript yalnız macOS əməliyyat sistemi üçün nəzərdə tutulub."
    exit 1
fi

# Çip növünü (arxitekturanı) təyin edirik
ARCH=$(uname -m)
if [ "$ARCH" = "arm64" ]; then
    echo "Apple Silicon çipi təyin edildi (M1/M2/M3/M4)..."
    URL=$(curl -s https://api.github.com/repos/lunasoft-llc/modbus360/releases/latest | grep -o "https://[^\"]*Apple-Silicon[^\"]*\.zip" | head -n 1)
else
    echo "Intel çipi təyin edildi..."
    URL=$(curl -s https://api.github.com/repos/lunasoft-llc/modbus360/releases/latest | grep -o "https://[^\"]*Intel[^\"]*\.zip" | head -n 1)
fi

if [ -z "$URL" ]; then
    echo "Xəta: Ən son versiyanın linki tapılmadı."
    exit 1
fi

echo "Ən son versiya yüklənir..."
curl -L -o /tmp/modbus360.zip "$URL"

echo "Arxivdən çıxarılır..."
rm -rf /tmp/modbus360_extracted
mkdir -p /tmp/modbus360_extracted
unzip -o -q /tmp/modbus360.zip -d /tmp/modbus360_extracted

APP_PATH=$(find /tmp/modbus360_extracted -name "*.app" -maxdepth 2 | head -n 1)

if [ -z "$APP_PATH" ]; then
    echo "Xəta: Modbus360.app faylı tapılmadı."
    exit 1
fi

# İcazələrin idarə olunması (Applications qovluğuna yazmaq üçün)
INSTALL_DIR="/Applications"
if [ ! -w "$INSTALL_DIR" ]; then
    echo "Applications qovluğuna yazmaq üçün idarəçi (administrator) şifrəsi tələb olunur."
    SUDO="sudo"
else
    SUDO=""
fi

echo "Modbus360.app proqramı $INSTALL_DIR qovluğuna köçürülür..."
$SUDO rm -rf "$INSTALL_DIR/Modbus360.app"
$SUDO mv "$APP_PATH" "$INSTALL_DIR/Modbus360.app"

echo "macOS Gatekeeper mühafizəsi sıfırlanır (karantin etiketi silinir)..."
$SUDO xattr -cr "$INSTALL_DIR/Modbus360.app"

# Müvəqqəti faylları təmizləyirik
rm -rf /tmp/modbus360.zip /tmp/modbus360_extracted

echo "============================================="
echo "Modbus360 uğurla quraşdırıldı!"
echo "Qovluq: $INSTALL_DIR/Modbus360.app"
echo "İndi proqramı aça bilərsiniz."
echo "============================================="

open "$INSTALL_DIR/Modbus360.app"
