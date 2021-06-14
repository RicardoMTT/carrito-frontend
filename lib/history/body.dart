import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:probardispositivofisico/constants.dart';
import 'package:probardispositivofisico/history/queries/compra_detalle.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //UTILIZADO CON EL TEXTFIELD PARA HACER UNA BUSCADO CON EL API
    //Timer timer = Timer(Duration(seconds: 2), () {});

    return Query(
      options: QueryOptions(document: getComprasDetalleQuery),
      builder: (result, {fetchMore, refetch}) {
        if (result.isLoading && result.data == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final List<dynamic> listDetalleCompra = result.data['compraDetalles'];
        return Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.builder(
              itemCount: listDetalleCompra.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Text(
                    'Mi historial',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                        fontSize: 20),
                  );
                } else {
                  return getCardItem(listDetalleCompra[index]);
                }
              },
            ));
      },
    );
  }

  Widget getCardItem(item) {
    final total = item['producto']['precio'] * item['cantidad'];

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Producto: ${item['producto']['nombre']}",
            style: TextStyle(fontSize: 10),
          ),
          SizedBox(
            width: 10,
          ),
          Row(
            children: [
              Text(
                "Cantidad: ${item['cantidad'].toString()}",
                style: TextStyle(fontSize: 10),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Precio: ${item['producto']['precio'].toString()}",
                style: TextStyle(fontSize: 10),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Total: ${total.toString()}",
                style: TextStyle(fontSize: 10),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
