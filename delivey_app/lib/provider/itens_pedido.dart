// ignore_for_file: non_constant_identifier_names, avoid_function_literals_in_foreach_calls

import 'package:delivey_app/models/pedido.dart';
import 'package:flutter/material.dart';

class ListaPedidosProvider with ChangeNotifier {
  List<ModelPedido> _itens = [];

  List<ModelPedido> get itensPedido => [..._itens];

  int get numeroPedidos => [..._itens].length;

  double get ValorTotalPedidos {
    double valor = 0.0;
    _itens.forEach((element) {
      valor += double.parse(element.valorTotalItem);
    });
    return valor;
  }

  void adicionarItemPedido(ModelPedido pedido) {
    _itens.add(pedido);
    notifyListeners();
  }

  void removerItemPedido(ModelPedido pedido) {
    // ignore: list_remove_unrelated_type
    _itens.remove(pedido);
    notifyListeners();
     
  }

  void limpar() {
    _itens = [];
    notifyListeners();
  }
}
