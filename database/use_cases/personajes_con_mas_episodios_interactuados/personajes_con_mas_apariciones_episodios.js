db.aparicion_en_episodio.insertMany([
    { personaje: "Jon Snow", episodio: 1 },
    { personaje: "Jon Snow", episodio: 2 },
    { personaje: "Jon Snow", episodio: 3 },

    { personaje: "Arya Stark", episodio: 1 },
    { personaje: "Arya Stark", episodio: 4 },

    { personaje: "Tyrion Lannister", episodio: 2 },
    { personaje: "Tyrion Lannister", episodio: 3 },
    { personaje: "Tyrion Lannister", episodio: 4 },
    { personaje: "Tyrion Lannister", episodio: 5 },

    { personaje: "Daenerys Targaryen", episodio: 5 }
]);

db.aparicion_en_episodio.aggregate([
    // 1. Agrupar por personaje → juntar episodios
    {
        $group: {
            _id: "$personaje",
            total_episodios: { $addToSet: "$episodio" }
        }
    },
    // 2. Contar episodios únicos
    {
        $project: {
            _id: 0,
            personaje: "$_id",
            total_episodios: { $size: "$total_episodios" }
        }
    },
    // 3. Ordenar por mayor cantidad
    { $sort: { total_episodios: -1 } },
    // 4. Top 10
    { $limit: 10 }
]);
