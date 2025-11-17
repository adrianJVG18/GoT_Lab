CREATE KEYSPACE got
    WITH replication = {
        'class': 'SimpleStrategy',
        'replication_factor': 1
        };

USE got;

CREATE TABLE eventos_por_personaje (
    nombre_personaje TEXT,
    nivel_significancia INT,
    nombre_evento TEXT,
    descripcion TEXT,
    id_personaje UUID,
    id_evento UUID,
    PRIMARY KEY (nombre_personaje, nivel_significancia, id_evento)
) WITH CLUSTERING ORDER BY (nivel_significancia DESC);

INSERT INTO eventos_por_personaje
(nombre_personaje, nivel_significancia, id_evento, nombre_evento, descripcion, id_personaje)
VALUES ('Jon Snow', 10, aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa1,
        'Batalla de los Bastardos',
        'Jon Snow derrota a Ramsay Bolton y recupera Invernalia.',
        11111111-1111-1111-1111-111111111111);

INSERT INTO eventos_por_personaje
(nombre_personaje, nivel_significancia, id_evento, nombre_evento, descripcion, id_personaje)
VALUES ('Jon Snow', 9, aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa2,
        'Resurrección',
        'Muere a manos de la Guardia de la Noche y es revivido por Melisandre.',
        11111111-1111-1111-1111-111111111111);

INSERT INTO eventos_por_personaje
(nombre_personaje, nivel_significancia, id_evento, nombre_evento, descripcion, id_personaje)
VALUES ('Jon Snow', 8, aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa3,
        'Defensa del Muro',
        'Lidera la defensa contra los salvajes en el Muro.',
        11111111-1111-1111-1111-111111111111);

INSERT INTO eventos_por_personaje
(nombre_personaje, nivel_significancia, id_evento, nombre_evento, descripcion, id_personaje)
VALUES ('Jon Snow', 6, aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa4,
        'Nombrado Rey en el Norte',
        'Las casas del Norte proclaman a Jon como su Rey.',
        11111111-1111-1111-1111-111111111111);

INSERT INTO eventos_por_personaje
(nombre_personaje, nivel_significancia, id_evento, nombre_evento, descripcion, id_personaje)
VALUES ('Arya Stark', 9, bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbb1,
        'Derrota al Rey de la Noche',
        'Arya mata al Rey de la Noche durante la Batalla de Invernalia.',
        44444444-4444-4444-4444-444444444444);

INSERT INTO eventos_por_personaje
(nombre_personaje, nivel_significancia, id_evento, nombre_evento, descripcion, id_personaje)
VALUES ('Arya Stark', 9, bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbb2,
        'Entrenamiento con los Hombres Sin Rostro',
        'Completa su entrenamiento en Braavos con la Casa de Blanco y Negro.',
        44444444-4444-4444-4444-444444444444);

INSERT INTO eventos_por_personaje
(nombre_personaje, nivel_significancia, id_evento, nombre_evento, descripcion, id_personaje)
VALUES ('Arya Stark', 7, bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbb3,
        'Venganza contra Walder Frey',
        'Asesina a Walder Frey y a su familia en venganza por la Boda Roja.',
        44444444-4444-4444-4444-444444444444);

INSERT INTO eventos_por_personaje
(nombre_personaje, nivel_significancia, id_evento, nombre_evento, descripcion, id_personaje)
VALUES ('Arya Stark', 5, bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbb4,
        'Reencuentro con Sansa',
        'Arya vuelve a Invernalia y se reúne con su hermana.',
        44444444-4444-4444-4444-444444444444);

INSERT INTO eventos_por_personaje
(nombre_personaje, nivel_significancia, id_evento, nombre_evento, descripcion, id_personaje)
VALUES ('Tyrion Lannister', 8, cccccccc-cccc-cccc-cccc-ccccccccccc1,
        'Mano de la Reina',
        'Tyrion se convierte en la Mano de Daenerys Targaryen.',
        33333333-3333-3333-3333-333333333333);

INSERT INTO eventos_por_personaje
(nombre_personaje, nivel_significancia, id_evento, nombre_evento, descripcion, id_personaje)
VALUES ('Tyrion Lannister', 7, cccccccc-cccc-cccc-cccc-ccccccccccc2,
        'Mata a su padre',
        'Tyrion asesina a Tywin Lannister con una ballesta.',
        33333333-3333-3333-3333-333333333333);

// Querie OBJETIVO
SELECT * FROM eventos_por_personaje WHERE id_personaje = ? LIMIT 1;