[license]: /LICENSE
[license-badge]: https://img.shields.io/github/license/NerealNeSkill/luci-theme-argon-config-ru?label=Лицензия&style=flat-square
[download]: https://github.com/jerrykuku/luci-app-argon-config/releases
[download-badge]: https://img.shields.io/github/downloads/NerealNeSkill/luci-theme-argon-config-ru/total?label=Скачивания&style=flat-square
[contact]: https://t.me/NerealNeSkill
[contact-badge]: https://img.shields.io/badge/Контакт-telegram-blue?style=flat-square



<div align="center"><img src="https://raw.githubusercontent.com/jerrykuku/staff/master/argon_title4.svg">



# Тема Argon и плагин настройки темы

Чистая и аккуратная тема LuCI для OpenWrt. Плагин позволяет настраивать размытие и прозрачность страницы входа темы Argon, а также управлять фоновыми изображениями и видео.


[![license][license-badge]][license]
[![download][download-badge]][download]
[![contact][contact-badge]][contact]


<img src="https://raw.githubusercontent.com/jerrykuku/staff/master/argon2.gif">
</div>




## ⚡ Быстрая установка (Рекомендуется)

Вам не нужно скачивать файлы вручную. Просто скопируйте эту команду и вставьте её в терминал (SSH) вашего роутера. Скрипт сам определит тип системы (**APK** или **IPK**) и установит нужные компоненты.

```bash

sh -c "$(curl -sL https://raw.githubusercontent.com/NerealNeSkill/luci-theme-argon-config-ru/master/install.sh)"
```


***Что устанавливается:***

🔹 luci-theme-argon — Современная и гибкая тема оформления.

🔹 luci-app-argon-config — Плагин для настройки фонов, цветов и эффектов темы.

🔹 luci-i18n-argon-config-ru — Полный перевод интерфейса настроек на русский язык.

</div>

## 📦 Ручная установка Argon Theme


### Для систем с менеджером пакетов OPKG (IPK)


**Установите основной пакет (`all.ipk` версия) в зависимости от того, где находится файл. Если Вы загрузили пакет в папку /tmp**

```bash

opkg install /tmp/luci-theme-argon-all.ipk
```


### Для систем с менеджером пакетов APK (Новые версии OpenWrt)



**Установите основной пакет (`all.apk` версия) в зависимости от того, где находится файл. Если Вы загрузили пакет в папку /tmp**

```bash

apk add --allow-untrusted /tmp/luci-theme-argon-all.apk

```

</div>

## 🛠️ Ручная установка Argon Config



### Для систем с менеджером пакетов OPKG (IPK)



1. **Сначала установите основной пакет (`all` версия) в зависимости от того, где находится файл. Если Вы загрузили пакет в папку /tmp**

```bash

opkg install /tmp/luci-app-argon-config-all.ipk
```

2. **Установите пакет локализации (например, `ru` версию), чтобы интерфейс отображался корректно.**



```bash

opkg install /tmp/luci-i18n-argon-config-ru.ipk
```

> **Примечание:** Если при установке `all` версии возникнет ошибка — просто игнорируйте её и продолжайте установку локализации.


---



### Для систем с менеджером пакетов APK (Новые версии OpenWrt)



1. **Сначала установите основной пакет (`all` версия), с флагом. Если Вы загрузили пакет в папку /tmp**

```bash

apk add --allow-untrusted /tmp/luci-app-argon-config-all.apk

```

2. **Установите пакет локализации (например, `ru` версию), чтобы интерфейс отображался корректно.**

```bash

apk add --allow-untrusted /tmp/luci-i18n-argon-config-ru.apk

```



---



## Связанные проекты

* [luci-theme-argon](https://github.com/jerrykuku/luci-theme-argon) — Оригинальная тема Argon.

* [luci-app-argon-config](https://github.com/jerrykuku/luci-app-argon-config) — Плагин настройки темы Argon.

* [openwrt-package](https://github.com/NerealNeSkill?tab=repositories) — Мой репозиторий пакетов OpenWrt.
