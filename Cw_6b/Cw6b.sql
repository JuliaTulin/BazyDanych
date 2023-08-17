-- Stworzenie nowej bazy danych
CREATE DATABASE Firma_cw6b;

USE Firma_cw6b;

-- 2. Tworzenie schematu rozliczenia
CREATE SCHEMA ksiegowosc;

-- 3. Tworzenie tabel

CREATE TABLE ksiegowosc.pracownicy (
    id_pracownika int PRIMARY KEY NOT NULL,
    imie VARCHAR(50),
    nazwisko VARCHAR(50),
   adres VARCHAR(100),
	telefon VARCHAR(20)
);

-- dodaje komentarz
EXEC sp_addextendedproperty 
    @name = N'MyTableDescription', 
    @value = 'Tabela zawieraj�ca dane pracownik�w firmy.', 
    @level0type = N'Schema', @level0name = 'ksiegowosc',
    @level1type = N'Table',  @level1name = 'pracownicy';

-- wyswitela dodany komentarz
SELECT * FROM fn_listextendedproperty(NULL, 'Schema', 'ksiegowosc', 'Table', 'pracownicy', NULL, NULL);


CREATE TABLE ksiegowosc.godziny (
  id_godziny int	PRIMARY KEY NOT NULL,
  data DATE,
  liczba_godzin INT,
  id_pracownika INT NOT NULL
);


-- dodaje komentarz
EXEC sp_addextendedproperty 
    @name = N'MyTableDescription', 
    @value = 'Tabela zawieraj�ca przepracowane godziny przypisane do konkretnych pracownik�w.', 
    @level0type = N'Schema', @level0name = 'ksiegowosc',
    @level1type = N'Table',  @level1name = 'godziny';

-- wyswitela dodany komentarz
SELECT * FROM fn_listextendedproperty(NULL, 'Schema', 'ksiegowosc', 'Table', 'godziny', NULL, NULL);


ALTER TABLE ksiegowosc.godziny
ADD FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika);


CREATE TABLE ksiegowosc.pensja (
    id_pensji int PRIMARY KEY NOT NULL,
    stanowisko VARCHAR(50),
    kwota DECIMAL(7, 2),
);
-- dodaje komentarz
EXEC sp_addextendedproperty 
    @name = N'MyTableDescription', 
    @value = 'Tabela zawieraj�ca rodzaje i wysoko�� pensji.', 
    @level0type = N'Schema', @level0name = 'ksiegowosc',
    @level1type = N'Table',  @level1name = 'pensja';

-- wyswitela dodany komentarz
SELECT * FROM fn_listextendedproperty(NULL, 'Schema', 'ksiegowosc', 'Table', 'pensja', NULL, NULL);



CREATE TABLE ksiegowosc.premia (
    id_premii int PRIMARY KEY NOT NULL,
    rodzaj VARCHAR(50),
	kwota DECIMAL(7, 2)
);
-- dodaje komentarz
EXEC sp_addextendedproperty 
    @name = N'MyTableDescription', 
    @value = 'Tabela zawieraj�ca rodzaje i wysoko�� premii.', 
    @level0type = N'Schema', @level0name = 'ksiegowosc',
    @level1type = N'Table',  @level1name = 'premia';

-- wyswitela dodany komentarz
SELECT * FROM fn_listextendedproperty(NULL, 'Schema', 'ksiegowosc', 'Table', 'premia', NULL, NULL);


CREATE TABLE ksiegowosc.wynagrodzenie (
      id_wynagrodzenia int PRIMARY KEY NOT NULL,
      data DATE,
	id_pracownika int,
	id_godziny int,
	id_pensji int,
	id_premii int
);

ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika);

ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (id_godziny) REFERENCES ksiegowosc.godziny(id_godziny);

ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (id_pensji) REFERENCES ksiegowosc.pensja(id_pensji);

ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (id_premii) REFERENCES ksiegowosc.premia(id_premii);

-- dodaje komentarz
EXEC sp_addextendedproperty 
    @name = N'MyTableDescription', 
    @value = 'Tabela zawieraj�ca wynagrodzenia pracownik�w.', 
    @level0type = N'Schema', @level0name = 'ksiegowosc',
    @level1type = N'Table',  @level1name = 'wynagrodzenie';

-- wyswitela dodany komentarz
SELECT * FROM fn_listextendedproperty(NULL, 'Schema', 'ksiegowosc', 'Table', 'wynagrodzenie', NULL, NULL);



-- 5. Wype�nij ka�d� tabel� 10. rekordami.
INSERT INTO ksiegowosc.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) Values (1, 'Julia', 'Kwiatkowska', 'ul.Kamienna 5, Krak�w', 657830977);
INSERT INTO ksiegowosc.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) Values (5, 'Kamila', 'Markowska', 'ul.Akacjowa 3, Krak�w', 756900897);
INSERT INTO ksiegowosc.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) Values (6, 'Piotr', 'Sok�', 'ul.Rzeczna 4, Krak�w', 835846890);
INSERT INTO ksiegowosc.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) Values (8, 'Nina', 'Witak', 'ul.M�y�ska 34, Krak�w', 549632478);
INSERT INTO ksiegowosc.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) Values (10, 'Tomasz', 'Walendziak', 'ul.Krucza 12, Krak�w', 579632547);
INSERT INTO ksiegowosc.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) Values (11, 'Dalia', 'Wojnak', 'ul.Prosta 34, Krak�w', 112987365);
INSERT INTO ksiegowosc.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) Values (15, 'Andrzej ', 'Moniak', 'ul.Kasztanowa 23, Krak�w', 458633211);
INSERT INTO ksiegowosc.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) Values (16, 'Robert', 'Miszak', 'ul.Stefanowska 35, Krak�w', 784857961);
INSERT INTO ksiegowosc.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) Values (20, 'Stefan', 'G�rka', 'ul.Boczna 23, Krak�w', 147623455);
INSERT INTO ksiegowosc.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) Values (30, 'Helena', 'Piotrowska', 'ul.Towarowa 3, Krak�w', 548777692);


INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika) Values (1, '2023-04-13', 8, 1);
INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika) Values (2, '2023-04-13', 8, 5);
INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika) Values (3, '2023-04-13', 8, 6);
INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika) Values (4, '2023-04-13', 8, 8);
INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika) Values (5, '2023-04-13', 9, 10);
INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika) Values (6, '2023-04-13', 8, 11);
INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika) Values (7, '2023-04-13', 10, 15);
INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika) Values (8, '2023-04-13', 8,16);
INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika) Values (9, '2023-04-13', 8, 20);
INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika) Values (10, '2023-04-13', 10, 30);


INSERT INTO ksiegowosc.pensja (id_pensji, stanowisko, kwota) Values (1, 'Programista', 8000.00);
INSERT INTO ksiegowosc.pensja (id_pensji, stanowisko, kwota) Values (2, 'Analityk', 9000.00);
INSERT INTO ksiegowosc.pensja (id_pensji, stanowisko, kwota) Values (3, 'Tester', 6000.00);
INSERT INTO ksiegowosc.pensja (id_pensji, stanowisko, kwota) Values (4, 'Ksi�gowy', 800.00);
INSERT INTO ksiegowosc.pensja (id_pensji, stanowisko, kwota) Values (5, 'Ksi�gowy', 3000.00);
INSERT INTO ksiegowosc.pensja (id_pensji, stanowisko, kwota) Values (6, 'Ksi�gowy', 2500.00);
INSERT INTO ksiegowosc.pensja (id_pensji, stanowisko, kwota) Values (7, 'In�ynier', 8500.00);
INSERT INTO ksiegowosc.pensja (id_pensji, stanowisko, kwota) Values (8, 'Dyrektor', 15000.00);
INSERT INTO ksiegowosc.pensja (id_pensji, stanowisko, kwota) Values (9, 'Kierownik projektu', 12000.00);
INSERT INTO ksiegowosc.pensja (id_pensji, stanowisko, kwota) Values (10, 'Specjalista ds. marketingu', 2000.00);


INSERT INTO ksiegowosc.premia (id_premii, rodzaj, kwota) Values (1, 'Premia roczna', 2500);
INSERT INTO ksiegowosc.premia (id_premii, rodzaj, kwota) Values (2, 'Premia kwartalna', 1000);
INSERT INTO ksiegowosc.premia (id_premii, rodzaj, kwota) Values (3, 'Premia za wyj�tkowe osi�gni�cia', 5000);
INSERT INTO ksiegowosc.premia (id_premii, rodzaj, kwota) Values (4, 'Premia p�roczna', 1500);
INSERT INTO ksiegowosc.premia (id_premii, rodzaj, kwota) Values (5, 'Premia za efektywno��', 3000);
INSERT INTO ksiegowosc.premia (id_premii, rodzaj, kwota) Values (6, 'Premia za d�ugi sta� pracy', 2000);
INSERT INTO ksiegowosc.premia (id_premii, rodzaj, kwota) Values (7, 'Premia motywacyjna', 1000);
INSERT INTO ksiegowosc.premia (id_premii, rodzaj, kwota) Values (8, 'Premia za najlepsz� ocen�', 4000);
INSERT INTO ksiegowosc.premia (id_premii, rodzaj, kwota) Values (9, 'Premia za osi�gni�cie cel�w', 3500);
INSERT INTO ksiegowosc.premia (id_premii, rodzaj, kwota) Values (10, 'Brak premii', 0);

INSERT INTO ksiegowosc.wynagrodzenie (id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii) Values (1, '2022-01-01', 1,  1, 1, 1);
INSERT INTO ksiegowosc.wynagrodzenie (id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii) Values (2, '2022-01-02', 5,  2, 2, 2);
INSERT INTO ksiegowosc.wynagrodzenie (id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii) Values (3, '2022-01-03', 6,  3, 3, 3);
INSERT INTO ksiegowosc.wynagrodzenie (id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii) Values (4, '2022-01-04', 8,  4, 4, 4);
INSERT INTO ksiegowosc.wynagrodzenie (id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii) Values (5, '2022-01-05', 10, 5, 5, 5);
INSERT INTO ksiegowosc.wynagrodzenie (id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii) Values (6, '2022-01-06', 11, 6, 6, 6);
INSERT INTO ksiegowosc.wynagrodzenie (id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii) Values (7, '2022-01-07', 15, 7, 7, 7);
INSERT INTO ksiegowosc.wynagrodzenie (id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii) Values (8, '2022-01-08', 16, 8, 8, 8);
INSERT INTO ksiegowosc.wynagrodzenie (id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii) Values (9, '2022-01-09', 20, 9, 9, 9);
INSERT INTO ksiegowosc.wynagrodzenie (id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii) Values (10, '2022-01-10', 30, 10, 10, 10);


-- a)  Zmodyfikuj numer telefonu w tabeli pracownicy, dodaj�c do niego kierunkowy dla Polski w nawiasie (+48)
UPDATE ksiegowosc.pracownicy
SET telefon = CONCAT('(+48)', telefon)

SELECT * FROM ksiegowosc.pracownicy;


-- b) Zmodyfikuj atrybut telefon w tabeli pracownicy tak, aby numer oddzielony by� my�lnikami wg wzoru: �555-222-333� 
UPDATE ksiegowosc.pracownicy 
SET telefon = SUBSTRING(telefon, 6, 3) + '-' + SUBSTRING(telefon, 9, 3) + '-' + SUBSTRING(telefon, 12, 3);

SELECT * FROM ksiegowosc.pracownicy;


-- c) Wy�wietl dane pracownika, kt�rego nazwisko jest najd�u�sze, u�ywaj�c du�ychliter
SELECT TOP 1 UPPER(id_pracownika), UPPER(imie), UPPER(nazwisko), UPPER(adres), UPPER(telefon) 
FROM ksiegowosc.pracownicy 
ORDER BY LEN(nazwisko) DESC;


-- d) Wy�wietl dane pracownik�w i ich pensje zakodowane przy pomocy algorytmu md5 
SELECT HASHBYTES('MD5', imie) AS imie, HASHBYTES('MD5', nazwisko) AS nazwisko, HASHBYTES('MD5', CAST(kwota AS VARCHAR(20))) AS pensja -- cast to rzutowanie na varchar bo hashujemy tylko string
FROM ksiegowosc.pracownicy, ksiegowosc.pensja;


-- f) Wy�wietl pracownik�w, ich pensje oraz premie. Wykorzystaj z��czenie lewostronne.
SELECT p.imie, p.nazwisko, ps.kwota AS pensja, pr.kwota AS premia
FROM ksiegowosc.pracownicy AS p
LEFT JOIN ksiegowosc.wynagrodzenie AS w ON p.id_pracownika = w.id_pracownika
LEFT JOIN ksiegowosc.pensja AS ps ON w.id_pensji = ps.id_pensji
LEFT JOIN ksiegowosc.premia AS pr ON w.id_premii = pr.id_premii;


-- h) wygeneruj raport (zapytanie), kt�re zwr�ciw wyniki tre�� wg poni�szego szablonu:
-- Pracownik Jan Nowak, w dniu 7.08.2017 otrzyma� pensj� ca�kowit� na kwot� 7540 z�, 
-- gdzie wynagrodzenie zasadnicze wynosi�o: 5000 z�, premia: 2000 z�, nadgodziny: 540 z�

--UPDATE ksiegowosc.pracownicy, ksiegowosc.godziny CONCAT('Pracownik ', imie, ' ', nazwisko, ', w dniu ')

SELECT CONCAT('Pracownik ', p.imie, ' ', p.nazwisko, ', w dniu ', w.data, ' otrzyma� pensj� ca�kowit� na kwot� ', 
    ps.kwota + pr.kwota + g.liczba_godzin, ' z�, gdzie wynagrodzenie zasadnicze wynosi�o: ',
    ps.kwota, ' z�, premia: ', pr.kwota, ' z�, nadgodziny: ', g.liczba_godzin, ' z�') AS raport
FROM ksiegowosc.pracownicy AS p
JOIN ksiegowosc.wynagrodzenie AS w ON p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.pensja AS ps ON w.id_pensji = ps.id_pensji
JOIN ksiegowosc.godziny AS g ON w.id_godziny = g.id_godziny
JOIN ksiegowosc.premia AS pr ON w.id_premii = pr.id_premii;

  
  