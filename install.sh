#!/bin/sh

if command -v apk >/dev/null; then
    PKG_MANAGER="apk"
    INSTALL_CMD="apk add --allow-untrusted"
    EXT="apk"
    echo "--- Обнаружена система APK (OpenWrt 25.12+) ---"
else
    PKG_MANAGER="opkg"
    INSTALL_CMD="opkg install"
    EXT="ipk"
    echo "--- Обнаружена система OPKG (Старая версия) ---"
fi

API_URL="https://api.github.com/repos/NerealNeSkill/luci-theme-argon-config-ru/releases/latest"

install_pkg() {
    local name=$1
    local ignore_error=$2
    
    echo "Поиск компонента: $name..."
    local release_data=$(curl -s $API_URL)
    local download_url=$(echo "$release_data" | grep "browser_download_url" | grep "$name" | grep "\.$EXT" | cut -d '"' -f 4 | head -n 1)
    
    if [ -z "$download_url" ]; then
        echo "(!) Ошибка: Файл $name.$EXT не найден в последнем релизе."
        return 1
    fi

    local filename=$(basename "$download_url")
    echo "Загрузка $filename..."
    wget -q -L -O "$filename" "$download_url"
    
    echo "Установка $filename..."
    if [ "$ignore_error" = "true" ]; then
        $INSTALL_CMD "./$filename" || echo "(!) Внимание: ошибка проигнорирована."
    else
        $INSTALL_CMD "./$filename"
    fi
    
    rm -f "$filename"
}

echo "Начинаю установку Argon RU Pack..."

install_pkg "luci-theme-argon-all" "true"
install_pkg "luci-app-argon-config-all" "false"
install_pkg "luci-i18n-argon-config-ru" "false"

echo "------------------------------------------------"
echo "Применение изменений и очистка кэша..."

rm -rf /tmp/luci-indexcache /tmp/luci-modulecache
/etc/init.d/rpcd restart
/etc/init.d/uhttpd restart

echo "------------------------------------------------"
echo "Готово! Все компоненты установлены."
