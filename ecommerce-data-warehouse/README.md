

Gerçekçi bir e-ticaret senaryosu üzerinden, PostgreSQL kullanılarak Star Schema veri ambarı modeli oluşturuldu. Veri yükleme stored procedure ile otomatikleştirildi ve analitik sorgularla KPI'lar hesaplandı.

---

## 🌟 Amaç

Bu projenin amacı, ileri seviye SQL ve veri modelleme yeteneklerini gösteren, gerçek bir Data Engineer sorumluluğundaki veri ambarı sistemini kurmaktır.

---

## 🛠 Kullanılan Teknolojiler

- PostgreSQL 17
    
- pgAdmin 4
    
- PL/pgSQL (Stored Procedure)
    
- CSV veri setleri (mock data)
    

---

## 🗂 Veri Modeli (Star Schema)

Bu projede bir Star Schema tasarlandı:

- **Fact Table**: `facttable` (Siparişler)
    
- **Dimension Tables**:
    
    - `products`
        
    - `customers`
        
    - `time`
        
    - `payments`
        
    - `shipments`
        
    - `campaigns`
        

---

## 📅 Veri Yükleme (Stored Procedure)

Veriler PostgreSQL'e doğrudan bir stored procedure ile yüklendi:

```
CREATE OR REPLACE PROCEDURE simple_load_csv(
	p_table_name TEXT,
	p_file_path TEXT,
	p_delimiter TEXT DEFAULT ','
) AS $$
BEGIN
	EXECUTE format('COPY %I FROM %L WITH DELIMITER %L CSV HEADER',
		p_table_name, p_file_path, p_delimiter);

	RAISE NOTICE '% satır yüklendi - Tablo: %, Dosya: %',
		FOUND, p_table_name, p_file_path;
END;
$$ LANGUAGE plpgsql;
```

**Örnek kullanım:**

```
CALL simple_load_csv('time', 'C:\\Program Files\\PostgreSQL\\17\\Datas\\time_dim.csv');
```

---

## 📊 Analitik Sorgular

Projede aşağıdaki KPI'lara yönelik sorgular geliştirildi:

1. Belirli bir tarih aralığında toplam satış ve toplam gelir
    
2. Aylara göre satış trendi
    
3. Birden fazla sipariş veren müşteri sayısı
    
4. Kampanya bazlı satış analizi
    
5. En çok satan 5 ürün kategorisi ve markası
    

Her sorgu, sistemin performansını test etmek ve iş birimi ihtiyaçlarına teknik çözümler sunmak için yazılmıştır.

---

## ✅ Sonuçlar

Bu proje, veri ambarı modelleme, SQL stored procedure yazımı, veri yükleme ve analitik sorgulama alanlarında uçtan uca yetkinlik göstermektedir. Gerçek bir veri mühendisliği görev tanımını simüle eden bu yapı, aynı zamanda ileri seviye sorgu geliştirme yeteneğini de ortaya koymaktadır.

---

## ⚙️ Kurulum

- PostgreSQL 17 yüklenmelidir
    
- .csv dosyaları sistemde belirtilen klasör yapısına uygun yerleştirilmelidir
    
- `simple_load_csv` prosedürü çalıştırılarak her tablo için veri yüklenmelidir