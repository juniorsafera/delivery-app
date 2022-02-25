import 'package:delivey_app/data/data_item_adicional.dart';
import 'package:delivey_app/models/item_adicional.dart';
import 'package:flutter/material.dart';

class ListaAdicionaisProvider with ChangeNotifier {
  List<ModelItemAdicional> _itens = dadosItensAdicionais;
   List<ModelItemAdicional> _itensSelecionados = [];


  List<ModelItemAdicional> get itensAdicionais => [..._itens];
  List<ModelItemAdicional> get itensSelecionados => [..._itensSelecionados];


 double get ValorTotalItensSelecionados {
    double valor = 0.0;
    _itensSelecionados.forEach((element) {
      valor += double.parse(element.valor);
    });
    return valor;
  }

  void adicionarItemAdicional(ModelItemAdicional item) {
    _itensSelecionados.add(item);
    notifyListeners();
  }
  void removerItemAdicional(ModelItemAdicional item) {
    // ignore: list_remove_unrelated_type
    _itensSelecionados.remove(item);
    notifyListeners();
     
  }

  
   
}