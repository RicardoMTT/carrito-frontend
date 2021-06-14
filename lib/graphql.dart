import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:probardispositivofisico/jwt.dart';

GraphQLClient getGraphqlClient() {
  final HttpLink httpLink = HttpLink(
    'http://192.168.1.8:1337/graphql',
  );

  final AuthLink authLink = AuthLink(
    getToken: () async =>
        Jwt.token != null ? 'Bearer ${Jwt.token}' : null, //Bearer
  );

  final link = authLink.concat(httpLink);

  final client = GraphQLClient(
    link: link,
    cache: GraphQLCache(store: InMemoryStore()),
  );

  return client;
}
