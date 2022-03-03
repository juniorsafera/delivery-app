

import 'package:delivey_app/data/data_categorias.dart';
import 'package:delivey_app/models/categorias.dart';
import 'package:flutter/material.dart';

class ListaCategoriasProvider with ChangeNotifier  {

   List<ModelCategoria> _itensCategoria = dadosCategorias;


  List<ModelCategoria> get itensCategoria => [..._itensCategoria];


}