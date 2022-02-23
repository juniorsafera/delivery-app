import 'package:flutter/material.dart';

class ControllerTelaInicial {
  // MÉTODO PARA ABRIR A TELA PRINCIPAL
  abrirTelaPrincipal(BuildContext context) {
    Navigator.of(context).pushNamed('/telaprincipal');
  }

     
}
