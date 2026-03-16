#!/bin/sh

# Прямая ссылка на твою папку в GitHub
RAW_URL="https://raw.githubusercontent.com/NerealNeSkill/luci-theme-argon-config-ru/master/night_mod"

echo "Установка мода 'Ночной режим' для темы Argon..."

# 1. Загрузка стилей
echo "Загрузка night.css..."
wget -qO /www/luci-static/argon/css/night.css "$RAW_URL/night.css"

# 2. Обновление настроек в интерфейсе
echo "Обновление argon-config.js..."
wget -qO /www/luci-static/resources/view/argon-config.js "$RAW_URL/argon-config.js"

# 3. Обновление шаблона темы
echo "Обновление header.htm..."
wget -qO /usr/lib/lua/luci/view/themes/argon/header.htm "$RAW_URL/header.htm"

# 4. Очистка кэша LuCI и перезагрузка сервера
echo "Очистка кэша и перезапуск uhttpd..."
rm -rf /tmp/luci-indexcache /tmp/luci-modulecache
/etc/init.d/uhttpd restart

echo "-------------------------------------------------------"
echo "Готово! Ночной режим успешно установлен."
echo "Зайдите в 'Система' -> 'Настройки Argon' и выберите 'Ночной режим'."
echo "Если изменения не видны, нажмите Ctrl+F5 в браузере."
echo "-------------------------------------------------------"
