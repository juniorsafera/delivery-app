

// ignore_for_file: prefer_final_fields

import 'package:delivey_app/data/data_item_cardapio.dart';
import 'package:delivey_app/models/item_cardapio.dart';
import 'package:flutter/cupertino.dart';

class ListaItensCardapioProvider with ChangeNotifier {
  List<ModelItemCardapio> _itens = dadosItemCardapio;


  List<ModelItemCardapio> get itensCardapio => [..._itens];

   
}