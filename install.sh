#!/bin/sh

# 1. Определяем систему (APK или OPKG)
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

# Ссылка релиза
API_URL="https://api.github.com/repos/NerealNeSkill/luci-theme-argon-config-ru/releases/tags/1.0"

# Функция для поиска, скачивания и установки
install_pkg() {
    local name=$1
    local ignore_error=$2
    
    echo "Поиск компонента: $name..."
    local download_url=$(curl -s $API_URL | grep "browser_download_url" | grep "$name" | grep "\.$EXT" | cut -d '"' -f 4 | head -n 1)
    
    if [ -z "$download_url" ]; then
        echo "(!) Ошибка: Файл $name.$EXT не найден в релизе 1.0"
        return 1
    fi

    local filename=$(basename "$download_url")
    echo "Загрузка $filename..."
    wget -qO "$filename" "$download_url"
    
    echo "Установка $filename..."
    if [ "$ignore_error" = "true" ]; then
        $INSTALL_CMD "./$filename" || echo "(!) Внимание: ошибка проигнорирована."
    else
        $INSTALL_CMD "./$filename"
    fi
    
    rm -f "$filename"
}

# --- ПОСЛЕДОВАТЕЛЬНОСТЬ УСТАНОВКИ ---

echo "Начинаю установку Argon RU Pack (v1.0)..."

install_pkg "luci-theme-argon-all" "true"
install_pkg "luci-app-argon-config-all" "false"
install_pkg "luci-i18n-argon-config-ru" "false"

echo "------------------------------------------------"
echo "Применение изменений и очистка кэша..."

# Очистка кэша LuCI и перезапуск служб
rm -rf /tmp/luci-indexcache /tmp/luci-modulecache
/etc/init.d/rpcd restart
/etc/init.d/uhttpd restart

echo "------------------------------------------------"
echo "Готово! Тема и конфиг установлены."
echo "Если настройки не появились, обновите страницу в браузере (Ctrl+F5)."
