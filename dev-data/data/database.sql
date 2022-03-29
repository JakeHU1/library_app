-- auth_user already exists, this was used to demonstrate the relation to the other tables.
-- CREATE TABLE "auth_user" (
--     "customer_id" serial,
--     "password" varchar (255),
--     "last_login" timestamp,
--     "is_superuser" boolean,
--     "username" varchar (150),
--     "first_name" varchar (150),
--     "last_name" varchar (150),
--     "email" varchar (255),
--     "is_staff" boolean,
--     "is_active" boolean,
--     "data_joined" timestamp,
--     PRIMARY KEY ("customer_id")
-- );
CREATE TABLE "reservations" (
    "reservation_id" serial,
    "customer_id" integer,
    "OrderDate" date DEFAULT CURRENT_DATE,
    CONSTRAINT "FK_reservations.customer_id" FOREIGN KEY ("customer_id") REFERENCES "auth_user"("id"),
    PRIMARY KEY ("reservation_id")
);

CREATE TABLE "book" (
    "book_id" serial,
    "isbn13" varchar (255),
    "isbn10" varchar (255),
    "title" varchar (255),
    "subtitle" varchar (255),
    "thumbnail" varchar (1000),
    "description" text,
    "published_year" integer,
    "average_rating" real,
    "num_pages" integer,
    "ratings_count" integer,
    PRIMARY KEY ("book_id")
);

CREATE TABLE "library" (
    "library_id" serial,
    "name" varchar (255),
    PRIMARY KEY ("library_id")
);

CREATE TABLE "reservations_books" (
    "book_id" integer,
    "reservation_id" integer,
    "price" float,
    CONSTRAINT "FK_reservations_book.book_id" FOREIGN KEY ("book_id") REFERENCES "book"("book_id"),
    CONSTRAINT "FK_reservations_book.reservation_id" FOREIGN KEY ("reservation_id") REFERENCES "reservations"("reservation_id"),
    PRIMARY KEY ("book_id", "reservation_id")
);

CREATE TABLE "author" (
    "author_id" serial,
    "name" text,
    PRIMARY KEY ("author_id")
);

CREATE TABLE "author_books" (
    "author_id" integer,
    "book_id" integer,
    CONSTRAINT "FK_author_book.book_id" FOREIGN KEY ("book_id") REFERENCES "book"("book_id"),
    CONSTRAINT "FK_author_book.author_id" FOREIGN KEY ("author_id") REFERENCES "author"("author_id"),
    PRIMARY KEY ("author_id", "book_id")
);

CREATE TABLE "category" (
    "category_id" serial,
    "name" varchar (255),
    PRIMARY KEY ("category_id")
);

CREATE TABLE "category_books" (
    "category_id" integer,
    "book_id" integer,
    CONSTRAINT "FK_book_category.book_id" FOREIGN KEY ("book_id") REFERENCES "book"("book_id"),
    CONSTRAINT "FK_book_category.category_id" FOREIGN KEY ("category_id") REFERENCES "category"("category_id"),
    PRIMARY KEY ("category_id", "book_id")
);

CREATE TABLE "library_books" (
    "library_id" integer,
    "book_id" integer,
    "quantity" integer,
    CONSTRAINT "FK_book_library.book_id" FOREIGN KEY ("book_id") REFERENCES "book"("book_id"),
    CONSTRAINT "FK_book_library.library_id" FOREIGN KEY ("library_id") REFERENCES "library"("library_id"),
    PRIMARY KEY ("library_id", "book_id")
);