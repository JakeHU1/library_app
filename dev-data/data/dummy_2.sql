------
--
--  This is a dummy file to be used for testing purposes.
--
------
-- add reservations_book
INSERT INTO
    reservations_books (
        book_id,
        reservation_id,
        quantity,
        price
    )
VALUES
    (1, 1, 1, 10),
    (2, 1, 2, 10);

-- add author_book
INSERT INTO
    author_books (author_id, book_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 2);

-- add book_category
INSERT INTO
    category_books (book_id, category_id)
VALUES
    (1, 1),
    (2, 2),
    (2, 3);

-- add book_library
INSERT INTO
    library_books (book_id, library_id, num_copies)
VALUES
    (1, 1, 1),
    (2, 1, 3);