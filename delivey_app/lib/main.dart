// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:delivey_app/others/rotas.dart';
import 'package:delivey_app/views/tela_carrinho.dart';
import 'package:delivey_app/views/tela_inicial.dart';
import 'package:delivey_app/views/tela_principal.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Rotas.home: (context) => TelaInicial(),
        Rotas.telaprincipal: (context) => TelaPrincipal(),
        Rotas.telaCarrinho: (context) => TelaCarrinho(),
      },
    ),
  );
}
