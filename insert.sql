-- Role
INSERT INTO Role (idRole, nazev) VALUES
(1, 'Developer'),
(2, 'Uživatel'),
(3, 'Support'),
(4, 'Manager'),
(5, 'Pomocník');

-- Lokace
INSERT INTO Lokace (idLokace, budova, oddeleni, cislo_stolu) VALUES
(1, 'A', 'IT', 101),
(2, 'A', 'Prodeje', 102),
(3, 'B', 'HR', 201),
(4, 'B', 'Finance', 202),
(5, 'C', 'Marketing', 301);

-- Osoba
INSERT INTO Osoba (idOsoba, prihlasjmeno, jmeno, prijmeni, heslo, Role_idRole, Lokace_idLokace) VALUES
(1, 'honza', 'Honza', 'Bruh', 'honza', 1, 1), -- testovací user
(2, 'are', 'Anna', 'REEE', 'password2', 2, 2),
(3, 'tblack', 'Tom', 'Black', 'password3', 3, 3),
(4, 'lmore', 'Linda', 'More', 'password4', 4, 4),
(5, 'mwilsone', 'Marek', 'WILSONEEEE', 'password5', 5, 5);

-- Stav
INSERT INTO Stav (idStav, status) VALUES
(1, 1), -- Čeká na přijetí
(2, 2), -- Pracuje se na tom
(3, 3); -- Ukončeno

-- Priorita
INSERT INTO Priorita (idPriorita, nazev, barva) VALUES
(1, 'Nizká', 1),
(2, 'Strední', 2),
(3, 'Vysoká', 3),
(4, 'Kritická', 4),
(5, 'Urgentní', 5);

-- Ticket
INSERT INTO Ticket (popis, jmeno, prijmeni, kategorie, Osoba_idOsoba, Stav_idStav, Priorita_idPriorita) VALUES
('Komp nejede', 'Honza', 'Bruh', 'Technická', 1, 1, 3),
('Komp', 'Anna', 'REEE', 'Technická', 2, 1, 2),
('Sofwate instalace', 'Tom', 'Black', 'Servis', 3, 1, 4),
('Nastavení tiskárny', 'Linda', 'More', 'Technická', 4, 1, 1),
('Séfe, mne se asi neco nepovedlo', 'Marek', 'WILSONEEEE', 'Technická', 5, 1, 5);
