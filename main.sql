-- 1. Har bir buyurtmada nechta mahsulot borligi va buyurtmaning umumiy jami narxini hisoblang.
SELECT 
    buyurtma_id,
    COUNT(mahsulot_id) AS mahsulotlar_soni,     
    SUM(jami_narx)      AS umumiy_jami_narx
FROM buyurtma_mahsulotlari
GROUP BY buyurtma_id;                  
------------------------------------------------------------

-- 2. Mahsulot ID 1 bo‘lgan mahsulot nechta marta sotilganini va umumiy daromadini aniqlang.
SELECT 
    COUNT(*) AS sotilgan_marta_soni,            
    SUM(jami_narx) AS umumiy_daromad
FROM buyurtma_mahsulotlari
WHERE mahsulot_id = 1;
------------------------------------------------------------

-- 3. Birlik narxi 1 000 000 so‘mdan yuqori bo‘lgan barcha buyurtma mahsulotlarining o‘rtacha sonini hisoblang.
SELECT 
    buyurtma_id,
    AVG(mi qdor) AS ortacha_miqdor               
FROM buyurtma_mahsulotlari
WHERE birlik_narx > 1000000
GROUP BY buyurtma_id;                      
------------------------------------------------------------

-- 4. Jami narxi eng yuqori bo‘lgan 5 ta buyurtma mahsulotini toping (buyurtma_id va mahsulot_id bilan).
SELECT buyurtma_id, mahsulot_id, jami_narx
FROM buyurtma_mahsulotlari
ORDER BY jami_narx DESC
LIMIT 5;                                
------------------------------------------------------------

-- 5. Buyurtma ID 15 dan 25 gacha bo‘lgan buyurtmalardagi mahsulotlar sonining umumiy yig‘indisini hisoblang.
SELECT 
    SUM(miqdor) AS umumiy_miqdor_15_25
FROM buyurtma_mahsulotlari
WHERE buyurtma_id BETWEEN 15 AND 25;       
------------------------------------------------------------

-- 6. Har bir mahsulot uchun nechta marta sotilganligini va o‘rtacha sotilgan sonini hisoblang, 
--    faqat 2 martadan ko‘p sotilgan mahsulotlarni ko‘rsating.
SELECT 
    mahsulot_id,
    COUNT(*) AS sotilgan_marta,                 
    AVG(miqdor) AS ortacha_sotilgan_miqdor
FROM buyurtma_mahsulotlari
GROUP BY mahsulot_id
HAVING COUNT(*) > 2                             
ORDER BY sotilgan_marta DESC;                       
