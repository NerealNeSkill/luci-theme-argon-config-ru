[license]: /LICENSE
[license-badge]: https://img.shields.io/github/license/NerealNeSkill/luci-theme-argon-config-ru?label=Лицензия&style=flat-square&color=415fcf&cacheSeconds=3600
[download]: https://github.com/NerealNeSkill/luci-theme-argon-config-ru/releases
[download-badge]: https://img.shields.io/github/downloads/NerealNeSkill/luci-theme-argon-config-ru/total?label=Скачивания&style=flat-square&color=28a745
[contact]: https://t.me/NerealNeSkill
[contact-badge]: https://img.shields.io/badge/Контакт-telegram-1d8fcf?style=flat-square
[star-badge]: https://img.shields.io/github/stars/NerealNeSkill/luci-theme-argon-config-ru?label=Stars&logo=reverbnation&logoColor=FFD100&style=flat-square&color=6f42c1


<div align="center"><img src="https://raw.githubusercontent.com/jerrykuku/staff/master/argon_title4.svg">



# Тема Argon и плагин настройки темы

**Чистая и аккуратная тема LuCI для OpenWrt. Плагин позволяет настраивать размытие и прозрачность страницы входа темы Argon, а также управлять фоновыми изображениями и видео.**


[![license][license-badge]][license]
[![download][download-badge]][download]
[![contact][contact-badge]][contact]
[![stars][star-badge]](https://github.com/NerealNeSkill/luci-theme-argon-config-ru/stargazers)


<img src="https://raw.githubusercontent.com/jerrykuku/staff/master/argon2.gif">
</div>



<div align="center">
  
## ⚡ Быстрая установка (Рекомендуется)

**Вам не нужно скачивать файлы вручную. Просто скопируйте эту команду и вставьте её в терминал (SSH) вашего роутера. Скрипт сам определит тип системы (**APK** или **IPK**) и установит нужные компоненты.**

```bash

sh -c "$(curl -sL https://raw.githubusercontent.com/NerealNeSkill/luci-theme-argon-config-ru/master/install.sh)"
```

</div>

***Что устанавливается:***

🔹 **luci-theme-argon** — Современная и гибкая тема оформления.

🔹 **luci-app-argon-config** — Плагин для настройки фонов, цветов и эффектов темы.

🔹 **luci-i18n-argon-config-ru** — Перевод интерфейса настроек на русский язык.

<div align="center">

## 🗑️ Быстрое удаление (Рекомендуется)

**Для полного удаления темы Argon и всех связанных компонентов просто скопируйте эту команду и вставьте её в терминал (SSH) вашего роутера. Скрипт сам определит тип системы (APK или OPKG) и зачистит все следы.**

```bash

sh -c "$(curl -sL https://raw.githubusercontent.com/NerealNeSkill/luci-theme-argon-config-ru/master/uninstall.sh)"
```


</div>

***Что будет сделано:***

🔻 **Удаление компонентов** — Безопасное удаление темы, плагина и русской локализации.  

🔻 **Очистка кэша** — Полный сброс кэша интерфейса LuCI.  

🔻 **Перезапуск служб** — Автоматический возврат на стандартную тему без перезагрузки роутера.

---

<div align="center">

## 📦 Ручная установка Argon Theme

</div>

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


---

<div align="center">

## 🛠️ Ручная установка Argon Config

</div>

### Для систем с менеджером пакетов OPKG (IPK)



1. **Сначала установите основной пакет (`all.ipk` версия) в зависимости от того, где находится файл. Если Вы загрузили пакет в папку /tmp**

```bash

opkg install /tmp/luci-app-argon-config-all.ipk
```

2. **Установите пакет локализации (например, `ru.ipk` версию), чтобы интерфейс отображался корректно.**



```bash

opkg install /tmp/luci-i18n-argon-config-ru.ipk
```

> **Примечание:** Если при установке `all` версии возникнет ошибка — просто игнорируйте её и продолжайте установку локализации.


---



### Для систем с менеджером пакетов APK (Новые версии OpenWrt)



1. **Сначала установите основной пакет (`all.apk` версия), с флагом. Если Вы загрузили пакет в папку /tmp**

```bash

apk add --allow-untrusted /tmp/luci-app-argon-config-all.apk

```

2. **Установите пакет локализации (например, `ru.apk` версию), чтобы интерфейс отображался корректно.**

```bash

apk add --allow-untrusted /tmp/luci-i18n-argon-config-ru.apk

```



---



## Связанные проекты

* [luci-theme-argon](https://github.com/jerrykuku/luci-theme-argon) — Оригинальная тема Argon.

* [luci-app-argon-config](https://github.com/jerrykuku/luci-app-argon-config) — Плагин настройки темы Argon.

* [openwrt-package](https://github.com/NerealNeSkill?tab=repositories) — Мой репозиторий пакетов OpenWrt.
