import 'package:graphql_flutter/graphql_flutter.dart';

final loginMutationDoc = gql(r'''
  mutation($identifier:String!,$password:String!){
    login(input:{
      identifier:$identifier,
      password:$password
    }){
      __typename
      jwt
    }
  }
''');
