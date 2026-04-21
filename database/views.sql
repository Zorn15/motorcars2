-- ============================================================
-- 1. VISTA: view_cars_with_brand
--    Une la tabla cars con brands para exponer toda la info
--    del vehículo junto con el nombre y país de su marca.
-- ============================================================

CREATE OR REPLACE VIEW view_cars_with_brand AS
SELECT
    c.id              AS car_id,
    c.model,
    c.year,
    c.mileage,
    c.price,
    c.fuel_type,
    c.transmission,
    c.description,
    c.whatsapp,
    c.image_url,
    c.created_at,
    b.id              AS brand_id,
    b.name            AS brand_name,
    b.country         AS brand_country,
    b.logo_url        AS brand_logo
FROM cars c
INNER JOIN brands b ON c.brand_id = b.id;

-- Uso:
-- SELECT * FROM view_cars_with_brand;
-- SELECT * FROM view_cars_with_brand WHERE brand_name = 'Tesla';


-- ============================================================
-- 2. CONSULTA AUXILIAR: Conteo de vehículos por marca
--    Muestra cuántos vehículos están registrados por cada marca,
--    ordenados de mayor a menor cantidad.
-- ============================================================

CREATE OR REPLACE VIEW view_cars_count_by_brand AS
SELECT
    b.id              AS brand_id,
    b.name            AS brand_name,
    COUNT(c.id)       AS total_cars
FROM brands b
LEFT JOIN cars c ON b.id = c.brand_id
GROUP BY b.id, b.name
ORDER BY total_cars DESC;

-- Uso:
-- SELECT * FROM view_cars_count_by_brand;
-- SELECT * FROM view_cars_count_by_brand WHERE total_cars > 0;


-- ============================================================
-- 3. CONSULTA AUXILIAR: Vehículo más reciente por marca
--    Retorna el vehículo añadido más recientemente (created_at)
--    para cada marca registrada.
-- ============================================================

CREATE OR REPLACE VIEW view_latest_car_by_brand AS
SELECT DISTINCT ON (b.id)
    b.id              AS brand_id,
    b.name            AS brand_name,
    c.id              AS car_id,
    c.model,
    c.year,
    c.price,
    c.fuel_type,
    c.image_url,
    c.created_at
FROM brands b
INNER JOIN cars c ON b.id = c.brand_id
ORDER BY b.id, c.created_at DESC;

-- Uso:
-- SELECT * FROM view_latest_car_by_brand;
-- SELECT * FROM view_latest_car_by_brand ORDER BY created_at DESC;


-- ============================================================
-- 4. CONSULTA AUXILIAR: Rango de precios por tipo de combustible
--    Muestra precio mínimo, máximo, promedio y total de vehículos
--    agrupados por tipo de combustible.
-- ============================================================

CREATE OR REPLACE VIEW view_price_range_by_fuel AS
SELECT
    fuel_type,
    COUNT(id)                        AS total_cars,
    MIN(price)                       AS precio_minimo,
    MAX(price)                       AS precio_maximo,
    ROUND(AVG(price), 2)             AS precio_promedio
FROM cars
GROUP BY fuel_type
ORDER BY precio_promedio DESC;

-- Uso:
-- SELECT * FROM view_price_range_by_fuel;
-- SELECT * FROM view_price_range_by_fuel WHERE fuel_type = 'Eléctrico';


-- ============================================================
-- VERIFICACIÓN: Listar todas las vistas creadas en el esquema
-- ============================================================

-- SELECT table_name AS vista
-- FROM information_schema.views
-- WHERE table_schema = 'public'
-- ORDER BY table_name;
