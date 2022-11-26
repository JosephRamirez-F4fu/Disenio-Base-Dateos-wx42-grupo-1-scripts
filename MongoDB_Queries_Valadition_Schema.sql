use FashionTip

db.createCollection(
  "Usuarios",{
    validator:{
      $jsonSchema:{
        bsonType:"object",
        description:"Usuarios object validation",
        required:["apodo","correo","contrasenia","persona"],
        properties:{
          apodo:{
            bsonType:"string",
            minLength:6,
            maxLength:24,
            description: "'nombre' must be a string with length between 6 and 24 and is required"
          },correo:{
            bsonType: 'string',
            minLength: 6,
            maxLength: 40,
            pattern: '[a-z0-9._%+!$&*=^|~#%{}/-]+@([a-z0-9-]+.){1,}([a-z]{2,22})',
            description: 'It is required and it must be a string with length between 6 and 40 (regular expression pattern)'
          },contrasenia:{
            bsonType:"string",
            maxLength:32,
            description: "'telefono' must be a string with max length 32 and is required"
          },persona:{
            bsonType:"object",
            description: "'persona' must be a object is required",
            required:["nombre","apellido","telefono"],
            properties:{
              nombre:{
                bsonType:"string",
                minLength:3,
                maxLength:16,
                description: "'nombre' must be a string in length [3 , 16] and is required"
              },apellido:{
                bsonType:"string",
                minLength:3,
                maxLength:16,
                description: "'apellido' must be a string in length [3 , 16] and is required"
              },telefono:{
                bsonType:"string",
                maxLength:9,
                description: "'telefono' must be a string and is required"
              }
          }
        }
      }
    }
  }
 }
)

db.createCollection(
 "Ropas",
 {
   validator:{
     $jsonSchema:{
       bsonType:"object",
       description:"Ropas object validation",
       required:["usuario_id","marcas","tallas","tiposPrendas"],
       properties:{
         usuario_id:{
           bsonType:"string",
           description:"'usuario_id'must be a objectId is required"
         },
         marcas:{
           bsonType:"string",
           description:"'marcas' must be a string is required"
         },,
         tiposPrendas:{
           bsonType:"string",
           description:"'tiposPrendas' must be a string is required"
         }
       }
     }
   }
 }
)
//DML

db.Usuarios.insertOne
(
 {apodo:"Mark012",correo:"Mark@gmail.com",contrasenia:"123456" ,
    persona:
    {nombre:"Mark",apellido:"Wilkinson",telefono:"912345680"}
 }
)

db.Usuarios.insertOne
(
 {apodo:"Gabi_023",correo:"GabrielA_2005@gmail.com",contrasenia:"123456789" ,
    persona:
    {nombre:"Gabriela",apellido:"Torres",telefono:"960345680"}
 }
)
db.Usuarios.insertOne
(
 {apodo:"Jhonny",correo:"JH_1@gmail.com",contrasenia:"A123456" ,
    persona:
    {nombre:"Jhon",apellido:"Max",telefono:"955345680"}
 }
)
db.Usuarios.insertOne
(
 {apodo:"Marte_12",correo:"MTQ_12@gmail.com",contrasenia:"VT123456" ,
    persona:
    {nombre:"Mario",apellido:"Perez",telefono:"912344680"}
 }
)
db.Usuarios.insertOne
(
 {apodo:"Wiloconcon",correo:"WN12@gmail.com",contrasenia:"PapiCueva" ,
    persona:
    {nombre:"Marcos",apellido:"Paredes",telefono:"912345180"}
 }
)
db.Usuarios.insertOne
(
 {apodo:"MisaTo",correo:"MiaQ_1@gmail.com",contrasenia:"diesperdidas" ,
    persona:
    {nombre:"Mia",apellido:"Cespedes",telefono:"912345080"}
 }
)
db.Usuarios.insertOne
(
 {apodo:"RoleJhon",correo:"JR12@gmail.com",contrasenia:"123456789" ,
    persona:
    {nombre:"Jhon",apellido:"Ramirez",telefono:"912345480"}
 }
)
db.Usuarios.insertOne
(
 {apodo:"Twise_11",correo:"Michi@gmail.com",contrasenia:"987654321" ,
    persona:
    {nombre:"Michelle",apellido:"Pickles",telefono:"912345650"}
 }
)
db.Usuarios.insertOne
(
 {apodo:"Pep3_12",correo:"MaC12@gmail.com",contrasenia:"abc123" ,
    persona:
    {nombre:"Mario",apellido:"Casas",telefono:"912345660"}
 }
)
db.Usuarios.insertOne
(
 {apodo:"TomTam",correo:"TA_123@gmail.com",contrasenia:"123456" ,
    persona:
    {nombre:"Tom",apellido:"Amado",telefono:"912345670"}
 }
)
db.Usuarios.insertOne
(
 {apodo:"TimTim",correo:"Junn@gmail.com",contrasenia:"123456" ,
    persona:
    {nombre:"Junior",apellido:"Hurtado",telefono:"912345680"}
 }
)


db.Ropas.insertOne({"usuario_id":"Mark@gmail.com","marcas":"Nike","tallas":"S","tiposPrendas":"Polera"})
db.Ropas.insertOne({"usuario_id":"Mark@gmail.com","marcas":"Umbro","tallas":"S","tiposPrendas":"Zapatillas"})
db.Ropas.insertOne({"usuario_id":"Mark@gmail.com","marcas":"H&M","tallas":"S","tiposPrendas":"Polo"})
db.Ropas.insertOne({"usuario_id":"Mark@gmail.com","marcas":"Rolex","tallas":"S","tiposPrendas":"Reloj"})
db.Ropas.insertOne({"usuario_id":"GabrielA_2005@gmail.com","marcas":"Converse","tallas":"S","tiposPrendas":"zapatos"})
db.Ropas.insertOne({"usuario_id":"GabrielA_2005@gmail.com","marcas":"PRADA","tallas":"S","tiposPrendas":"Camisero"})
db.Ropas.insertOne({"usuario_id":"GabrielA_2005@gmail.com","marcas":"Puma","tallas":"S","tiposPrendas":"Zapatillas"})
db.Ropas.insertOne({"usuario_id":"GabrielA_2005@gmail.com","marcas":"Nike","tallas":"S","tiposPrendas":"Buzo"})
db.Ropas.insertOne({"usuario_id":"GabrielA_2005@gmail.com","marcas":"Adidas","tallas":"S","tiposPrendas":"Polo"})







/*-----------------Joseph Rafael Ramirez Sarmiento U20211C828 --------------------------*/

db.Ropas.aggregate(
[
  {
    $match:{
      tiposPrendas:{$eq:"Zapatillas"}
    }
  },
  {
    $group:{
      _id:"$marcas",
      quantity:{$count:{}}
    }
  },{
    $sort:{
      quantity:1
    }
  },{
    $limit:5
  }
]
)


db.Usuarios.aggregate([
  {
    $lookup:
    {
      from:"Ropas",
      localField:"correo",
      foreignField:"usuario_id",
      as:"clothes_details",

    }
  },{
    $project:{
      _id:0,
      "persona.nombre":1,
      "persona.apellido":1,
      "clothes_details.tiposPrendas":1,
      "clothes_details.marcas":1
    }
    }
  ])

/*------------------Hanss Olivas Blas u20201f505-------------------------*/

db.Usuarios.aggregate(
  [

      {$project:
        {
          _id: 1,
          correo: 1,
          "persona.telefono" : 1
        }
      }
  ]
)

db.Ropas.aggregate([
  {
   $lookup:{
from:"Usuarios",
localField:"usuario_id",
foreignField:"correo",
as:"Marcas_de_Polos",
  }
 },
{
  $match:{
    $and:[
    { marcas: { $in:["Adidas"] } },
      { tiposPrendas: { $in:["Polo"] } }
    ]
  }
},
 {
  $project:{
_id:1,
marcas:1,
tiposPrendas: 1
}
 }

])

 /*-----------------------Josue Moreira Campos U202123541 ----------------------*/

db.Ropas.aggregate
([
 {
    $match:
    {
        "marcas":"Nike"
    }
 },
 {
    $project:
    {
        _id:0,
        marcas:1,
        tiposPrendas:1
    }
 }
])

db.Usuarios.aggregate
([
    {
        $project:
        {
            _id:0,
            apodo:1,
            correo:1
        }
    },
    {
        $sort:
        {
            apodo:1}
         }
])

 /*-----------------------Raúl Wilber Ccorahua Lopez  U20201C635----------------------*/

db.Usuarios.aggregate([
 {
   $group:{
   _id:{},
   numero_usuarios:{$count:{}}
   }
 }
 ,{
   $project:{
   _id:0,
   numero_usuarios:1
   }
 }
])


db.Ropas.aggregate([
 {
 $match:{
 $and:[{tiposPrendas:{$in:["Zapatillas"]}},{marcas:{$in:["Nike"]}}]
 }},
 {
$lookup:{
 from:"Usuarios",
 localField:"usuario_id",
 foreignField:"correo",
 as:"ClothesPeople"
}
}
,{
$group:{
_id:"$ClothesPeople.correo"
}
},
{
$project:{
 _id:1
}
}
])
