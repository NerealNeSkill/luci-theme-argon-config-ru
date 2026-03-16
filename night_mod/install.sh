#!/bin/sh

RAW_URL="https://raw.githubusercontent.com/NerealNeSkill/luci-theme-argon-config-ru/master/night_mod"

# Пути к файлам
CONF_JS="/www/luci-static/resources/view/argon-config.js"
HEADER_HTM="/usr/lib/lua/luci/view/themes/argon/header.htm"
NIGHT_CSS="/www/luci-static/argon/css/night.css"

echo "Установка Argon Night Mode..."

# Создаем бекапы, если их еще нет (.bak)
[ ! -f "${CONF_JS}.bak" ] && cp "$CONF_JS" "${CONF_JS}.bak" && echo "Бекап argon-config.js создан"
[ ! -f "${HEADER_HTM}.bak" ] && cp "$HEADER_HTM" "${HEADER_HTM}.bak" && echo "Бекап header.htm создан"

# Загружаем новые файлы
wget -qO "$NIGHT_CSS" "$RAW_URL/night.css"
wget -qO "$CONF_JS" "$RAW_URL/argon-config.js"
wget -qO "$HEADER_HTM" "$RAW_URL/header.htm"

# Сброс кэша
rm -rf /tmp/luci-indexcache /tmp/luci-modulecache
/etc/init.d/uhttpd restart

echo "Установка завершена!"
