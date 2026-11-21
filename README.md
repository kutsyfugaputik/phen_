<div align="center">

<img src="https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExb2p5eXJxM2I3Y2V6eGJ2cWJ6c2N0dXh5Z3J0Z3J0eGZ0cWZ2dSZlcD12MV9naWZzX3NlYXJjaCZjdD1n/3o7aD2saalBwwftBIY/giphy.gif" width="180" alt="Flowers animation" />

# ✿ phen — «Под феном»

**Мобильное приложение для клиентов салона красоты**

Небольшое приложение, объединяющее информацию об услугах салона, пользовательские записи и персональные настройки интерфейса.

[![Flutter](https://img.shields.io/badge/Flutter-3.x-54C5F8?style=flat-square&logo=flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=flat-square&logo=dart&logoColor=white)](https://dart.dev/)
[![Isar](https://img.shields.io/badge/Database-Isar-8A6CCF?style=flat-square)](https://isar.dev/)
[![Provider](https://img.shields.io/badge/State-Provider-7952B3?style=flat-square)](https://pub.dev/packages/provider)
[![License](https://img.shields.io/badge/License-Apache--2.0-9B8BC4?style=flat-square)](LICENSE)

<br/>

[О проекте](#-о-проекте) ·
[Возможности](#-возможности) ·
[Технологии](#-технологический-стек) ·
[Запуск](#-запуск-проекта) ·
[Структура](#-структура-проекта)

</div>

---

## ✿ О проекте

**phen** — клиентское мобильное приложение для салона красоты **«Под феном»**. Проект создан для того, чтобы клиент мог ознакомиться с услугами салона, работать со своими записями и взаимодействовать с интерфейсом приложения.

Приложение разработано на **Flutter** и использует локальную базу данных **Isar** для хранения пользовательских данных и записей. Управление состоянием и настройками интерфейса реализовано с помощью Provider.

Отдельное направление проекта — интеграция с Telegram-чат-ботом **«Маша»**, который предназначен для связи клиентов с персоналом салона и консультационной поддержки.

## ♡ Возможности

| Раздел | Описание |
|---|---|
| **Приветственный экран** | Стартовый экран приложения с анимированным декоративным элементом |
| **Авторизация и регистрация** | Экраны входа и создания пользовательского аккаунта |
| **Прайс-лист** | Просмотр доступных услуг салона |
| **Записи** | Просмотр сохранённых записей текущего пользователя |
| **Оформление** | Переключение цветовых тем приложения |
| **Настройки текста** | Выбор семейства шрифта и изменение масштаба текста |
| **Локальное хранение** | Работа с пользовательскими данными и записями через Isar |
| **Связь с ботом** | Поддержка отдельного Telegram-бота «Маша» |

## ✧ Интерфейс и настройки

В приложении предусмотрена настройка внешнего вида: пользователь может переключать цветовые темы, выбирать один из доступных шрифтов и менять размер текста.

Доступные семейства шрифтов, заданные в проекте:

- `Oswald`
- `PlayfairDisplay`
- `Podkova`

Переключение тем и параметров отображения выполняется через класс `SettingApp`, который управляет состоянием приложения с помощью `ChangeNotifier`.

## ⚙️ Технологический стек

| Технология | Назначение |
|---|---|
| **Flutter** | Разработка кроссплатформенного мобильного интерфейса |
| **Dart** | Основной язык программирования |
| **Provider** | Управление состоянием приложения |
| **Isar** | Локальная NoSQL-база данных |
| **path_provider** | Получение пути к каталогу документов приложения |
| **url_launcher** | Открытие внешних ссылок |
| **Cupertino Icons** | Набор интерфейсных иконок |
| **build_runner** | Генерация вспомогательного кода |
| **isar_generator** | Генерация схем Isar |

## 🚀 Запуск проекта

### Требования

Перед запуском необходимо установить:

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Dart SDK](https://dart.dev/get-dart) — входит в состав Flutter SDK
- Android Studio или Visual Studio Code
- Эмулятор Android либо физическое устройство

### 1. Клонирование репозитория

```bash
git clone https://github.com/kutsyfugaputik/phen_.git
cd phen_
```

### 2. Установка зависимостей

```bash
flutter pub get
```

### 3. Генерация кода Isar

В проекте используются генератор Isar и `build_runner`. Если сгенерированные файлы отсутствуют или требуют обновления, выполните:

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 4. Запуск приложения

Подключите устройство или запустите эмулятор, затем выполните:

```bash
flutter run
```

Для запуска в режиме отладки:

```bash
flutter run --debug
```

## 🗂 Структура проекта

```text
phen_/
│
├── android/                 # Android-конфигурация
├── ios/                     # iOS-конфигурация
│
├── assets/                  # Изображения, шрифты и ресурсы
│   ├── fonts/
│   └── works/
│
├── lib/
│   ├── components/          # Переиспользуемые UI-компоненты
│   ├── models/              # Модели данных
│   ├── pages/               # Экраны приложения
│   ├── themes/              # Темы и настройки оформления
│   └── main.dart            # Точка входа
│
├── test/                    # Тесты
│
├── pubspec.yaml             # Зависимости и ресурсы Flutter
├── pubspec.lock             # Зафиксированные версии зависимостей
├── analysis_options.yaml    # Правила статического анализа
└── LICENSE                  # Лицензия проекта
```

## ♡ Связанные проекты

| Проект | Описание |
|---|---|
| [masha_bot_for_phen](https://github.com/kutsyfugaputik/masha_bot_for_phen) | Telegram-бот «Маша» для взаимодействия клиентов и персонала салона |
| [rabenda_dezaina](https://github.com/kutsyfugaputik/rabenda_dezaina) | Серверная часть и компоненты системы салона «Под феном» (Наследник идеи и реворк)|

## 📚 Материалы разработки

- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Documentation](https://dart.dev/guides)
- [Isar Database](https://isar.dev/)
- [Provider package](https://pub.dev/packages/provider)
- [Path Provider package](https://pub.dev/packages/path_provider)

## ✦ Автор

**Гонтарева Юлия Александровна**

Разработка мобильного клиентского приложения для салона красоты «Под феном».

---

<div align="center">

<sub>made with care · Flutter & Dart</sub>

<img src="https://capsule-render.vercel.app/api?type=soft&color=gradient&height=70&section=footer" width="100%" alt="" />

</div>
