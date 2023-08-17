-- 1. Tworzenie bazy danych Firma
CREATE DATABASE Firma;

-- Ustawienie kontekstu na baz� danych Firma
USE Firma;

-- 2. Tworzenie schematu rozliczenia
CREATE SCHEMA rozliczenia;

-- 3. Tworzenie tabel
CREATE TABLE rozliczenia.pracownicy (
    id_pracownika int PRIMARY KEY NOT NULL,
    imie VARCHAR(50),
    nazwisko VARCHAR(50),
   adres VARCHAR(100),
	telefon VARCHAR(20)
);

CREATE TABLE rozliczenia.godziny (
  id_godziny int	PRIMARY KEY NOT NULL,
  data DATE,
  liczba_godzin INT,
  id_pracownika INT NOT NULL
);
ALTER TABLE rozliczenia.godziny
ADD FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy(id_pracownika);

CREATE TABLE rozliczenia.premie (
    id_premii int PRIMARY KEY NOT NULL,
    rodzaj VARCHAR(50),
	kwota DECIMAL(7, 2)
);

CREATE TABLE rozliczenia.pensje (
    id_pensji int PRIMARY KEY NOT NULL,
    stanowisko VARCHAR(50),
	kwota DECIMAL(7, 2),
	id_premii INT
);
ALTER TABLE rozliczenia.pensje
ADD FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie(id_premii);

SELECT * FROM rozliczenia.pracownicy;
SELECT * FROM rozliczenia.godziny;
SELECT * FROM rozliczenia.premie;
SELECT * FROM rozliczenia.pensje;

-- 4. Wype�nienie ka�dej tabeli 10 rekordami
INSERT INTO rozliczenia.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) Values (1, 'Anna', 'Kwiatkowska', 'ul.Kamienna 5, Krak�w', 657830977);
INSERT INTO rozliczenia.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) Values (5, 'Kamila', 'Markowska', 'ul.Akacjowa 3, Krak�w', 756900897);
INSERT INTO rozliczenia.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) Values (6, 'Piotr', 'Sok�', 'ul.Rzeczna 4, Krak�w', 835846890);
INSERT INTO rozliczenia.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) Values (8, 'Nina', 'Witak', 'ul.M�y�ska 34, Krak�w', 549632478);
INSERT INTO rozliczenia.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) Values (10, 'Tomasz', 'Walendziak', 'ul.Krucza 12, Krak�w', 579632547);
INSERT INTO rozliczenia.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) Values (11, 'Dalia', 'Wojak', 'ul.Prosta 34, Krak�w', 112987365);
INSERT INTO rozliczenia.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) Values (15, 'Andrzej ', 'Moniak', 'ul.Kasztanowa 23, Krak�w', 458633211);
INSERT INTO rozliczenia.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) Values (16, 'Robert', 'Miszak', 'ul.Stefanowska 35, Krak�w', 784857961);
INSERT INTO rozliczenia.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) Values (20, 'Stefan', 'G�rka', 'ul.Boczna 23, Krak�w', 147623455);
INSERT INTO rozliczenia.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) Values (30, 'Helena', 'Piotrowska', 'ul.Towarowa 3, Krak�w', 548777692);


INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika) Values (1, '2023-04-13', 8, 1);
INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika) Values (2, '2023-04-13', 8, 5);
INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika) Values (3, '2023-04-13', 8, 6);
INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika) Values (4, '2023-04-13', 8, 8);
INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika) Values (5, '2023-04-13', 8, 10);
INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika) Values (6, '2023-04-13', 8, 11);
INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika) Values (7, '2023-04-13', 8, 15);
INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika) Values (8, '2023-04-13', 8,16);
INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika) Values (9, '2023-04-13', 8, 20);
INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika) Values (10, '2023-04-13', 8, 30);

INSERT INTO rozliczenia.premie (id_premii, rodzaj, kwota) Values (1, 'Premia roczna', 2500);
INSERT INTO rozliczenia.premie (id_premii, rodzaj, kwota) Values (2, 'Premia kwartalna', 1000);
INSERT INTO rozliczenia.premie (id_premii, rodzaj, kwota) Values (3, 'Premia za wyj�tkowe osi�gni�cia', 5000);
INSERT INTO rozliczenia.premie (id_premii, rodzaj, kwota) Values (4, 'Premia p�roczna', 1500);
INSERT INTO rozliczenia.premie (id_premii, rodzaj, kwota) Values (5, 'Premia za efektywno��', 3000);
INSERT INTO rozliczenia.premie (id_premii, rodzaj, kwota) Values (6, 'Premia za d�ugi sta� pracy', 2000);
INSERT INTO rozliczenia.premie (id_premii, rodzaj, kwota) Values (7, 'Premia motywacyjna', 1000);
INSERT INTO rozliczenia.premie (id_premii, rodzaj, kwota) Values (8, 'Premia za najlepsz� ocen�', 4000);
INSERT INTO rozliczenia.premie (id_premii, rodzaj, kwota) Values (9, 'Premia za osi�gni�cie cel�w', 3500);
INSERT INTO rozliczenia.premie (id_premii, rodzaj, kwota) Values (10, 'Premia za udzia� w projekcie', 2000);

INSERT INTO rozliczenia.pensje (id_pensji, stanowisko, kwota, id_premii) Values (1, 'Programista', 8000.00, 1);
INSERT INTO rozliczenia.pensje (id_pensji, stanowisko, kwota, id_premii) Values (2, 'Analityk', 9000.00, 2);
INSERT INTO rozliczenia.pensje (id_pensji, stanowisko, kwota, id_premii) Values (3, 'Tester', 6000.00, 3);
INSERT INTO rozliczenia.pensje (id_pensji, stanowisko, kwota, id_premii) Values (4, 'Projektant', 6000.00, 4);
INSERT INTO rozliczenia.pensje (id_pensji, stanowisko, kwota, id_premii) Values (5, 'Specjalista ds. sprzeda�y', 10000.00, 5);
INSERT INTO rozliczenia.pensje (id_pensji, stanowisko, kwota, id_premii) Values (6, 'Ksi�gowy', 7000.00, 6);
INSERT INTO rozliczenia.pensje (id_pensji, stanowisko, kwota, id_premii) Values (7, 'In�ynier', 8500.00, 7);
INSERT INTO rozliczenia.pensje (id_pensji, stanowisko, kwota, id_premii) Values (8, 'Dyrektor', 15000.00, 8);
INSERT INTO rozliczenia.pensje (id_pensji, stanowisko, kwota, id_premii) Values (9, 'Kierownik projektu', 12000.00, 9);
INSERT INTO rozliczenia.pensje (id_pensji, stanowisko, kwota, id_premii) Values (10, 'Specjalista ds. marketingu', 9500.00, 10);


-- 5. Za pomoca SQL wy�wietl nazwiska pracownik� i ich adresy
SELECT nazwisko, adres FROM rozliczenia.pracownicy;

-- 6. Napisz zapytanie, kt�re przekonwertuje dat� w tabeli godziny tak, aby wy�wietlana by�� informacja jaki to dzie� tygodnia i jaki miesi�ca 
SELECT DATEPART(weekday, data) as 'dzie� tygodnia',  DATEPART(month, data) as 'numer miesi�ca' FROM rozliczenia.godziny;

-- Tworzymy dwie nowe kolumny w tabeli godziny
ALTER TABLE rozliczenia.godziny 
ADD dzie�_tygodnia int;

ALTER TABLE rozliczenia.godziny 
ADD numer_miesiaca int;

-- uzupe�niamy kolumny danymi
UPDATE rozliczenia.godziny
SET dzie�_tygodnia = DATEPART(weekday, data)

UPDATE rozliczenia.godziny
SET numer_miesiaca = DATEPART(month, data)

-- 7. W tabeli pensje zmie� nazw� atrybutu kwota na kwota_brutto oraz dodaj nowy o nazwie kwota_netto. Oblicz kwot� netto i zaktualizuj warto�ci w tabeli
--ALTER TABLE rozliczenia.pensje ADD kwota_netto DECIMAL( 7, 2); -- dodanie atrybutu kwota_netto

EXEC sp_rename 'rozliczenia.pensje.kwota', 'kwota_brutto'; -- zmiana nazwy atrybutu
ALTER TABLE rozliczenia.pensje ADD kwota_netto AS (rozliczenia.pensje.kwota_brutto*0.82); -- URUCHOM - dodanie kolumny kwota_netto i obliczenie jej wartosci