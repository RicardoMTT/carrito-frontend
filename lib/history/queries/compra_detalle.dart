import 'package:graphql_flutter/graphql_flutter.dart';

final getComprasDetalleQuery = gql(r'''
  query getDetalleCompra{
  compraDetalles{
    __typename
    id
    cantidad
    producto{
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
}
''');
