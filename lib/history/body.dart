import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:probardispositivofisico/constants.dart';
import 'package:probardispositivofisico/history/queries/compra_detalle.dart';
import 'dart:async';

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mi historial',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                    fontSize: 20),
              ),
              // REALIZAR BUSQUEDA
              // TextFormField(
              //   onChanged: (string) {
              //     timer.cancel();
              //     timer = Timer(Duration(seconds: 2), () {
              //       print(string);
              //     });
              //   },
              // ),
              Expanded(
                  child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 70),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                  ),
                  RefreshIndicator(
                    onRefresh: refetch,
                    child: GridView.count(
                      mainAxisSpacing: 20, //Espacio entre filas,
                      crossAxisSpacing: 20, // Espacio entre columnas
                      crossAxisCount: 2,
                      children: List.generate(listDetalleCompra.length,
                          (index) => getCardItem(listDetalleCompra[index])),
                    ),
                  )
                ],
              ))
            ],
          ),
        );
      },
    );
  }

  Widget getCardItem(item) {
    final total = item['producto']['precio'] * item['cantidad'];

    return Container(
      color: Colors.blueAccent,
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
            ],
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
    );
  }
}
