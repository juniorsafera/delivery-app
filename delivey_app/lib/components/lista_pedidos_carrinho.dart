import 'package:flutter/material.dart';
import 'package:delivey_app/models/carrinho.dart';

class ListaPedidosCarrinho extends StatelessWidget {
  final List<ModelCarrinho> dCarrinho;
  const ListaPedidosCarrinho({Key? key, required this.dCarrinho}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dCarrinho.length,
      itemBuilder: (context, index) {
        final carrinho = dCarrinho[index];
        return Text(carrinho.pedidos.toList().toString());
      },
    );
  }
}
