CREATE TABLE IF NOT EXISTS Исполнители (
	id SERIAL PRIMARY KEY NOT NULL,
	Название VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Жанры (
	id SERIAL PRIMARY KEY NOT NULL,
	Название VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Жанры_и_исполнители (
	Жанр INTEGER REFERENCES Жанры(id),
	Исполнитель INTEGER REFERENCES Исполнители(id),
	CONSTRAINT pk PRIMARY KEY (Жанр, Исполнитель)
);

CREATE TABLE IF NOT EXISTS Альбомы (
	id SERIAL PRIMARY KEY NOT NULL,
	Название VARCHAR (100) NOT NULL,
	Год_выпуска INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Альбомы_и_исполнители (
	Исполнитель INTEGER REFERENCES Исполнители(id),
	Альбом INTEGER REFERENCES Альбомы(id),
	CONSTRAINT sa PRIMARY KEY (Исполнитель, Альбом)
);

CREATE TABLE IF NOT EXISTS Треки (
	id SERIAL PRIMARY KEY NOT NULL,
	Название VARCHAR(100) NOT NULL,
	Длительность INTEGER,
	Альбом INTEGER REFERENCES Альбомы(id)
);

CREATE TABLE IF NOT EXISTS Сборники (
	id SERIAL PRIMARY KEY NOT NULL,
	Название VARCHAR(100) NOT NULL,
	Год_выпуска VARCHAR(4) NOT NULL
);

CREATE TABLE IF NOT EXISTS Сборники_и_треки (
	Трек INTEGER REFERENCES Треки(id),
	Сборник INTEGER REFERENCES Сборники(id),
	CONSTRAINT tc PRIMARY KEY (Трек, Сборник)
);
