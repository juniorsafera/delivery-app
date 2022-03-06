import 'package:flutter/material.dart';
import 'package:delivey_app/models/pedido.dart';

class ListaPedidos extends StatelessWidget {
  final List<ModelPedido> pedidos;
  const ListaPedidos({
    Key? key,
    required this.pedidos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: ListView.builder(
            itemCount: pedidos.length,
            itemBuilder: (contet, index) {
              final _pedido = pedidos[index];
              return ListTile(
                title: Text('1x ${_pedido.pedido}'),
                subtitle: Text('Adicionais: ${_pedido.adicionais}'),
                trailing: Text('R\$ ${_pedido.valorTotalItem}'),
              );
            },
          ),
        ),
      ],
    );
  }
}
