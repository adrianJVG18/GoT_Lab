CREATE
(ned:Personaje {id: "p_001", nombre: "Eddard Stark", lema: "El que dicta la
sentencia, blande la espada", distintivo: "Espada Hielo", rol: "Lord de
Invernalia"}),
(catelyn:Personaje {id: "p_002", nombre: "Catelyn Stark", lema: "Familia, Deber,
Honor", distintivo: "Trucha Tully", rol: "Lady de Invernalia"}),
(jon:Personaje {id: "p_003", nombre: "Jon Snow", lema: "El guardián de la noche",
distintivo: "Garra", rol: "Lord Comandante"}),
(sansa:Personaje {id: "p_004", nombre: "Sansa Stark", lema: "Soy una Stark de
Invernalia", distintivo: "Capullo de Invernalia", rol: "Reina en el Norte"}) ,
(tywin:Personaje {id: "p_005", nombre: "Tywin Lannister", lema: "Un Lannister
siempre paga sus deudas", distintivo: "León Dorado", rol: "Lord de Roca
Casterly"}),
(cersei:Personaje {id: "p_006", nombre: "Cersei Lannister", lema: "Poder o
muerte", distintivo: "Corona Dorada", rol: "Reina de los 7 Reinos"}),
(tyrion:Personaje {id: "p_007", nombre: "Tyrion Lannister", lema: "La mente es un
arma", distintivo: "Mano del Rey", rol: "Mano de la Reina"}),
(daenerys:Personaje {id: "p_008", nombre: "Daenerys Targaryen", lema: "Fuego y
sangre", distintivo: "Huevos de Dragón", rol: "Reina de los Ándalos"}),
(robert:Personaje {id: "p_009", nombre: "Robert Baratheon", lema: "Demonio de
Batalla", distintivo: "Martillo de Guerra", rol: "Rey de los 7 Reinos"}),
(joffrey:Personaje {id: "p_010", nombre: "Joffrey Baratheon", lema: "Todos son
mis enemigos", distintivo: "Corona de Espinas", rol: "Rey de los 7 Reinos"});

MATCH (ned:Personaje {nombre: "Eddard Stark"}),
(catelyn:Personaje {nombre: "Catelyn Stark"}),
(jon:Personaje {nombre: "Jon Snow"}),
(sansa:Personaje {nombre: "Sansa Stark"}),
(tywin:Personaje {nombre: "Tywin Lannister"}),
(cersei:Personaje {nombre: "Cersei Lannister"}),
(tyrion:Personaje {nombre: "Tyrion Lannister"}),
(cersei:Personaje {nombre: "Cersei Lannister"}),
(robert:Personaje {nombre: "Robert Baratheon"}),
(joffrey:Personaje {nombre: "Joffrey Baratheon"})
CREATE
(ned)-[:ESPOSO_DE]->(catelyn),
(catelyn)-[:ESPOSA_DE]->(ned),
(ned)-[:PADRE_DE]->(sansa),
(sansa)-[:HIJA_DE]->(ned),
(ned)-[:PADRE_DE]->(jon),
(jon)-[:HIJO_DE]->(ned),
(catelyn)-[:MADRE_DE]->(sansa),
(sansa)-[:HIJA_DE]->(catelyn),
(jon)-[:HERMANO_DE]->(sansa),
(sansa)-[:HERMANA_DE]->(jon),
(tywin)-[:PADRE_DE]->(cersei),
(cersei)-[:HIJA_DE]->(tywin),
(tywin)-[:PADRE_DE]->(tyrion),
(tyrion)-[:HIJO_DE]->(tywin),
(cersei)-[:HERMANA_DE]->(tyrion),
(tyrion)-[:HERMANO_DE]->(cersei),
(cersei)-[:ESPOSA_DE]->(robert),
(robert)-[:ESPOSO_DE]->(cersei),
(cersei)-[:MADRE_DE]->(joffrey),
(joffrey)-[:HIJO_DE]->(cersei),
(robert)-[:PADRE_DE]->(joffrey),
(joffrey)-[:HIJO_DE]->(robert);

// Los padres de Sansa Stark
MATCH (jon:Personaje {nombre: "Sansa Stark"})-[r:HIJA_DE]->(hermano:Personaje)
RETURN jon.nombre AS Personaje, type(r) AS Relacion, hermano.nombre AS Padres;

// Las relaciones familiares de Sansa Stark
MATCH (sansa:Personaje {nombre: "Sansa Stark"})-[r]->(familiar:Personaje)
RETURN sansa.nombre AS Personaje,
type(r) AS Relacion,
familiar.nombre AS Familiar
ORDER BY type(r);

// Que relación hay entre Eddard Stark y Jon Snow
MATCH (p1:Personaje {nombre: "Eddard Stark"})-[r]-(p2:Personaje {nombre: "Jon
Snow"})
RETURN p1.nombre AS Personaje1, type(r) AS Relacion, p2.nombre AS Personaje2;