-- =====================================================
-- PlantBase — SQL Practice Queries
-- Section 1: Basic filtering & sorting
-- =====================================================

-- Query 1: List all toxic plants. Show common_name and toxicity_notes where is_toxic = TRUE.
SELECT common_name,
    toxicity_notes
FROM plants
WHERE is_toxic = TRUE;

-- Query 2: List all plants NOT found in Poland, (Expected result: Aloe Vera, Turmeric, Ginger).
SELECT *
FROM plants
WHERE found_in_poland = FALSE;

-- Query 3: List all plants whose latin_name ends with 'is' (e.g. Calendula officinalis).
SELECT *
FROM plants
WHERE latin_name LIKE '%is';

-- Query 4: List all plants sorted alphabetically by common_name.
SELECT *
FROM plants
ORDER by common_name;

-- Query 5: List all plants that are explicitly not toxic. Use IS NULL on toxicity_notes as the signal (contrast with Query 1).
SELECT *
FROM plants
WHERE toxicity_notes IS NULL;

-- Query 6: List all plants that bloom in a specific month. From growing_conditions, filter bloom_start_month = 6, ordered by bloom_start_month.
SELECT *
FROM plants p
JOIN growing_conditions gc ON p.id = gc.plant_id
WHERE gc.bloom_start_month = 6
ORDER BY gc.bloom_start_month;

-- =====================================================
-- Section 2: Aggregations
-- =====================================================

-- Query 7: Count how many plants belong to each family. Group by family, show family and the count, most common family first.
SELECT family, COUNT(*) AS plant_count
FROM plants
GROUP BY family
ORDER BY plant_count DESC;

-- Query 8: Count how many toxic vs non-toxic plants there are. Group by is_toxic, one row per group with the count.
SELECT is_toxic, COUNT(*) AS plant_count
FROM plants
GROUP BY is_toxic;

-- Query 9: Find the average bloom_start_month across all plants.
-- From growing_conditions, a single aggregate value (AVG), no GROUP BY needed.


-- Query 10: Count how many uses are recorded for each use_id in plant_uses.
-- Group by use_id, show use_id and how many plants have that use.


-- Query 11: Total revenue per plant (quantity_sold * price_per_package, summed).
-- From sales, group by plant_id. NOTE: requires the real plantbase.db to have
-- sales rows in it — run generate_sales.py for real (not just the throwaway
-- test copy) before this one will return anything.


-- Query 12: Total quantity sold per year.
-- From sales, extract the year from sale_date (e.g. with strftime('%Y', sale_date))
-- and group by it. Same sales-data dependency as Query 11.


-- =====================================================
-- Section 3: Joins
-- =====================================================

-- Query 13: List each plant together with all of its uses.
-- plants JOIN plant_uses JOIN uses — one row per plant/use pairing,
-- showing common_name and use_name.


-- Query 14: List each plant together with its sunlight and soil_type.
-- plants JOIN growing_conditions, showing common_name, sunlight, soil_type.


-- Query 15: List any plants that have no recorded uses at all.
-- plants LEFT JOIN plant_uses, keep only rows where the plant_uses side is
-- missing (use_id IS NULL) — the "anti-join" pattern. Expected: none right
-- now if every plant already has at least one use, which is itself a useful
-- thing to confirm.


-- Query 16: List every toxic plant together with its uses.
-- plants JOIN plant_uses JOIN uses, filtered to is_toxic = TRUE — shows that
-- a plant can be toxic (e.g. ingestion risk) and still have a legitimate
-- use (e.g. ornamental, cosmetic).


-- Query 17: Total revenue per plant, with the plant's name shown.
-- plants JOIN sales, group by plant, SUM(quantity_sold * price_per_package).
-- Same query as Query 11 but readable by name instead of plant_id — a good
-- one to compare side by side with Query 11's output. Same sales-data
-- dependency as Query 11/12.
