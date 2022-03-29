------
--
--  This is a dummy file to be used for testing purposes.
--
------
-- add books
INSERT INTO
    book (
        isbn13,
        isbn10,
        title,
        subtitle,
        thumbnail,
        description,
        published_year,
        average_rating,
        num_pages,
        ratings_count,
        price
    )
VALUES
    (
        '9780002005883',
        '0002005883',
        'Gilead',
        null,
        'http://books.google.com/books/content?id=KQZCPgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api',
        'A NOVEL THAT READERS and critics have been eagerly anticipating for over a decade, Gilead is an astonishingly imagined story of remarkable lives. John Ames is a preacher, the son of a preacher and the grandson (both maternal and paternal) of preachers. It’s 1956 in Gilead, Iowa, towards the end of the Reverend Ames’s life, and he is absorbed in recording his family’s story, a legacy for the young son he will never see grow up. Haunted by his grandfather’s presence, John tells of the rift between his grandfather and his father: the elder, an angry visionary who fought for the abolitionist cause, and his son, an ardent pacifist. He is troubled, too, by his prodigal namesake, Jack (John Ames) Boughton, his best friend’s lost son who returns to Gilead searching for forgiveness and redemption. Told in John Ames’s joyous, rambling voice that finds beauty, humour and truth in the smallest of life’s details, Gilead is a song of celebration and acceptance of the best and the worst the world has to offer. At its heart is a tale of the sacred bonds between fathers and sons, pitch-perfect in style and story, set to dazzle critics and readers alike.',
        2004,
        3.85,
        247,
        361,
        09.99
    ),
    (
        '9780002261982',
        '0002261987',
        'Spider ''s Web',
        'A Novel',
        'http://books.google.com/books/content?id=gA5GPgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api',
        'A new ''Christie for Christmas'' -- a full-length novel adapted from her acclaimed play by Charles Osborne Following BLACK COFFEE and THE UNEXPECTED GUEST comes the final Agatha Christie play novelisation, bringing her superb storytelling to a new legion of fans. Clarissa, the wife of a Foreign Office diplomat, is given to daydreaming. ''Supposing I were to come down one morning and find a dead body in the library, what should I do?'' she muses. Clarissa has her chance to find out when she discovers a body in the drawing-room of her house in Kent. Desperate to dispose of the body before her husband comes home with an important foreign politician, Clarissa persuades her three house guests to become accessories and accomplices. It seems that the murdered man was not unknown to certain members of the house party (but which ones?), and the search begins for the murderer and the motive, while at the same time trying to persuade a police inspector that there has been no murder at all... SPIDER''S WEB was written in 1954 specifically for Margaret Lockwood and opened first at the Theatre Royal Nottingham before moving to the Savoy Theatre in London on 14 December 1954. With THE MOUSETRAP and WI',
        2000,
        3.83,
        241,
        5164,
        12.99
    );

-- add libraries
INSERT INTO
    library (name)
VALUES
    ('BookThing');

--add authors
INSERT INTO
    author (name)
VALUES
    ('Marilynne Robinson'),
    ('Charles Osborne'),
    ('Agatha Christie');

-- add categories
INSERT INTO
    category (name)
VALUES
    ('Fiction'),
    ('Detective'),
    ('Mystery');

-- add reservations
INSERT INTO
    reservations (customer_id, created_at)
VALUES
    -- customer_id of first superuser
    (1, '2022-03-24');