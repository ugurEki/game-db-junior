# Hafta 1 — Öğrendiklerim ve Yaptıklarım

**Konular:** SQL temelleri (DDL, DML, filtreleme, ilişkiler, foreign key constraint’leri) · Unity’ye giriş (Delivery Dash) · C# ortam kurulumu ve console app · Oyun tarihi (1950–70’ler)

[SQL kursu]: https://www.udemy.com/course/sql-and-postgresql/
[Unity kursu]: https://www.udemy.com/course/unitycourse/
[C# kursu]: https://www.udemy.com/course/net-core-with-ms-sql-beginner-to-expert/
[Oyun tarihi kursu]: https://www.udemy.com/course/video-game-history/

---

## Pazartesi
- PostgreSQL server’ı ve pgAdmin client’ını kurdum, ilk database’i oluşturdum. — [SQL kursu], Bölüm 12
- `CREATE TABLE` ile tablo tanımlamayı, kolonlara veri tipi atamayı (`VARCHAR`, `INTEGER`, `DATE`) ve `INSERT INTO ... VALUES` ile multi-row insert yapmayı öğrendim. — [SQL kursu], Bölüm 1, ders 2–6
- Unity Hub ve Unity 6 Editor’ü kurdum. — [Unity kursu], Bölüm 1, ders 1–3
- .NET SDK’yı ve VS Code’u (C# extension’larıyla) kurdum. — [C# kursu], Bölüm 1, ders 1–4

## Salı
- `SELECT` ile kolon seçmeyi, calculated column oluşturmayı, `AS` ile alias vermeyi ve string fonksiyonlarını (`||`, `CONCAT`, `LOWER`, `UPPER`, `LENGTH`) öğrendim. — [SQL kursu], Bölüm 1, ders 7–11
- `SELECT`, `INSERT` ve `CREATE TABLE` alıştırmalarını çözdüm. — SQLBolt [ders 1](https://sqlbolt.com/lesson/select_queries_introduction), [ders 13](https://sqlbolt.com/lesson/inserting_rows), [ders 16](https://sqlbolt.com/lesson/creating_tables)
- Editor arayüzünü (Scene, Game, Hierarchy, Inspector, Project) öğrendim; ilk C# script’imi yazıp bir GameObject’e component olarak ekledim. — [Unity kursu], Bölüm 1, ders 4–6
- Video oyunlarının erken dönemini izledim (1. kısım). — [Oyun tarihi kursu], Bölüm 1

## Çarşamba
- `WHERE` ile satır filtrelemeyi; comparison operator’leri (`=`, `<>`, `<`, `>`, `BETWEEN`), `IN` / `NOT IN`, compound koşulları (`AND`, `OR`) ve `WHERE` içinde hesaplamayı öğrendim. — [SQL kursu], Bölüm 2, ders 1–9
- `WHERE` alıştırmalarını çözdüm (`LIKE` içeren soruları atladım). — SQLBolt [ders 2](https://sqlbolt.com/lesson/select_queries_with_constraints), [ders 3](https://sqlbolt.com/lesson/select_queries_with_constraints_pt_2)
- Delivery Dash’e başladım: `Start()` / `Update()` lifecycle metotları, `transform.Translate()` ve değişkenler. — [Unity kursu], Bölüm 2, ders 1–4
- C# temel teorisini öğrendim ve ilk console app projemi oluşturdum. — [C# kursu], Bölüm 2, ders 10–13

## Perşembe
- `UPDATE ... SET ... WHERE` ve `DELETE FROM ... WHERE` ile DML işlemlerini öğrendim; `WHERE` olmadan bütün satırların etkilendiğini gördüm. — [SQL kursu], Bölüm 2, ders 10–13
- `UPDATE` ve `DELETE` alıştırmalarını çözdüm. — SQLBolt [ders 14](https://sqlbolt.com/lesson/updating_rows), [ders 15](https://sqlbolt.com/lesson/deleting_rows)
- LeetCode’da 3 Easy soru çözdüm (`WHERE`, `AND` / `OR`, `LENGTH`). — [Recyclable and Low Fat Products](https://leetcode.com/problems/recyclable-and-low-fat-products/), [Big Countries](https://leetcode.com/problems/big-countries/), [Invalid Tweets](https://leetcode.com/problems/invalid-tweets/)
- `[SerializeField]` ile değişkenleri Inspector’a açtım, `Input` ve `if` ile klavye kontrolü yazdım, `Time.deltaTime` ile hareketi frame rate’ten bağımsız yaptım. — [Unity kursu], Bölüm 2, ders 5–8
- Video oyunlarının erken dönemini izledim (2. kısım). — [Oyun tarihi kursu], Bölüm 1

## Cuma
- Veritabanı tasarımında ilişki türlerini (1-N, N-1, 1-1, N-N), primary key ve foreign key kavramlarını, `SERIAL` ile auto-increment ID’yi ve `REFERENCES` ile foreign key kolonu oluşturmayı öğrendim. — [SQL kursu], Bölüm 3, ders 1–8
- `Collider2D` ve `Rigidbody2D` ekledim; `OnCollisionEnter2D()` ile `OnTriggerEnter2D()` farkını öğrendim; Cinemachine ile follow camera kurdum. — [Unity kursu], Bölüm 2, ders 9–12
- `Console.WriteLine()` ile çıktı veren ve oyuncu adı ile seviyesini yazdıran bir console app yazdım. — [C# kursu], Bölüm 2, ders 14–15

## Cumartesi
- İlişkili tablolarda sorgu yazmayı, insert sırasında foreign key constraint’ini ve `ON DELETE` davranışlarını (`RESTRICT` / `NO ACTION`, `CASCADE`, `SET NULL`, `SET DEFAULT`) öğrendim. — [SQL kursu], Bölüm 3, ders 9–17
- `players` ve `matches` tablolarını `SERIAL PRIMARY KEY` ve `REFERENCES` ile oluşturdum; `result` kolonuna `CHECK` constraint ekledim; seed data girip farklı `ON DELETE` seçenekleriyle parent kayıt silmeyi test ettim. — Kendi çalışmam (1. Ay planı, 1. hafta cumartesi)
- Projeye sprite asset’leri import ettim, araba ve arka planı sahneye yerleştirdim. — [Unity kursu], Bölüm 2, ders 13–14
- 1970’lerin oyunlarını izledim. — [Oyun tarihi kursu], Bölüm 2

## Pazar
- Haftanın `.sql` dosyalarını GitHub repo’ma (`sql/01-temeller`) push ettim. — Kendi GitHub repo’m
- Bir mobil puzzle oyununu analiz ettim: genre, platform, monetization modeli, hedef kitle, core loop, progression sistemi ve olası oyuncu verileri (tablolar ve event’ler). — 1. Ay planı, Ek A (analiz kartı şablonu)

---

## Haftanın çıktıları
- Çalışan PostgreSQL + pgAdmin, Unity 6 ve .NET SDK ortamı
- Foreign key ile bağlı `players` – `matches` şeması (`CHECK` ve `ON DELETE` testleriyle)
- SQLBolt ve LeetCode’da yaklaşık 20 alıştırma
- Delivery Dash’te input, fizik ve collision ile çalışan araba
- İlk C# console app
- 1 oyun analiz kartı
