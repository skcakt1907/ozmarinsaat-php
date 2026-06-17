============================================================
ÖZMAR HAFRIYAT — KURUMSAL WEB SİTESİ
PHP + MySQL + Bootstrap 5
============================================================

KURULUM (yerel WAMP / canlı sunucu)
------------------------------------------------------------
1. Dosyaları sunucuya yükleyin
   - Tüm klasörü web kök dizinine kopyalayın (örn: public_html/)

2. Veritabanı oluşturun
   - cPanel / phpMyAdmin'de yeni bir DB oluşturun (örn: ozmarinsaat)
   - kurulum.sql dosyasını import edin
   - 7 tablo + örnek veriler otomatik yüklenir

3. Veritabanı bağlantı bilgilerini düzenleyin
   - inc/config.php dosyasını açın
   - DB_HOST, DB_NAME, DB_USER, DB_PASS değerlerini doldurun
   - SITE_URL değerini gerçek domaininizle değiştirin
     Örn: define('SITE_URL', 'https://ozmarinsaat.com');
   - Canlı sunucuda DEBUG'i false yapın

4. uploads/ klasörüne yazma izni verin
   - chmod 755 uploads/    (Linux)
   - uploads/.htaccess PHP çalıştırmayı engelliyor (güvenlik)

5. Admin paneline giriş yapın
   - URL: https://siteniz.com/admin/
   - Kullanıcı: admin
   - Şifre:    admin123
   - !!! Giriş yaptıktan sonra şifrenizi MUTLAKA değiştirin !!!
     (phpMyAdmin'den admin tablosunda password_hash() ile yeniden hash'leyin)

------------------------------------------------------------
DOSYA YAPISI
------------------------------------------------------------
ozmarinsaat-php/
├── index.php             Anasayfa
├── hakkimizda.php        Hakkımızda
├── hizmetler.php         Hizmet listesi
├── hizmet-detay.php      Tek hizmet sayfası (?slug=...)
├── projeler.php          Proje galerisi (filtreli)
├── proje-detay.php       Tek proje (?slug=...)
├── blog.php              Blog listesi
├── blog-detay.php        Tek yazı (?slug=...)
├── iletisim.php          İletişim formu + harita
│
├── inc/
│   ├── config.php        DB ve site sabitleri
│   ├── db.php            PDO bağlantısı
│   ├── helpers.php       e(), ayar(), csrf, slug...
│   ├── header.php        Top-bar + navbar
│   └── footer.php        Footer + JS
│
├── admin/
│   ├── index.php         Login
│   ├── dashboard.php     Özet sayaçlar
│   ├── hizmetler.php     Hizmet CRUD listesi
│   ├── hizmet-form.php   Hizmet ekle/düzenle
│   ├── hizmet-sil.php
│   ├── projeler.php      Proje CRUD
│   ├── proje-form.php
│   ├── proje-sil.php
│   ├── blog.php          Blog CRUD
│   ├── blog-form.php
│   ├── blog-sil.php
│   ├── referanslar.php   Referans yönetimi
│   ├── mesajlar.php      Form mesajları
│   ├── ayarlar.php       Tüm site ayarları
│   ├── logout.php
│   └── inc/
│       ├── auth.php      Session kontrolü
│       ├── crud.php      Görsel yükleme + flash
│       ├── header.php    Admin layout
│       └── footer.php
│
├── css/style.css         Tema CSS (turuncu/gri palet)
├── js/main.js            Navbar scroll efekti
├── uploads/              Yüklenen görseller (PHP engelli)
└── kurulum.sql           DB şema + örnek veri

------------------------------------------------------------
ADMIN İŞLEMLER
------------------------------------------------------------
- Hizmet/Proje/Blog/Referans → Ekle, Düzenle, Sil
- Görsel yükleme (uploads/ klasörüne) veya URL girme
- Mesajlar → Okundu işaretle, Cevapla (mailto), Sil
- Ayarlar → Site adı, iletişim, hakkımızda, sayaçlar, sosyal medya

------------------------------------------------------------
TEKNİK DETAYLAR
------------------------------------------------------------
- PHP 7.4+ (önerilen 8.x)
- MySQL 5.7+ / MariaDB
- PDO prepared statements (SQL injection koruması)
- CSRF token (form güvenliği)
- password_hash() bcrypt (admin şifre)
- XSS koruması (e() htmlspecialchars)
- Bootstrap 5.3.2 + Bootstrap Icons 1.11 (CDN)
- Google Fonts: Poppins (CDN)
- Responsive (mobil uyumlu)

------------------------------------------------------------
RENK PALETİ
------------------------------------------------------------
Birincil  : #ea7c1c (turuncu)
Vurgu     : #f5b800 (sarı)
Koyu      : #1f2937 (gri-lacivert)
Açık      : #f3f4f6 (açık gri)
- css/style.css → :root değişkenlerinden değiştirebilirsiniz

------------------------------------------------------------
DESTEK / NOTLAR
------------------------------------------------------------
- Yerel test:   http://localhost/ozmarinsaat-php/
- Canlı:        https://ozmarinsaat.com/
- Admin:        /admin/
- DB import:    phpMyAdmin → Import → kurulum.sql

İyi çalışmalar!
