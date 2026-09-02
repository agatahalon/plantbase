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
        'Foxglove',
        'Digitalis purpurea',
        'Plantaginaceae',
        TRUE,
        'A tall, bell-flowered ornamental plant commonly grown in Polish gardens; the source of digoxin, a heart medication, but dangerous if self-administered.',
        TRUE,
        'All parts of the plant contain cardiac glycosides that can cause dangerous heart arrhythmias if ingested; a classic example of a plant that is medicinal in controlled doses and lethal outside them.'
    ),
    (
        'Deadly Nightshade',
        'Atropa belladonna',
        'Solanaceae',
        TRUE,
        'A rare, protected woodland plant in Poland; historically used in tiny medicinal doses, but every part of the plant, especially the berries, is highly poisonous.',
        TRUE,
        'Contains potent tropane alkaloids (atropine, scopolamine, hyoscyamine); ingestion can cause hallucinations, paralysis, and death — among the most toxic plants native to Europe.'
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