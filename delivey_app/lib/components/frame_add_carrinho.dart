// ignore_for_file: avoid_unnecessary_containers

import 'dart:math';

import 'package:delivey_app/data/data_item_adicional.dart';
import 'package:delivey_app/models/item_cardapio.dart';
import 'package:delivey_app/models/pedido.dart';
import 'package:delivey_app/others/paleta_cores.dart';
import 'package:delivey_app/provider/itens_pedido.dart';
import 'package:flutter/material.dart';
import 'package:delivey_app/components/lista_itens_adicionais.dart';
import 'package:provider/provider.dart';

import 'lista_itens_adicionais.dart';

class FrameAddCarrinho {
  // ignore: non_constant_identifier_names
  void FrameAddItem(
    BuildContext context,
    ModelItemCardapio item,
  ) {
    final TextEditingController textObservacao = TextEditingController();
    final size = MediaQuery.of(context).size;
    final id = Random.secure();
    final _itensAdicionais = dadosItensAdicionais.toList();
    final ModelPedido mp = ModelPedido(
      codigo: id.nextDouble().toString(),
      pedido: item,
      adicionais: [],
      observacao: textObservacao.text,
      valorTotalItem: item.valor,
    );

    final providerPedido =
        Provider.of<ListaPedidosProvider>(context, listen: false);

    showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
              title: const  Center(child: Text('Adicionar')),
              content: SizedBox(
                height: size.height * 0.6,
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(mp.pedido.titulo),
                          Text(' R\$  00,00'),
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
                      itensAdicionais: _itensAdicionais,
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
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  color: Paleta.corPrimaria,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                FlatButton(
                    onPressed: () {
                      providerPedido.adicionarItemPedido(mp);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Adicionar',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ],
            ));
  }
}
