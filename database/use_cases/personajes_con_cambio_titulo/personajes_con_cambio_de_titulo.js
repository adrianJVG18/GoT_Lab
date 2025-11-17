db.personajes.insertMany([
  {
    _id: 1,
    nombre: "Jon Snow",
    rol: "Protagonista",
    titulos: [
      { titulo: "Lord Comandante", temporada: 5 },
      { titulo: "Rey en el Norte", temporada: 6 }
    ]
  },
  {
    _id: 2,
    nombre: "Daenerys Targaryen",
    rol: "Protagonista",
    titulos: [
      { titulo: "Khaleesi", temporada: 1 },
      { titulo: "Madre de Dragones", temporada: 2 },
      { titulo: "Reina de Meereen", temporada: 4 }
    ]
  },
  {
    _id: 3,
    nombre: "Arya Stark",
    rol: "Protagonista",
    titulos: [
      { titulo: "Ninguno", temporada: 1 }
    ]
  },
  {
    _id: 4,
    nombre: "Sansa Stark",
    rol: "Protagonista",
    titulos: [
      { titulo: "Lady de Invernalia", temporada: 1 },
      { titulo: "Reina en el Norte", temporada: 8 }
    ]
  },
  {
    _id: 5,
    nombre: "Tyrion Lannister",
    rol: "Consejero",
    titulos: [
      { titulo: "Mano del Rey", temporada: 2 },
      { titulo: "Mano de la Reina", temporada: 7 }
    ]
  },
  {
    _id: 6,
    nombre: "Cersei Lannister",
    rol: "Antagonista",
    titulos: [
      { titulo: "Reina Regente", temporada: 1 },
      { titulo: "Reina de los Siete Reinos", temporada: 6 }
    ]
  },
  {
    _id: 7,
    nombre: "Brienne de Tarth",
    rol: "Caballero",
    titulos: [
      { titulo: "Escudera", temporada: 2 },
      { titulo: "Ser", temporada: 8 }
    ]
  },
  {
    _id: 8,
    nombre: "Theon Greyjoy",
    rol: "Secundario",
    titulos: [
      { titulo: "Príncipe de las Islas", temporada: 1 },
      { titulo: "Heredero de Pyke", temporada: 2 }
    ]
  },
  {
    _id: 9,
    nombre: "Bran Stark",
    rol: "Místico",
    titulos: [
      { titulo: "Niño Lisiado", temporada: 1 },
      { titulo: "Cuervo de Tres Ojos", temporada: 6 }
    ]
  },
  {
    _id: 10,
    nombre: "Jorah Mormont",
    rol: "Guerrero",
    titulos: [
      { titulo: "Exiliado", temporada: 1 }
    ]
  }
]);

// CONSULTA
db.personajes.aggregate([
  {
    $project: {
      _id: 0,
      nombre: 1,
      titulos: "$titulos",
      titulosDistintos: {
        $size: { $setUnion: ["$titulos.titulo", []] }
      }
    }
  },
  {
    $match: {
      titulosDistintos: { $gt: 1 }
    }
  }
]);

