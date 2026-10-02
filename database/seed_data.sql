INSERT INTO plants (
        common_name,
        latin_name,
        family,
        found_in_poland,
        plant_description,
        is_toxic,
        toxicity_notes
    )
VALUES (
        'Chamomile',
        'Matricaria chamomilla',
        'Asteraceae',
        TRUE,
        'A daisy-like plant widely used for its calming tea and anti-inflammatory properties.',
        FALSE,
        NULL
    ),
    (
        'Lavender',
        'Lavandula angustifolia',
        'Lamiaceae',
        TRUE,
        'An aromatic shrub used in essential oils, teas, and as an ornamental plant.',
        FALSE,
        NULL
    ),
    (
        'Thyme',
        'Thymus vulgaris',
        'Lamiaceae',
        TRUE,
        'A low, fragrant Mediterranean herb widely cultivated for cooking and herbal teas; also used traditionally for coughs.',
        FALSE,
        NULL
    ),
    (
        'Peppermint',
        'Mentha x piperita',
        'Lamiaceae',
        TRUE,
        'A hybrid mint valued for its cooling menthol flavor, commonly used in teas and for digestive complaints.',
        FALSE,
        NULL
    ),
    (
        'St. John''s Wort',
        'Hypericum perforatum',
        'Hypericaceae',
        TRUE,
        'A wildflower common across Poland, traditionally used for mood support; can increase skin sensitivity to sunlight and interacts with many medications.',
        FALSE,
        NULL
    ),
    (
        'Stinging Nettle',
        'Urtica dioica',
        'Urticaceae',
        TRUE,
        'A common wild plant whose fresh leaves cause a stinging skin reaction on contact, but which becomes safe and nutritious once cooked or dried, used in soups and teas.',
        TRUE,
        'Fresh leaves and stems bear tiny hairs that inject irritants on contact, causing a stinging rash; harmless once cooked or dried.'
    ),
    (
        'Dandelion',
        'Taraxacum officinale',
        'Asteraceae',
        TRUE,
        'An extremely common wild plant with edible leaves, flowers, and root, used in salads, teas, and as a coffee substitute.',
        FALSE,
        NULL
    ),
    (
        'Sage',
        'Salvia officinalis',
        'Lamiaceae',
        TRUE,
        'A Mediterranean shrub widely grown as a culinary and medicinal herb, valued for its savory flavor and traditional use for sore throats.',
        FALSE,
        NULL
    ),
    (
        'Valerian',
        'Valeriana officinalis',
        'Caprifoliaceae',
        TRUE,
        'A perennial plant common in damp meadows across Poland, best known for its root''s traditional use as a mild sleep aid.',
        FALSE,
        NULL
    ),
    (
        'Calendula',
        'Calendula officinalis',
        'Asteraceae',
        TRUE,
        'A bright orange-flowered plant widely grown in gardens, valued for its use in skincare products and soothing teas.',
        FALSE,
        NULL
    ),
    (
        'Elderberry',
        'Sambucus nigra',
        'Adoxaceae',
        TRUE,
        'A common shrub whose ripe, cooked berries are used for syrups and jams; raw or unripe berries, along with the leaves and stems, contain compounds that can cause nausea.',
        TRUE,
        'Raw or unripe berries and other plant parts contain cyanogenic compounds that can cause nausea and digestive upset if eaten uncooked; ripe berries are safe once cooked.'
    ),
    (
        'Lily of the Valley',
        'Convallaria majalis',
        'Asparagaceae',
        TRUE,
        'A woodland plant with fragrant white bell-shaped flowers, popular as an ornamental garden plant and a classic fragrance note in perfumery; sold as a cut flower and in fragrance products, not for consumption.',
        TRUE,
        'All parts of the plant, especially the berries, contain cardiac glycosides; ingestion can cause nausea, irregular heartbeat, and in severe cases death.'
    ),
    (
        'Comfrey',
        'Symphytum officinale',
        'Boraginaceae',
        TRUE,
        'A leafy plant common in damp meadows and riverbanks, traditionally made into topical ointments and balms for bruises and skin healing.',
        TRUE,
        'Contains pyrrolizidine alkaloids that can cause liver damage if ingested; safe for external/topical use only, never taken orally.'
    ),
    (
        'Aloe Vera',
        'Aloe vera',
        'Asphodelaceae',
        FALSE,
        'A succulent native to arid regions of the Arabian Peninsula, grown as a houseplant in Poland; its leaf gel is widely used in skincare and soothing products.',
        FALSE,
        NULL
    ),
    (
        'Turmeric',
        'Curcuma longa',
        'Zingiberaceae',
        FALSE,
        'A tropical rhizome native to South and Southeast Asia, used as a spice and for its anti-inflammatory properties; imported rather than grown locally.',
        FALSE,
        NULL
    ),
    (
        'Ginger',
        'Zingiber officinale',
        'Zingiberaceae',
        FALSE,
        'A tropical rhizome native to Southeast Asia, widely used in cooking and herbal teas for digestive support; imported rather than grown in Poland''s climate.',
        FALSE,
        NULL
    );
INSERT INTO uses (use_name)
VALUES ('Culinary'),
    ('Cosmetic'),
    ('Aromatic'),
    ('Medical'),
    ('Ornamental');
INSERT INTO growing_conditions (
        plant_id,
        sunlight,
        soil_type,
        bloom_start_month,
        bloom_end_month,
        harvest_start_month,
        harvest_end_month,
        notes
    )
VALUES (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Chamomile'
        ),
        'Full sun to partial shade',
        'Well-drained, sandy loam',
        6,
        8,
        6,
        8,
        NULL
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Lavender'
        ),
        'Full sun',
        'Well-drained, sandy or gravelly, alkaline',
        6,
        8,
        7,
        8,
        NULL
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Thyme'
        ),
        'Full sun',
        'Well-drained, sandy or rocky, slightly alkaline',
        5,
        7,
        6,
        8,
        NULL
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Peppermint'
        ),
        'Full sun to partial shade',
        'Moist, well-drained, rich loam',
        7,
        9,
        6,
        8,
        NULL
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'St. John''s Wort'
        ),
        'Full sun to partial shade',
        'Well-drained, tolerates poor and dry soils',
        6,
        9,
        7,
        8,
        NULL
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Stinging Nettle'
        ),
        'Partial shade to full sun',
        'Moist, nitrogen-rich soil',
        6,
        9,
        4,
        6,
        NULL
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Dandelion'
        ),
        'Full sun to partial shade',
        'Adaptable to most soils, prefers moist and fertile ground',
        4,
        6,
        NULL,
        NULL,
        'Leaves harvested in spring (April-May); root harvested in autumn (September-October).'
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Sage'
        ),
        'Full sun',
        'Well-drained, slightly alkaline, sandy or loamy',
        6,
        7,
        5,
        6,
        NULL
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Valerian'
        ),
        'Full sun to partial shade',
        'Moist, rich, well-drained soil',
        6,
        8,
        9,
        10,
        'Root harvested in the plant''s second year of growth.'
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Calendula'
        ),
        'Full sun',
        'Well-drained, average fertility',
        6,
        10,
        6,
        9,
        'Flowers picked continuously as they open, to encourage further blooming.'
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Elderberry'
        ),
        'Full sun to partial shade',
        'Moist, fertile, well-drained soil',
        5,
        6,
        8,
        9,
        'Berries only; must be fully ripe and cooked before use.'
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Lily of the Valley'
        ),
        'Partial to full shade',
        'Moist, humus-rich, well-drained soil',
        4,
        5,
        4,
        5,
        'Flowers picked at peak bloom for fragrance and cut-flower use.'
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Comfrey'
        ),
        'Full sun to partial shade',
        'Moist, rich soil, tolerates damp conditions',
        5,
        6,
        5,
        8,
        'Leaves only, used for topical preparations.'
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Aloe Vera'
        ),
        'Full sun to bright indirect light',
        'Well-drained, sandy, succulent/cactus mix',
        NULL,
        NULL,
        1,
        12,
        'Rarely flowers when grown indoors as a houseplant; outer leaves can be cut as needed once the plant is at least 2 years old.'
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Turmeric'
        ),
        'Partial shade to full sun',
        'Rich, well-drained, loamy soil',
        NULL,
        NULL,
        NULL,
        NULL,
        'Blooms only in its native tropical climate, rarely in cultivation elsewhere; rhizomes are dug up 8-10 months after planting, typically once the leaves die back.'
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Ginger'
        ),
        'Partial shade',
        'Rich, moist, well-drained loamy soil',
        NULL,
        NULL,
        NULL,
        NULL,
        'Rarely flowers in cultivation, grown primarily for its rhizome; harvested 8-10 months after planting.'
    );
INSERT INTO plant_uses (plant_id, use_id, notes)
VALUES (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Chamomile'
        ),
        (
            SELECT id
            FROM uses
            WHERE use_name = 'Culinary'
        ),
        'Dried flowers brewed as a calming tea'
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Chamomile'
        ),
        (
            SELECT id
            FROM uses
            WHERE use_name = 'Medical'
        ),
        'Used for its anti-inflammatory and calming properties'
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Lavender'
        ),
        (
            SELECT id
            FROM uses
            WHERE use_name = 'Aromatic'
        ),
        'Used in essential oils and sachets for fragrance'
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Lavender'
        ),
        (
            SELECT id
            FROM uses
            WHERE use_name = 'Cosmetic'
        ),
        'Used in skincare products for its soothing properties'
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Lavender'
        ),
        (
            SELECT id
            FROM uses
            WHERE use_name = 'Ornamental'
        ),
        'Used in landscaping and garden design for its attractive flowers and fragrance'
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Thyme'
        ),
        (
            SELECT id
            FROM uses
            WHERE use_name = 'Culinary'
        ),
        'Leaves used as a seasoning in cooking'
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Thyme'
        ),
        (
            SELECT id
            FROM uses
            WHERE use_name = 'Medical'
        ),
        'Traditionally used for coughs and respiratory issues'
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Peppermint'
        ),
        (
            SELECT id
            FROM uses
            WHERE use_name = 'Culinary'
        ),
        'Leaves used in teas and desserts for flavor'
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Peppermint'
        ),
        (
            SELECT id
            FROM uses
            WHERE use_name = 'Medical'
        ),
        'Used for digestive support and relief from nausea'
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'St. John''s Wort'
        ),
        (
            SELECT id
            FROM uses
            WHERE use_name = 'Medical'
        ),
        'Traditionally used for mood support and mild depression'
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Stinging Nettle'
        ),
        (
            SELECT id
            FROM uses
            WHERE use_name = 'Culinary'
        ),
        'Leaves used in soups and teas after cooking or drying'
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Stinging Nettle'
        ),
        (
            SELECT id
            FROM uses
            WHERE use_name = 'Medical'
        ),
        'Used for its anti-inflammatory and diuretic properties'
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Dandelion'
        ),
        (
            SELECT id
            FROM uses
            WHERE use_name = 'Culinary'
        ),
        'Leaves, flowers, and roots used in salads, teas, and as a coffee substitute'
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Sage'
        ),
        (
            SELECT id
            FROM uses
            WHERE use_name = 'Culinary'
        ),
        'Leaves used as a seasoning in cooking'
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Sage'
        ),
        (
            SELECT id
            FROM uses
            WHERE use_name = 'Medical'
        ),
        'Traditionally used for sore throats and digestive issues'
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Valerian'
        ),
        (
            SELECT id
            FROM uses
            WHERE use_name = 'Medical'
        ),
        'Root used as a mild sleep aid and for relaxation'
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Calendula'
        ),
        (
            SELECT id
            FROM uses
            WHERE use_name = 'Cosmetic'
        ),
        'Used in skincare products for its soothing properties'
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Calendula'
        ),
        (
            SELECT id
            FROM uses
            WHERE use_name = 'Ornamental'
        ),
        'Grown in gardens for its bright, attractive flowers'
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Elderberry'
        ),
        (
            SELECT id
            FROM uses
            WHERE use_name = 'Culinary'
        ),
        'Ripe berries used in syrups, jams, and wines after cooking'
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Elderberry'
        ),
        (
            SELECT id
            FROM uses
            WHERE use_name = 'Medical'
        ),
        'Helps to reduce the length and severity of cold, flu, and upper respiratory symptoms'
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Lily of the Valley'
        ),
        (
            SELECT id
            FROM uses
            WHERE use_name = 'Ornamental'
        ),
        'Used in floral arrangements'
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Lily of the Valley'
        ),
        (
            SELECT id
            FROM uses
            WHERE use_name = 'Aromatic'
        ),
        'Grown for its fragrant flowers'
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Comfrey'
        ),
        (
            SELECT id
            FROM uses
            WHERE use_name = 'Cosmetic'
        ),
        'Leaves used in topical ointments and balms for skin healing. For external use only.'
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Aloe Vera'
        ),
        (
            SELECT id
            FROM uses
            WHERE use_name = 'Cosmetic'
        ),
        'Gel from leaves used in skincare products for soothing and moisturizing'
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Turmeric'
        ),
        (
            SELECT id
            FROM uses
            WHERE use_name = 'Culinary'
        ),
        'Rhizome used as a spice in cooking and for its anti-inflammatory properties'
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Turmeric'
        ),
        (
            SELECT id
            FROM uses
            WHERE use_name = 'Medical'
        ),
        'Rhizome used for its anti-inflammatory and antioxidant properties'
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Ginger'
        ),
        (
            SELECT id
            FROM uses
            WHERE use_name = 'Culinary'
        ),
        'Rhizome used in cooking and herbal teas for digestive support'
    ),
    (
        (
            SELECT id
            FROM plants
            WHERE common_name = 'Ginger'
        ),
        (
            SELECT id
            FROM uses
            WHERE use_name = 'Medical'
        ),
        'Rhizome used for its anti-nausea and anti-inflammatory properties'
    );