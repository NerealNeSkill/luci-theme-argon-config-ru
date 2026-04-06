#!/bin/sh

# Базовый URL (проверь, что ветка master, а не main)
RAW_URL="https://raw.githubusercontent.com/NerealNeSkill/luci-theme-argon-config-ru/master/night_mod"

# Пути к файлам
CONF_JS="/www/luci-static/resources/view/argon-config.js"
HEADER_HTM="/usr/lib/lua/luci/view/themes/argon/header.htm"
NIGHT_CSS="/www/luci-static/argon/css/night.css"

echo "Установка Argon Night Mode..."

# 1. Создаем папку для CSS, если её нет
mkdir -p /www/luci-static/argon/css/

# 2. Создаем бекапы (только если их еще нет)
[ -f "$CONF_JS" ] && [ ! -f "${CONF_JS}.bak" ] && cp "$CONF_JS" "${CONF_JS}.bak" && echo "Бекап argon-config.js создан"
[ -f "$HEADER_HTM" ] && [ ! -f "${HEADER_HTM}.bak" ] && cp "$HEADER_HTM" "${HEADER_HTM}.bak" && echo "Бекап header.htm создан"

# 3. Загружаем новые файлы
echo "Загрузка файлов..."
wget -qO "$NIGHT_CSS" "$RAW_URL/night.css"
wget -qO "$CONF_JS" "$RAW_URL/argon-config.js"
wget -qO "$HEADER_HTM" "$RAW_URL/header.htm"

# 4. ВАЖНО: Устанавливаем правильные права доступа
chmod 644 "$NIGHT_CSS" "$CONF_JS" "$HEADER_HTM"
echo "Права доступа обновлены"

# 5. Сброс кэша LuCI и перезапуск сервера
rm -rf /tmp/luci-indexcache /tmp/luci-modulecache
/etc/init.d/uhttpd restart

echo "Установка завершена! Очистите кэш браузера (Ctrl+F5)."
