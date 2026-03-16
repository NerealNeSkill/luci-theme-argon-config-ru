#!/bin/sh

echo "Возврат к стоковым настройкам Argon..."

CONF_JS="/www/luci-static/resources/view/argon-config.js"
HEADER_HTM="/usr/lib/lua/luci/view/themes/argon/header.htm"
NIGHT_CSS="/www/luci-static/argon/css/night.css"

# Восстанавливаем из бекапов
if [ -f "${CONF_JS}.bak" ]; then
    mv "${CONF_JS}.bak" "$CONF_JS"
    echo "Восстановлен argon-config.js"
fi

if [ -f "${HEADER_HTM}.bak" ]; then
    mv "${HEADER_HTM}.bak" "$HEADER_HTM"
    echo "Восстановлен header.htm"
fi

# Удаляем созданный CSS мода
[ -f "$NIGHT_CSS" ] && rm "$NIGHT_CSS"

# Сброс кэша
rm -rf /tmp/luci-indexcache /tmp/luci-modulecache
/etc/init.d/uhttpd restart

echo "Откат завершен. Настройки возвращены в исходное состояние."
