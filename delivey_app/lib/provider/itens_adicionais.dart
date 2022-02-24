import 'package:delivey_app/data/data_item_adicional.dart';
import 'package:delivey_app/models/item_adicional.dart';
import 'package:flutter/material.dart';

class ListaAdicionaisProvider with ChangeNotifier {
  List<ModelItemAdicional> _itens = dadosItensAdicionais;


  List<ModelItemAdicional> get itensAdicionais => [..._itens];


  
   
}