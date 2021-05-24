import 'package:graphql_flutter/graphql_flutter.dart';

final getProductsByCategoryQuery = gql(r'''
    
query getProductosByCategory($idCategoria:ID){
  productos(where:{
    categoria:$idCategoria
  }){
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
