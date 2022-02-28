import 'dart:math';

import 'package:delivey_app/components/lista_itens_adicionais.dart';
import 'package:delivey_app/models/item_cardapio.dart';
import 'package:delivey_app/provider/itens_adicionais.dart';
import 'package:delivey_app/provider/itens_pedido.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaAdicionarCarrinho extends StatelessWidget {
  const TelaAdicionarCarrinho({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemCardapio =
        ModalRoute.of(context)!.settings.arguments as ModelItemCardapio;

    final size = MediaQuery.of(context).size;
    final id = Random.secure();

    final providerPedido =
        Provider.of<ListaPedidosProvider>(context, listen: false);
    final _itensAdicionais =
        Provider.of<ListaAdicionaisProvider>(context, listen: false);

    final TextEditingController textObservacao = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.1,
              child: Container(),
            ),
            const Center(child: Text('Adicionar')),
            SizedBox(
              height: size.height * 0.6,
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(itemCardapio.titulo),
                        Text(itemCardapio.valor + ',00'),
                      ],
                    ),
                  ),
                  

                  // Definindo área de adicionais
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Adicionais',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListaItensAdicionais(
                    itensAdicionais: _itensAdicionais.itensAdicionais,
                  ),

                  SizedBox(
                    height: 10,
                    child: Container(),
                  ),

                  // Definindo label de input (Observações)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: const Text(
                            "Observações:",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )),

                      // Definindo   input (Observações)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey)),
                              child: TextField(
                                controller: textObservacao,
                                maxLines: 3,
                                decoration: const InputDecoration.collapsed(
                                  hintText: " ",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                    child: Container(),
                  ),

                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text('TOTAL R\$  00,00',
                            style: const TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}