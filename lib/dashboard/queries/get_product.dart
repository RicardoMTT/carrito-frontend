import 'package:graphql_flutter/graphql_flutter.dart';

final getProduct = gql(r'''

  query getProduct($id:ID!){
  producto(id:$id){
    __typename 
    id
    nombre
    precio
    avatar{
      url
    }
  }
}

''');
