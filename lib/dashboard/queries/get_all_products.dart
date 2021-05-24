import 'package:graphql_flutter/graphql_flutter.dart';

final getAllProductsQuery = gql(r'''
 query getProducts{
  productos{
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
