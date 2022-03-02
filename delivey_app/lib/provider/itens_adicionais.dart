import 'package:delivey_app/data/data_item_adicional.dart';
import 'package:delivey_app/models/item_adicional.dart';
import 'package:flutter/material.dart';

class ListaAdicionaisProvider with ChangeNotifier {
  List<ModelItemAdicional> _itens = dadosItensAdicionais;
  List<ModelItemAdicional> _itensSelecionados = [];
  double valor = 0;

  List<ModelItemAdicional> get itensAdicionais => [..._itens];
  List<ModelItemAdicional> get itensSelecionados => [..._itensSelecionados];
  double get vlt => valor;
  
  double get ValorTotalItensSelecionados {
    double valor2 = 0;

    _itensSelecionados.forEach((element) {
      valor2 += double.parse(element.valor);
    });
    return valor2;
  }

  somarValor(ModelItemAdicional item) {
    _itensSelecionados.forEach((element) {
      valor += double.parse(element.valor);
    });
    return valor;
  }

  subtrairValor(ModelItemAdicional item) {
    _itensSelecionados.forEach((element) {
      valor -= double.parse(element.valor);
    });
    return valor;
  }

  void adicionarItemAdicional(ModelItemAdicional item) {
    _itensSelecionados.add(item);
    somarValor(item);
    print(_itensSelecionados.length);
    notifyListeners();
  }

  void removerItemAdicional(ModelItemAdicional item) {
    _itensSelecionados.remove(item);
    subtrairValor(item);
    print(_itensSelecionados.toList().length);
    notifyListeners();
  }

  void deletar(ModelItemAdicional value) {
    _itensSelecionados.remove(value);
    print(_itensSelecionados.toList().length);
  }

  void limpar() {
    _itensSelecionados = [];
    valor = 0;
    notifyListeners();
  }
}
