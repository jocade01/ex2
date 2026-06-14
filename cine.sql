-- =============================================
-- Base de datos para el examen: CineMax
-- Cartelera real febrero 2026
-- =============================================

-- =============================================
-- Insertar Géneros
-- =============================================
INSERT INTO genre (id, name)
VALUES (1, 'Acción'),
       (2, 'Comedia'),
       (3, 'Drama'),
       (4, 'Animación'),
       (5, 'Ciencia Ficción'),
       (6, 'Terror');

-- =============================================
-- Insertar Películas (cartelera real)
-- =============================================
INSERT INTO movie (id, title, year, duration, synopsis, trailer, poster, genre_id)
VALUES (1, 'Avatar: Fuego y Ceniza', 2025, 166,
        'Tercera entrega de la saga Avatar. Presenta al Pueblo de las Cenizas, un clan Na''vi no tan pacífico que utilizará la violencia si lo necesita para conseguir sus objetivos, aunque sea contra otros clanes.',
        'https://www.youtube.com/watch?v=d9MyW72ELq0',
        'https://gandia.cinesabc.com/obj/LCinesD_dat/eventos/JPG001sk.jpg',
        5),

       (2, 'Zootrópolis 2', 2025, 98,
        'Judy y Nick se encuentran tras la retorcida pista de un misterioso reptil que llega a Zootopia y pone patas arriba la metrópolis de los mamíferos. Para resolver el caso, deben ir de incógnito a nuevas partes inesperadas de la ciudad.',
        'https://www.youtube.com/watch?v=T1duVMbWjbY',
        'https://gandia.cinesabc.com/obj/LCinesD_dat/eventos/JPG001rw.jpg',
        4),

       (3, 'Primate', 2025, 105,
        'Tras regresar de la universidad, Lucy se reúne con su familia, incluido el chimpancé Ben. Ben contrae la rabia durante una fiesta en la piscina y se vuelve muy agresivo. Lucy y sus amigos se atrincheran en la piscina e idean formas de sobrevivir al feroz chimpancé.',
        'https://www.youtube.com/watch?v=F0fn4knTR2s',
        'https://gandia.cinesabc.com/obj/LCinesD_dat/eventos/JPg001v2.jpg',
        6),

       (4, 'La Asistenta', 2025, 118,
        'Una joven (Sydney Sweeney), con un pasado complicado comienza a trabajar como asistenta en la lujosa casa de los Winchester. A medida que se adentra en la vida de la familia, descubrirá secretos oscuros que pondrán en peligro su seguridad. Adaptación de la novela de Freida McFadden.',
        'https://www.youtube.com/watch?v=IMrebLqjVVQ',
        'https://gandia.cinesabc.com/obj/LCinesD_dat/eventos/JPG001sx.jpg',
        6),

       (5, 'Aída y Vuelta', 2025, 95,
        '''Aída y vuelta'' aborda el rodaje de un capítulo de la serie con tramas que transcurren tanto dentro de la ficción con los personajes de ''Aída'' como fuera de ella con los propios actores y sus relaciones, que dan pie a reflexionar sobre temas como los límites del humor, del trabajo del cómico y la fama.',
        'https://www.youtube.com/watch?v=ZC3OjV1T4pU',
        'https://gandia.cinesabc.com/obj/LCinesD_dat/eventos/JPg001uy.jpg',
        2),

       (6, 'Hamnet', 2025, 124,
        'Narra la historia de Agnes, la esposa de William Shakespeare, en su lucha por superar la pérdida de su único hijo, Hamnet. Una historia humana y desgarradora como telón de fondo para la creación de la obra de Shakespeare, Hamlet.',
        'https://www.youtube.com/watch?v=YxKBQx2BqCc',
        'https://gandia.cinesabc.com/obj/LCinesD_dat/eventos/JPG001ue.jpg',
        3);

-- =============================================
-- Insertar Sesiones
-- Fecha del examen: 6 de febrero de 2026
-- =============================================
INSERT INTO session (id, datetime, room, price, movie_id)
VALUES
    -- Sesiones del 5 de febrero (ayer - finalizadas)
    (1, '2026-02-05 16:00:00', 'Sala 1', 6.00, 1),
    (2, '2026-02-05 18:30:00', 'Sala 1', 7.50, 2),
    (3, '2026-02-05 21:00:00', 'Sala 1', 8.50, 3),
    (4, '2026-02-05 17:00:00', 'Sala 2', 6.50, 4),
    (5, '2026-02-05 19:30:00', 'Sala 2', 8.00, 5),
    (6, '2026-02-05 22:00:00', 'Sala 2', 9.00, 6),
    (7, '2026-02-05 16:30:00', 'Sala 3', 6.00, 3),
    (8, '2026-02-05 20:00:00', 'Sala 3', 8.50, 1),

    -- Sesiones del 6 de febrero (hoy)
    (9, '2026-02-06 16:00:00', 'Sala 1', 6.00, 1),
    (10, '2026-02-06 18:00:00', 'Sala 1', 7.50, 2),
    (11, '2026-02-06 20:30:00', 'Sala 1', 8.50, 1),
    (12, '2026-02-06 17:00:00', 'Sala 2', 6.50, 3),
    (13, '2026-02-06 19:30:00', 'Sala 2', 8.00, 4),
    (14, '2026-02-06 22:00:00', 'Sala 2', 9.00, 5),
    (15, '2026-02-06 16:30:00', 'Sala 3', 6.00, 6),
    (16, '2026-02-06 19:00:00', 'Sala 3', 7.50, 2),
    (17, '2026-02-06 21:30:00', 'Sala 3', 8.50, 4),

    -- Sesiones del 7 de febrero (mañana)
    (18, '2026-02-07 16:00:00', 'Sala 1', 6.00, 2),
    (19, '2026-02-07 18:30:00', 'Sala 1', 7.50, 1),
    (20, '2026-02-07 21:00:00', 'Sala 1', 9.00, 6),
    (21, '2026-02-07 17:00:00', 'Sala 2', 6.50, 5),
    (22, '2026-02-07 19:30:00', 'Sala 2', 8.00, 3),
    (23, '2026-02-07 22:00:00', 'Sala 2', 9.50, 1),
    (24, '2026-02-07 16:30:00', 'Sala 3', 6.00, 4),
    (25, '2026-02-07 19:00:00', 'Sala 3', 7.50, 5),
    (26, '2026-02-07 21:30:00', 'Sala 3', 8.50, 2),

    -- Sesiones del 8 de febrero (sábado - precios fin de semana)
    (27, '2026-02-08 12:00:00', 'Sala 1', 5.50, 2),
    (28, '2026-02-08 15:00:00', 'Sala 1', 7.00, 1),
    (29, '2026-02-08 18:00:00', 'Sala 1', 9.00, 3),
    (30, '2026-02-08 21:00:00', 'Sala 1', 10.50, 6),
    (31, '2026-02-08 12:30:00', 'Sala 2', 5.50, 4),
    (32, '2026-02-08 15:30:00', 'Sala 2', 7.00, 5),
    (33, '2026-02-08 18:30:00', 'Sala 2', 9.00, 1),
    (34, '2026-02-08 21:30:00', 'Sala 2', 10.50, 2),
    (35, '2026-02-08 13:00:00', 'Sala 3', 5.50, 6),
    (36, '2026-02-08 16:00:00', 'Sala 3', 7.00, 3),
    (37, '2026-02-08 19:00:00', 'Sala 3', 9.00, 4),
    (38, '2026-02-08 22:00:00', 'Sala 3', 10.50, 5),

    -- Sesiones del 9 de febrero (domingo)
    (39, '2026-02-09 11:00:00', 'Sala 1', 5.00, 2),
    (40, '2026-02-09 14:00:00', 'Sala 1', 6.50, 4),
    (41, '2026-02-09 17:00:00', 'Sala 1', 8.50, 1),
    (42, '2026-02-09 20:00:00', 'Sala 1', 10.00, 6),
    (43, '2026-02-09 11:30:00', 'Sala 2', 5.00, 5),
    (44, '2026-02-09 14:30:00', 'Sala 2', 6.50, 3),
    (45, '2026-02-09 17:30:00', 'Sala 2', 8.50, 2),
    (46, '2026-02-09 20:30:00', 'Sala 2', 10.00, 1),
    (47, '2026-02-09 12:00:00', 'Sala 3', 5.00, 6),
    (48, '2026-02-09 15:00:00', 'Sala 3', 6.50, 4),
    (49, '2026-02-09 18:00:00', 'Sala 3', 8.50, 5),
    (50, '2026-02-09 21:00:00', 'Sala 3', 10.00, 3);
