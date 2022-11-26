use sample_mflix

//se dease saber los nombre que fueron filamadas en francia
db.movies.find({
  countries:"France"
  },{
    title:1,
    _id:0
  }
).count()

//se desa saber los nombres que solo fueron filmadas en francia
db.movies.find({
  countries:["France"]
  },{
    title:1,
    _id:0
  }
).count()
//se desa saber los nombres que solo fueron filmadas en francia y USA

//caso1
db.movies.find({
  countries:["USA","France"]
  },{
    title:1,
    _id:0
  }
).count()

//caso2
db.movies.find({
  countries:["France","USA"]
  },{
    title:1,
    _id:0
  }
).count()

//case 3
//este es la mejos solucion y por mejorar
db.movies.find({
  countries:{$all:["France","USA"]}
  },{
    title:1,
    _id:0
  }
).count()

//
db.movies.find({
    $and:[
      {countries: {$all:["France","USA"]}},
      {countries:{$size:2}}]
  },{
    title:1,
    _id:0,
    countries:1
  }
).count()


db.movies.find({
    $or:[
      {countries: ["France","USA"]},
      {countries: ["USA","France"]},]
  },{
    title:1,
    _id:0,
    countries:1
  }
).count()


//filmadas en dos o mas paises

db.movies.find({
    $expr:{$gte:[{$size:"$countries"},2]}
  },{
    title:1,
    _id:0,
    countries:1,
    total:{$size:"$countries"}
  }
)
//se desea saber el año en que una pelicula fue filmada
db.movies.find({

  },{
    title:1,
    _id:0,
    year:{$year:"$released"}
  }
)

//se desea saber la cantidad de peliculas filamdas por año

db.movies.aggregate([
  {$group:{
    _id:{$year:"$released"},
    quantity:{$count:{}}
  }
  },
  {$match:{
    quantity:{$gt:100},
    _id:{$ne:null}
  }},{
    $sort:{
      quantity:-1

    }
  }

])


// se dease saber la cacntidad de peliculas filmadas por año



//hacer una consulta en dos colleciones que tienen una referncia
db.comments.aggregate([
  {
    $lookup:{
      from:"movies",
      localField:"movie_id",
      foreignField:"_id",
      as:"movies_details"
    }
  },{
    $project:{
      _id:0,
      name:1,
      text:1,
      email:1,
      "movies_detail.title":1
    }
  }
])

db.movies.aggregate([
  {
    $lookup:{
      from:"comments",
      localField:"_id",
      foreignField:"movie_id",
      as:"comments"
    }
  },{
    $match:{
      comments:{$size:1}
    }
  }
])

use sample_mflix
db.movies.aggregate([
  {
    $lookup:{
      from:"comments",
      localField:"_id",
      foreignField:"movie_id",
      as:"comments"
    }
  },{
    $match:{
      $expr:{
         $gte:[{$size:"$comments"},1]
      }
    }
  }
])

db.comments.aggregate([
  {$group:{
    _id:"$movie_id",
    quantity:{$count:{}},

  }},
  {
    $lookup:{
      from:"movies",
      localField:"_id",
      foreignField:"_id",
      as:"movie"
    }
  },{
    $unwind:{
      path:"$movie"
    }
  }
])
