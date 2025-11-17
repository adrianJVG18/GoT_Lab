db.personaje_temporadas.insertMany([
    {
        nombre: "Jon Snow",
        temporadas: [1, 2, 3, 4, 5, 6, 7, 8]
    },
    {
        nombre: "Arya Stark",
        temporadas: [1, 2, 3, 4, 5, 6, 7, 8]
    },
    {
        nombre: "Sansa Stark",
        temporadas: [1, 2, 3, 4, 5, 6, 7, 8]
    },
    {
        nombre: "Tyrion Lannister",
        temporadas: [1, 2, 3, 4, 5, 6, 7, 8]
    },
    {
        nombre: "Cersei Lannister",
        temporadas: [1, 2, 3, 4, 5, 6, 7, 8]
    },
    {
        nombre: "Jaime Lannister",
        temporadas: [1, 2, 3, 4, 5, 6, 7, 8]
    },
    {
        nombre: "Daenerys Targaryen",
        temporadas: [1, 2, 3, 4, 5, 6, 7, 8]
    },
    {
        nombre: "Bran Stark",
        temporadas: [1, 2, 3, 4, 6, 7, 8]  // No aparece en temporada 5
    },
    {
        nombre: "Theon Greyjoy",
        temporadas: [1, 2, 3, 6, 7, 8]
    },
    {
        nombre: "Sandor Clegane",
        temporadas: [1, 2, 3, 4, 6, 7, 8]
    }
]);

db.personaje_temporadas.aggregate([
    // 1. Calcular total de temporadas por personaje
    {
        $project: {
            nombre: 1,
            total_temporadas: { $size: "$temporadas" }
        }
    },

    // 2. Encontrar el máximo número de temporadas
    {
        $group: {
            _id: null,
            maximo_de_apariciones: { $max: "$total_temporadas" },
            personajes_data: {
                $push: {
                    nombre: "$nombre",
                    total_temporadas: "$total_temporadas"
                }
            }
        }
    },

    // 3. Filtrar solo los personajes que tienen ese máximo
    {
        $project: {
            _id: 0,
            maximo_de_apariciones: 1,
            personajes: {
                $map: {
                    input: {
                        $filter: {
                            input: "$personajes_data",
                            as: "p",
                            cond: { $eq: ["$$p.total_temporadas", "$maximo_de_apariciones"] }
                        }
                    },
                    as: "p",
                    in: "$$p.nombre"
                }
            }
        }
    }
]);
