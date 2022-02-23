import 'dart:math';
import 'package:flutter/material.dart';
import 'package:delivey_app/data/data_pedido.dart';
import 'package:delivey_app/models/pedido.dart';

class TelaCarrinho extends StatefulWidget {
  const TelaCarrinho({Key? key}) : super(key: key);

  @override
  State<TelaCarrinho> createState() => _TelaCarrinhoState();

  static DadosPedido listaPedidos = DadosPedido();
}

class _TelaCarrinhoState extends State<TelaCarrinho> {
  static List<ModelPedido> _Pedidos = [];

  List<ModelPedido> get _pedidosRecentes {
    return _Pedidos.toList();
  }

  _adicionarPedido(String pedido, List<String> adicionais, String valor) {
    final novoPedido = ModelPedido(
        codigo: Random().nextDouble().toString(),
        pedido: pedido,
        adicionais: adicionais,
        valorTotalItem: valor);

    setState(() {
      _Pedidos.add(novoPedido);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text('Carrinho'),
        ),
        body: Container(
            child: Column(
          children: [
            Text('Pedidos:'),
            Container(
              width: size.width,
              height: 150,
              color: Colors.grey[200],
              child: Text(_Pedidos.length.toString()),
            ),
          ],
        )));
  }
}
