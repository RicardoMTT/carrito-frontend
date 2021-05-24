import 'package:graphql_flutter/graphql_flutter.dart';

final searchProductByKeyword = gql(r'''
  query searchProduct($nombre:String){
  productos(
    where:{
      nombre_contains:$nombre
    }
  ){
     __typename
    id
    nombre
    precio
    avatar{
      url
    }
    categoria{
      id
      nombre
    }
    
  }
}
''');
