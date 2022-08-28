SELECT Жанр, COUNT(Исполнитель) FROM Жанры_и_исполнители
GROUP BY Жанр;

SELECT COUNT(t.Название), Альбом, a.Год_выпуска FROM Треки t
JOIN Альбомы a ON t.Альбом = a.id 
GROUP BY Альбом, a.Год_выпуска
HAVING a.Год_выпуска BETWEEN 2010 AND 2022;

SELECT AVG(Длительность), Альбом FROM Треки
GROUP BY Альбом;

SELECT i.Название FROM Исполнители i
WHERE i.Название NOT IN (SELECT i.Название FROM Исполнители i
LEFT JOIN Альбомы_и_исполнители a_i ON i.id = a_i.Исполнитель
LEFT JOIN Альбомы a ON a_i.Альбом = a.id
WHERE a.Год_выпуска != '2022');

SELECT DISTINCT c.Название FROM Сборники c
LEFT JOIN Сборники_и_треки c_t ON c.id = c_t.Сборник
LEFT JOIN Треки t ON c_t.Трек = t.id
LEFT JOIN Альбомы a ON t.Альбом = a.id 
LEFT JOIN Альбомы_и_исполнители a_i ON a.id = a_i.Исполнитель
LEFT JOIN Исполнители i ON a_i.Исполнитель = i.id
WHERE i.Название = 'Rammstein';

SELECT a.Название FROM Альбомы a
LEFT JOIN Альбомы_и_исполнители a_i ON a.id = a_i.Альбом
LEFT JOIN Исполнители i ON a_i.Исполнитель = i.id
LEFT JOIN Жанры_и_исполнители z_i ON i.id = z_i.Исполнитель
LEFT JOIN Жанры z ON z_i.Жанр = z.id
GROUP BY z_i.Исполнитель, a.Название
HAVING COUNT(z_i.Жанр) > 1;

SELECT t.Название FROM Треки t
LEFT JOIN Сборники_и_треки c_t ON t.id = c_t.Трек
WHERE c_t.Сборник IS NULL;

SELECT i.Название FROM Исполнители i
LEFT JOIN Альбомы_и_исполнители a_i ON i.id = a_i.Исполнитель
LEFT JOIN Альбомы a ON a_i.Альбом = a.id 
LEFT JOIN Треки t ON t.Альбом = a.id
WHERE t.Длительность = (SELECT MIN(Длительность) FROM Треки)

SELECT a.Название, COUNT(t.Название) AS track_count FROM Альбомы a
JOIN Треки t ON a.id = t.Альбом
GROUP BY a.Название
HAVING COUNT(t.Название) = (SELECT MIN(track_count) FROM (SELECT a.Название, COUNT(t.Название) AS track_count FROM Альбомы a
JOIN Треки t ON a.id = t.Альбом
GROUP BY a.Название) AS tr_count)