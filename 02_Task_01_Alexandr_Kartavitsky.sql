CREATE TABLE Contacts (
    ContactID serial PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    HomePage VARCHAR(100)
);
INSERT INTO Contacts (FirstName, LastName, Email, HomePage)
VALUES
    ('John', 'Doe', 'john.doe@example.com', 'https://www.example.com'),
    ('Jane', 'Smith', 'jane.smith@example.com', 'https://www.example.com/jane'),
    ('Alice', 'Johnson', 'alice.johnson@example.com', 'https://www.example.com/alice');

------------
SELECT *
FROM contacts
WHERE HomePage ~* '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}'