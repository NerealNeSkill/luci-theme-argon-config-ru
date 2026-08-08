#!/bin/sh

# Определение менеджер пакетов (apk для OpenWrt 25.12+ или opkg для старых версий)
if command -v apk >/dev/null; then
    PKG_MANAGER="apk"
    REMOVE_CMD="apk del"
    echo "--- Обнаружена система APK (OpenWrt 25.12+) ---"
else
    PKG_MANAGER="opkg"
    REMOVE_CMD="opkg remove"
    echo "--- Обнаружена система OPKG (Старая версия) ---"
fi

remove_pkg() {
    local name=$1
    echo "Удаление пакета: $name..."
    $REMOVE_CMD "$name" || echo "(!) Внимание: пакет $name не найден или уже был удален."
}

echo "Начинаю удаление Argon RU Pack..."

# Удаляем в обратном порядке
remove_pkg "luci-i18n-argon-config-ru"
remove_pkg "luci-app-argon-config"
remove_pkg "luci-theme-argon"

echo "------------------------------------------------"
echo "Применение изменений и очистка кэша..."

# Очистка кэша интерфейса и перезапуск служб
rm -rf /tmp/luci-indexcache /tmp/luci-modulecache
/etc/init.d/rpcd restart
/etc/init.d/uhttpd restart

echo "------------------------------------------------"
echo "Готово! Все компоненты Argon RU Pack успешно удалены."
