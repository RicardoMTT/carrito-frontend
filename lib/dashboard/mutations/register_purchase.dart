import 'package:graphql_flutter/graphql_flutter.dart';

final registerPurchaseMutation = gql(r'''
    mutation registerPurchase($cantidad:Int,$producto:ID,$total:Int){
  registerPurchase(
    input:{
      cantidad:$cantidad,
      producto:$producto,
      total:$total
    }
  ){
    id
    cliente{
      id
      nombre
    }
    producto{
      id
      nombre
    }
  }
}
''');
