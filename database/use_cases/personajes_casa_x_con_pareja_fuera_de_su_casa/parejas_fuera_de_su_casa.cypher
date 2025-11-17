CREATE
  (ned:Personaje {id: "p_001", nombre: "Eddard Stark", casa: "Stark", lema: "El que
dicta la sentencia, blande la espada", distintivo: "Espada Hielo", rol: "Lord de
Invernalia"}),
  (catelyn:Personaje {id: "p_002", nombre: "Catelyn Stark", casa: "Stark", lema:
                          "Familia, Deber, Honor", distintivo: "Trucha Tully", rol: "Lady de Invernalia"}),
  (jon:Personaje {id: "p_003", nombre: "Jon Snow", casa: "Stark", lema: "El
guardián de la noche", distintivo: "Garra", rol: "Lord Comandante"}),
  (sansa:Personaje {id: "p_004", nombre: "Sansa Stark", casa: "Stark", lema: "Soy
una Stark de Invernalia", distintivo: "Capullo de Invernalia", rol: "Reina en el
Norte"}),
  (tywin:Personaje {id: "p_005", nombre: "Tywin Lannister", casa: "Lannister",
                    lema: "Un Lannister siempre paga sus deudas", distintivo: "León Dorado", rol:
  "Lord de Roca Casterly"}),
  (cersei:Personaje {id: "p_006", nombre: "Cersei Lannister", casa: "Lannister",
                     lema: "Poder o muerte", distintivo: "Corona Dorada", rol: "Reina de los 7
Reinos"}),
  (tyrion:Personaje {id: "p_007", nombre: "Tyrion Lannister", casa: "Lannister",
                     lema: "La mente es un arma", distintivo: "Mano del Rey", rol: "Mano de la
Reina"}),
  (daenerys:Personaje {id: "p_008", nombre: "Daenerys Targaryen", casa:
                           "Targaryen", lema: "Fuego y sangre", distintivo: "Huevos de Dragón", rol: "Reina
de los Ándalos"}),
  (robert:Personaje {id: "p_009", nombre: "Robert Baratheon", casa: "Baratheon",
                     lema: "Demonio de Batalla", distintivo: "Martillo de Guerra", rol: "Rey de los 7
Reinos"}),
  (joffrey:Personaje {id: "p_010", nombre: "Joffrey Baratheon", casa: "Baratheon",
                      lema: "Todos son mis enemigos", distintivo: "Corona de Espinas", rol: "Rey de los
7 Reinos"});
MATCH
  (ned:Personaje {nombre: "Eddard Stark"}),
  (catelyn:Personaje {nombre: "Catelyn Stark"}),
  (jon:Personaje {nombre: "Jon Snow"}),
  (sansa:Personaje {nombre: "Sansa Stark"}),
  (tywin:Personaje {nombre: "Tywin Lannister"}),
  (cersei:Personaje {nombre: "Cersei Lannister"}),
  (tyrion:Personaje {nombre: "Tyrion Lannister"}),
  (robert:Personaje {nombre: "Robert Baratheon"}),
  (joffrey:Personaje {nombre: "Joffrey Baratheon"})
CREATE
  (ned)-[:ESPOSO_DE]->(catelyn),
  (catelyn)-[:ESPOSA_DE]->(ned),
  (cersei)-[:ESPOSA_DE]->(robert),
  (robert)-[:ESPOSO_DE]->(cersei),
  (tyrion)-[:ESPOSO_DE]->(sansa),
  (sansa)-[:ESPOSA_DE]->(tyrion);

// ¿Qué personajes de la familia Lannister han sido pareja de personajes de otras casas?

MATCH (lannister:Personaje)-[r:ESPOSO_DE|ESPOSA_DE]->(pareja:Personaje)
  WHERE lannister.casa = "Lannister"
  AND pareja.casa <> "Lannister"
RETURN lannister.nombre AS Lannister,
       type(r) AS Relacion,
       pareja.nombre AS Pareja,
       pareja.casa AS Casa_Pareja;