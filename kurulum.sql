-- ============================================
-- Özmar Hafriyat — Kurulum SQL
-- Kullanım: phpMyAdmin > ozmarinsaat DB > Import
-- ============================================
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS `ozmarinsaat` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `ozmarinsaat`;

-- ============ AYARLAR ============
DROP TABLE IF EXISTS `ayarlar`;
CREATE TABLE `ayarlar` (
  `anahtar` VARCHAR(80) NOT NULL PRIMARY KEY,
  `deger` TEXT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ayarlar` (`anahtar`,`deger`) VALUES
('site_adi','Özmar Hafriyat'),
('site_baslik','Özmar Hafriyat — İnşaat, Hafriyat ve Nakliyat Çözümleri'),
('site_aciklama','Kırım işleri, betonarme yapı, bina güçlendirme, peyzaj, mantolama ve hafriyat-nakliyat hizmetlerinde güvenilir çözüm ortağınız.'),
('telefon','+90 555 000 00 00'),
('telefon2','+90 532 000 00 00'),
('mail','info@ozmarinsaat.com'),
('adres','Merkez Mah. İnşaat Cad. No:1, Şehir / İl'),
('calisma_saati','Pzt - Cmt: 08:00 - 19:00'),
('hakkimizda_kisa','Özmar Hafriyat olarak; kırım, betonarme imalat, bina güçlendirme, tadilat, peyzaj, inşaat malzemeleri tedariği ve mantolama hizmetlerinde uzman ekibimizle hizmet veriyoruz.'),
('hakkimizda_uzun','Özmar Hafriyat, yılların verdiği tecrübe ile inşaat, hafriyat ve nakliyat alanlarında profesyonel hizmet sunan bir firmadır. Kırım işlerinden betonarme yapı imalatına, bina kontrol ve danışmanlıktan güçlendirme ve tadilat işlerine, peyzaj düzenlemeden inşaat malzemeleri tedariğine, mantolama ve ısı yalıtımı uygulamalarına kadar geniş bir hizmet yelpazesinde, müşteri memnuniyetini ön planda tutan kalite anlayışıyla çalışıyoruz. Modern iş makineleri, uzman kadromuz ve titiz proje yönetimimizle her ölçekteki işi zamanında ve güvenli şekilde teslim ediyoruz.'),
('misyon','Modern ekipmanlar ve uzman ekiple; kırım, hafriyat, betonarme, güçlendirme ve mantolama hizmetlerini iş güvenliği standartlarına uygun, çevreye duyarlı ve müşteri odaklı biçimde sunmak.'),
('vizyon','Bölgenin en güvenilir ve tercih edilen inşaat-hafriyat firması olmak; teknoloji ve sürdürülebilir uygulamalarla sektöre değer katmak.'),
('yil','15'),
('proje_sayi','120'),
('musteri_sayi','350'),
('personel_sayi','40'),
('facebook','#'),('instagram','#'),('twitter','#'),('linkedin','#'),('youtube','#');

-- ============ HİZMETLER ============
DROP TABLE IF EXISTS `hizmetler`;
CREATE TABLE `hizmetler` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `baslik` VARCHAR(150) NOT NULL,
  `slug` VARCHAR(180),
  `ozet` TEXT,
  `icerik` LONGTEXT,
  `ikon` VARCHAR(60) DEFAULT 'bi-building',
  `gorsel` VARCHAR(255),
  `sira` INT DEFAULT 0,
  `durum` TINYINT DEFAULT 1,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `hizmetler` (`baslik`,`slug`,`ozet`,`icerik`,`ikon`,`gorsel`,`sira`) VALUES
('Kırım İşleri','kirim-isleri','Eski yapıların kontrollü yıkım ve kırım işlemleri; iş güvenliği standartlarında, çevreye saygılı uygulama.','Modern kırım ekipmanlarımız ve uzman operatörlerimizle; bina, beton ve duvar kırım işlerinizi planlı, güvenli ve hızlı şekilde gerçekleştiriyoruz. Çevre güvenliği, toz ve gürültü kontrolü, moloz tahliyesi dahil komple hizmet sunulur.','bi-hammer','https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=800&q=80',1),
('Betonarme Yapı İmalatı','betonarme-yapi-imalati','Konut, ticari ve endüstriyel projelerde anahtar teslim betonarme imalatı.','Temel, kolon, kiriş, döşeme, perde ve merdiven kalıplarından donatı uygulamasına ve beton dökümüne kadar tüm aşamalar deneyimli ekibimizce yürütülür. Mukavemet testleri ve kalite kontrol süreçleri ile dayanıklı yapılar inşa ediyoruz.','bi-building','https://images.unsplash.com/photo-1503387762-592deb58ef4e?w=800&q=80',2),
('Bina Kontrol ve Danışmanlık','bina-kontrol-danismanlik','Yapı denetim, proje kontrol ve teknik danışmanlık hizmetleri.','Mevcut binaların durum tespiti, statik kontrol, proje uygunluk denetimi ve yapısal danışmanlık hizmetleri sunuyoruz. Yatırımcı ve mülk sahipleri için bağımsız ve tarafsız teknik raporlar hazırlanır.','bi-clipboard-check','https://images.unsplash.com/photo-1581094794329-c8112a89af12?w=800&q=80',3),
('Bina Güçlendirmesi ve Tadilat','bina-guclendirme-tadilat','Deprem yönetmeliğine uygun bina güçlendirme ve kapsamlı tadilat işleri.','Karbon fiber, mantolama, çelik plaka, jet grout ve perde takviyesi gibi modern güçlendirme yöntemleriyle binalarınızı deprem yönetmeliğine uygun hale getiriyoruz. İç ve dış tadilat işleri anahtar teslim.','bi-shield-check','https://images.unsplash.com/photo-1504917595217-d4dc5ebe6122?w=800&q=80',4),
('Peyzaj Düzenleme','peyzaj-duzenleme','Bahçe, site ve çevre düzenleme; profesyonel peyzaj uygulamaları.','Site, villa, ticari işletme ve kamu alanları için peyzaj projelendirme ve uygulama hizmeti. Çim, bitki dikimi, sulama sistemleri, taş kaplama, aydınlatma ve süs havuzu uygulamaları.','bi-tree','https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=800&q=80',5),
('İnşaat Malzemeleri Tedariği','insaat-malzemeleri-tedarigi','İnşaat projeleriniz için kaliteli malzeme tedariği ve lojistik.','Çimento, demir, agrega, izolasyon malzemeleri, prefabrik elemanlar ve yapı kimyasalları dahil kapsamlı tedarik. Güvenilir markalardan, rekabetçi fiyatlarla, zamanında teslimat.','bi-truck','https://images.unsplash.com/photo-1473445730015-841f29a9490b?w=800&q=80',6),
('Mantolama ve Isı Yalıtımı','mantolama-isi-yalitimi','Dış cephe mantolama, ısı ve ses yalıtımı uygulamaları.','EPS, XPS, taşyünü ve cam yünü ile profesyonel mantolama uygulamaları. Enerji tasarrufu, iç konfor ve dış cephe dayanıklılığı sağlayan çözümler. Garanti kapsamında uygulanır.','bi-thermometer-sun','https://images.unsplash.com/photo-1503387762-592deb58ef4e?w=800&q=80',7);

-- ============ PROJELER ============
DROP TABLE IF EXISTS `projeler`;
CREATE TABLE `projeler` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `baslik` VARCHAR(150) NOT NULL,
  `slug` VARCHAR(180),
  `kategori` VARCHAR(60),
  `gorsel` VARCHAR(255),
  `aciklama` TEXT,
  `tarih` VARCHAR(40),
  `sira` INT DEFAULT 0,
  `durum` TINYINT DEFAULT 1,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `projeler` (`baslik`,`slug`,`kategori`,`gorsel`,`aciklama`,`tarih`,`sira`) VALUES
('Kentsel Dönüşüm Yıkım Projesi','kentsel-donusum-yikim','Hafriyat','https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=800&q=80','8 katlı bina kontrollü yıkım ve moloz tahliyesi','2025',1),
('Konut Sitesi Betonarme İmalat','konut-sitesi-betonarme','İnşaat','https://images.unsplash.com/photo-1503387762-592deb58ef4e?w=800&q=80','4 bloklu konut projesi betonarme imalatı','2025',2),
('Hafriyat ve Temel Kazı','hafriyat-temel-kazi','Hafriyat','https://images.unsplash.com/photo-1565793979206-6d57f4f4cdaa?w=800&q=80','Ticari yapı için 12.000 m³ hafriyat ve nakliyat','2024',3),
('Okul Binası Güçlendirme','okul-binasi-guclendirme','İnşaat','https://images.unsplash.com/photo-1504917595217-d4dc5ebe6122?w=800&q=80','Karbon fiber ile depreme dayanım güçlendirmesi','2024',4),
('Villa Bahçe Peyzajı','villa-bahce-peyzaj','İnşaat','https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=800&q=80','1.200 m² peyzaj ve sulama sistemi uygulaması','2025',5),
('Apartman Mantolama','apartman-mantolama','İnşaat','https://images.unsplash.com/photo-1486325212027-8081e485255e?w=800&q=80','12 katlı apartman dış cephe mantolama','2025',6),
('Endüstriyel Tesis Nakliyatı','endustriyel-tesis-nakliyat','Nakliyat','https://images.unsplash.com/photo-1473445730015-841f29a9490b?w=800&q=80','Fabrika makine ve ekipman nakliye organizasyonu','2024',7),
('Tadilat ve Dekorasyon','tadilat-dekorasyon','İnşaat','https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?w=800&q=80','Ofis komple tadilat ve iç dekorasyon','2024',8),
('Yol Hafriyatı','yol-hafriyat','Hafriyat','https://images.unsplash.com/photo-1448630360428-65456885c650?w=800&q=80','Belediye yol hafriyatı ve dolgu işleri','2025',9);

-- ============ BLOG ============
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `baslik` VARCHAR(200) NOT NULL,
  `slug` VARCHAR(200),
  `kategori` VARCHAR(60),
  `ozet` TEXT,
  `icerik` LONGTEXT,
  `gorsel` VARCHAR(255),
  `tarih` DATE,
  `durum` TINYINT DEFAULT 1,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `blog` (`baslik`,`slug`,`kategori`,`ozet`,`icerik`,`gorsel`,`tarih`) VALUES
('Kırım İşlerinde İş Güvenliği Esasları','kirim-is-guvenligi','Hafriyat','Kontrollü yıkımda toz, gürültü ve düşme risklerine karşı alınması gereken önlemler.','Kontrollü kırım operasyonlarında iş güvenliği, çevre güvenliği ile bütünleşik planlanmalıdır. Saha taraması, KKD kullanımı, toz bastırma ve moloz tahliye prosedürleri kritik önem taşır.','https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=800&q=80','2026-04-12'),
('Bina Güçlendirmede Karbon Fiber','bina-guclendirme-karbon-fiber','İnşaat','Karbon fiber takviyesi ile depreme dayanıklılığı artırmanın avantajları.','Karbon fiber kompozitler (CFRP), düşük ağırlık ve yüksek çekme dayanımı sayesinde mevcut binalarda kolon, kiriş ve perdelerin güçlendirilmesinde tercih edilir. Uygulama hızlıdır ve yapı yüküne ek getirmez.','https://images.unsplash.com/photo-1504917595217-d4dc5ebe6122?w=800&q=80','2026-03-28'),
('Mantolama Çeşitleri ve Avantajları','mantolama-cesitleri','İnşaat','EPS, XPS ve taşyünü mantolama sistemlerinin karşılaştırması.','Mantolama; ısıtma-soğutma maliyetlerini düşürür, yoğuşmayı engeller ve dış cepheyi korur. Doğru malzeme seçimi iklim, bina tipi ve bütçeye göre yapılmalıdır.','https://images.unsplash.com/photo-1503387762-592deb58ef4e?w=800&q=80','2026-03-10'),
('Hafriyat ve Çevre Sorumluluğu','hafriyat-cevre-sorumlulugu','Hafriyat','Hafriyat atıklarının yönetimi ve geri dönüşüm imkanları.','Hafriyat ve yıkım atıkları (HYA), uygun döküm sahalarına nakliyesi ve geri kazanım süreçleri ile çevreye zarar vermeden yönetilebilir.','https://images.unsplash.com/photo-1448630360428-65456885c650?w=800&q=80','2026-02-22'),
('Peyzaj Projesinde Sulama Sistemleri','peyzaj-sulama-sistemleri','Peyzaj','Damla sulama ve otomatik sistemlerle su tasarrufu.','Modern sulama sistemleri, peyzaj alanında su israfını önlerken bitki sağlığını da garanti altına alır. Zamanlayıcılı sistemler bakım yükünü azaltır.','https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=800&q=80','2026-02-05'),
('Betonarme Kalıp Sistemleri','betonarme-kalip-sistemleri','İnşaat','Modern kalıp sistemlerinin iş hızı ve kalitesine etkisi.','Tünel kalıp, tırmanır kalıp ve modüler kalıp sistemleri; betonarme imalatta hız, işçilik ve yüzey kalitesini doğrudan etkiler.','https://images.unsplash.com/photo-1486325212027-8081e485255e?w=800&q=80','2026-01-20');

-- ============ REFERANSLAR ============
DROP TABLE IF EXISTS `referanslar`;
CREATE TABLE `referanslar` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `ad` VARCHAR(100) NOT NULL,
  `unvan` VARCHAR(120),
  `yorum` TEXT,
  `foto` VARCHAR(255),
  `yildiz` TINYINT DEFAULT 5,
  `durum` TINYINT DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `referanslar` (`ad`,`unvan`,`yorum`,`foto`,`yildiz`) VALUES
('Hasan Aydın','Müteahhit','Hafriyat ve kırım işlerimizde tam zamanında ve titiz çalıştılar. Ekipman parkı güçlü, ekip disiplinli.','https://i.pravatar.cc/100?img=12',5),
('Aylin Kaya','Mimar','Betonarme uygulamada projeye sadık kaldılar. Kalıp ve donatı işçiliği örnek seviyede.','https://i.pravatar.cc/100?img=32',5),
('Murat Şahin','Site Yöneticisi','Apartman mantolama işimizi söz verdikleri sürede teslim ettiler. İletişim ve temizlik mükemmeldi.','https://i.pravatar.cc/100?img=15',5);

-- ============ MESAJLAR ============
DROP TABLE IF EXISTS `mesajlar`;
CREATE TABLE `mesajlar` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `ad` VARCHAR(100),
  `mail` VARCHAR(150),
  `tel` VARCHAR(40),
  `konu` VARCHAR(200),
  `mesaj` TEXT,
  `okundu` TINYINT DEFAULT 0,
  `tarih` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============ TEKLİFLER ============
DROP TABLE IF EXISTS `teklifler`;
CREATE TABLE `teklifler` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `ad` VARCHAR(100),
  `mail` VARCHAR(150),
  `tel` VARCHAR(40),
  `hizmet` VARCHAR(120),
  `il` VARCHAR(60),
  `adres` VARCHAR(255),
  `alan` VARCHAR(60),
  `butce` VARCHAR(60),
  `baslangic` VARCHAR(60),
  `detay` TEXT,
  `durum` ENUM('yeni','degerlendiriliyor','teklif_verildi','kazanildi','kaybedildi') DEFAULT 'yeni',
  `notlar` TEXT,
  `tarih` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============ ADMIN ============
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `kullanici` VARCHAR(60) NOT NULL UNIQUE,
  `sifre_hash` VARCHAR(255) NOT NULL,
  `ad_soyad` VARCHAR(120),
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Şifre: admin123  (password_hash bcrypt)
INSERT INTO `admin` (`kullanici`,`sifre_hash`,`ad_soyad`) VALUES
('admin','$2y$10$6gNrpOXRLof.Toy.Ugy.yu4DrKP23OcnJa7UBhKOH1iMxbtH8GK0.','Özmar Yönetici');

SET FOREIGN_KEY_CHECKS = 1;
