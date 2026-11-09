CREATE TABLE IF NOT EXISTS bookings(id TEXT PRIMARY KEY, name TEXT NOT NULL, phone TEXT NOT NULL, service TEXT NOT NULL, datetime TEXT NOT NULL, promo TEXT, status TEXT NOT NULL DEFAULT 'new', note TEXT DEFAULT '', telegram_chat_id TEXT, loyalty_visits INTEGER DEFAULT 0, created_at TEXT NOT NULL);
CREATE INDEX IF NOT EXISTS bookings_date ON bookings(datetime);
CREATE TABLE IF NOT EXISTS slots(datetime TEXT PRIMARY KEY, is_open INTEGER DEFAULT 1, booking_id TEXT, FOREIGN KEY(booking_id) REFERENCES bookings(id));
CREATE TABLE IF NOT EXISTS messages(id TEXT PRIMARY KEY, booking_id TEXT, recipient TEXT, body TEXT NOT NULL, created_at TEXT NOT NULL);
CREATE TABLE IF NOT EXISTS promos(code TEXT PRIMARY KEY, discount INTEGER NOT NULL, active INTEGER DEFAULT 1);
INSERT OR IGNORE INTO promos(code,discount) VALUES('ПЕРВЫЙВЫДОХ',10),('КАСАНИЕ5',15);
