DO $$
BEGIN
    BEGIN
        CREATE TABLE genres (
            id SERIAL PRIMARY KEY,
            genre VARCHAR(15) NOT NULL
        );

        CREATE TABLE publishers (
            id UUID PRIMARY KEY,
            name VARCHAR(50) NOT NULL,
            email VARCHAR(150) NOT NULL,
            address VARCHAR(200) NOT NULL 
        );

        CREATE TABLE authors (
            id UUID PRIMARY KEY,
            first_name VARCHAR(50),
            last_name VARCHAR(50),
            alias VARCHAR(50)
        );

        CREATE TABLE books (
            id UUID PRIMARY KEY,
            title VARCHAR(50) NOT NULL,
            genre_id INT NOT NULL REFERENCES genres(id)
        );

        CREATE TABLE book_author (
            book_id UUID NOT NULL REFERENCES books(id),
            author_id UUID NOT NULL REFERENCES authors(id),

            PRIMARY KEY (book_id, author_id)
        );

        CREATE TABLE book_editions (
            id UUID PRIMARY KEY,
            book_id UUID NOT NULL REFERENCES books(id),
            publisher_id UUID NOT NULL REFERENCES publishers(id),
            publication_year INT NOT NULL,
            lang VARCHAR(20) NOT NULL,
            price_eur NUMERIC(10, 2) NOT NULL,
            stock_amount INT NOT NULL,
            pages INT NOT NULL,
            isbn VARCHAR(13) UNIQUE NOT NULL
        );

        CREATE TABLE customers (
            id UUID PRIMARY KEY,
            first_name VARCHAR(20) NOT NULL,
            last_name VARCHAR(20) NOT NULL,
            email VARCHAR(150) NOT NULL,
            gender VARCHAR(20) NOT NULL,
            address VARCHAR(200) NOT NULL
        );

        CREATE TABLE customer_orders (
            id UUID PRIMARY KEY,
            customer_id UUID NOT NULL REFERENCES customers(id),
            order_date DATE NOT NULL
        );

        CREATE TABLE customer_order_items (
            id UUID PRIMARY KEY,
            customer_order_id UUID NOT NULL REFERENCES customer_orders(id),
            book_edition_id UUID NOT NULL REFERENCES book_editions(id),
            quantity INT NOT NULL,
            price_eur NUMERIC(10, 2) NOT NULL
        );
    EXCEPTION
        WHEN OTHERS THEN
            RAISE NOTICE 'Error occurred. Rolling back...';
            RAISE;
    END;
END;
$$;