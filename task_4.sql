-- Use the database passed as an argument
USE alx_book_store;

-- Query the information schema to get details about the 'books' table
SELECT 
    COLUMN_NAME,        -- Column name
    COLUMN_TYPE,        -- Data type of the column
    IS_NULLABLE,        -- Whether the column can be NULL
    COLUMN_DEFAULT,     -- Default value of the column
    EXTRA               -- Additional information (e.g., auto-increment)
FROM 
    INFORMATION_SCHEMA.COLUMNS 
WHERE 
    TABLE_NAME = 'Books' AND TABLE_SCHEMA = 'alx_book_store'
ORDER BY ORDINAL_POSITION;
