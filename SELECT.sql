SELECT Название, Год_выпуска FROM Альбомы
WHERE Год_выпуска = '2018';

SELECT Название, Длительность FROM Треки
WHERE Длительность = (SELECT MAX(Длительность) FROM Треки)

SELECT Название FROM Треки
WHERE Длительность >= '3:30'

SELECT Название FROM Сборники
WHERE Год_выпуска >= '2018' AND Год_выпуска <= '2020'

SELECT Название FROM Исполнители
WHERE Название NOT LIKE '% %'

SELECT Название FROM Треки
WHERE Название LIKE '%Мой%' OR Название LIKE '%My%'