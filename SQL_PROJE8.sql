-- === 0) TABLOYU OLUŞTUR
DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
  id        INTEGER PRIMARY KEY,
  name      VARCHAR(50) NOT NULL,
  birthday  DATE,
  email     VARCHAR(100) UNIQUE
);

-- === 1) DIŞARIDAN CSV KULLANMADAN 50 SATIR EKLE
-- dvdrental.customer'dan veriyi türetiyoruz
INSERT INTO employee (id, name, birthday, email)
SELECT
    c.customer_id AS id,
    LEFT(c.first_name || ' ' || c.last_name, 50) AS name,
    -- Geçerli bir doğum tarihi üret (1970..1999 arası)
    make_date(1970 + (c.customer_id % 30),
              1 + (c.customer_id % 12),
              1 + (c.customer_id % 28))          AS birthday,
    LOWER(REGEXP_REPLACE(c.email, '\s+', '', 'g')) AS email
FROM customer c
ORDER BY c.customer_id
LIMIT 50;

-- Kontrol
SELECT COUNT(*) AS eklendi FROM employee;
SELECT * FROM employee ORDER BY id LIMIT 5;

-- === 2) 5 ADET UPDATE
-- U1) id'si 10'un katı olanların e-posta domainini example.com yap
UPDATE employee
SET email = regexp_replace(email, '@.*$', '@example.com')
WHERE id % 10 = 0;

-- U2) adı 'A' ile başlayanların birthday’ini 2000-01-01 yap
UPDATE employee
SET birthday = DATE '2000-01-01'
WHERE name ILIKE 'A%';

-- U3) 1990’dan önce doğanların isimlerine ' (Sr)' eki
UPDATE employee
SET name = name || ' (Sr)'
WHERE birthday < DATE '1990-01-01';

-- U4) gmail kullananların adını Title Case yap
UPDATE employee
SET name = initcap(name)
WHERE email ILIKE '%@gmail.%';

-- U5) tüm e-postaları küçük harfe normalize et
UPDATE employee
SET email = lower(email)
WHERE email <> lower(email);

-- === 3) 5 ADET DELETE
-- D1) example.com alanlıları sil
DELETE FROM employee
WHERE email ILIKE '%@example.com';

-- D2) doğum tarihi boş olanları sil
DELETE FROM employee
WHERE birthday IS NULL;

-- D3) adı 3'ten kısa olanları sil
DELETE FROM employee
WHERE length(name) < 3;

-- D4) gelecekte doğum tarihli olanları sil
DELETE FROM employee
WHERE birthday > CURRENT_DATE;

-- D5) e-postası çok kabaca geçersiz görünenleri sil
DELETE FROM employee
WHERE email NOT LIKE '%@%.__%';

-- === 4) RAPORLAR
SELECT COUNT(*) AS kalan FROM employee;

SELECT split_part(email,'@',2) AS domain, COUNT(*) AS adet
FROM employee
GROUP BY 1
ORDER BY 2 DESC;

SELECT MIN(birthday) AS min_bday, MAX(birthday) AS max_bday
FROM employee;
