# МАГИЯ КАСАНИЯ

Готовый сайт и Cloudflare Worker API для репозитория GitHub. Содержимое этой папки загружайте в корень нового репозитория.

## Перед загрузкой
- В `wrangler.toml` замените `REPLACE_WITH_D1_DATABASE_ID` на ID вашей D1 базы.
- Создайте D1 базу, примените миграцию и установите секреты:

```sh
npx wrangler d1 create magic-touch
npx wrangler d1 migrations apply magic-touch --remote
npx wrangler secret put ADMIN_KEY
npx wrangler secret put TG_ADMIN_TOKEN
npx wrangler secret put TG_CLIENT_TOKEN
npx wrangler secret put ADMIN_CHAT_ID
npx wrangler secret put CLIENT_BOT_USERNAME
npx wrangler deploy
```

После создания базы впишите выданный `database_id` в `wrangler.toml`. Секреты вводите в интерактивном режиме; никогда не сохраняйте их в GitHub.

## Боты и управление
Создайте два бота через BotFather. Установите webhooks после публикации Worker, заменив домен и токены:

- `https://api.telegram.org/bot<TG_ADMIN_TOKEN>/setWebhook?url=https://ВАШ-ДОМЕН/api/telegram/admin`
- `https://api.telegram.org/bot<TG_CLIENT_TOKEN>/setWebhook?url=https://ВАШ-ДОМЕН/api/telegram/client`

Панель заявок: `https://ВАШ-ДОМЕН/api/admin`. Введите ADMIN_KEY. Для клиентских ссылок задайте `CLIENT_BOT_USERNAME` без символа `@`.

## Важно
GitHub хранит исходники; он сам не запускает API и Telegram. Для синхронизации разверните Worker на Cloudflare (например, установите Wrangler и выполните `npx wrangler deploy` из папки проекта или подключите репозиторий к Cloudflare Workers Builds). Текущая форма и API работают на одном домене. Новые ритуалы опубликованы как варианты по запросу без цены; подтвердите их длительность, цену и соответствие вашим услугам перед приёмом записей. Свободные окошки нужно добавить в таблицу D1. Политику обработки данных следует добавить до публичного запуска.

## Файлы
- `index.html`, `style.css`, `venetian-style.css`, `rituals.css` — интерфейс и мобильная стилизация.
- `hero.jpg`, `logo.jpg` — визуал и предоставленный вами логотип.
- `app.js` — форма, виджет свободных слотов и квиз.
- `worker.js` — API, панель, Telegram и напоминания.
- `migrations/0001_init.sql` — схема базы D1.
