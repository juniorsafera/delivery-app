// ignore_for_file: prefer_const_constructors

import 'package:delivey_app/provider/itens_adicionais.dart';
import 'package:delivey_app/provider/itens_cardapio.dart';
import 'package:delivey_app/provider/itens_pedido.dart';
import 'package:flutter/material.dart';
import 'package:delivey_app/others/rotas.dart';
import 'package:delivey_app/views/tela_carrinho.dart';
import 'package:delivey_app/views/tela_inicial.dart';
import 'package:delivey_app/views/tela_principal.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider( create: (_) => ListaItensCardapioProvider(),),
        ChangeNotifierProvider( create: (_) => ListaAdicionaisProvider(),),
        ChangeNotifierProvider( create: (_) => ListaPedidosProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          Rotas.home: (context) => TelaInicial(),
          Rotas.telaprincipal: (context) => TelaPrincipal(),
          Rotas.telaCarrinho: (context) => TelaCarrinho(),
        },
      ),
    ),
  );
}
