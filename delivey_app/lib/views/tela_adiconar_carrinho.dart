// ignore_for_file: avoid_unnecessary_containers

import 'dart:math';

import 'package:delivey_app/components/input_observacoes.dart';
import 'package:delivey_app/components/lista_itens_adicionais.dart';
import 'package:delivey_app/components/totalItem.dart';
import 'package:delivey_app/models/item_cardapio.dart';
import 'package:delivey_app/models/pedido.dart';
import 'package:delivey_app/others/paleta_cores.dart';
import 'package:delivey_app/provider/itens_adicionais.dart';
import 'package:delivey_app/provider/itens_pedido.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaAdicionarCarrinho extends StatefulWidget {
  const TelaAdicionarCarrinho({
    Key? key,
  }) : super(key: key);

  @override
  State<TelaAdicionarCarrinho> createState() => _TelaAdicionarCarrinhoState();
}

class _TelaAdicionarCarrinhoState extends State<TelaAdicionarCarrinho> {
  double totalItem = 0;

  @override
  Widget build(BuildContext context) {
    final itemCardapio =
        ModalRoute.of(context)!.settings.arguments as ModelItemCardapio;

    final providerPedido =
        Provider.of<ListaPedidosProvider>(context, listen: false);
    final _itensAdicionais =
        Provider.of<ListaAdicionaisProvider>(context, listen: false);

    final TextEditingController textObservacao = TextEditingController();

    final size = MediaQuery.of(context).size;
    final id = Random.secure();
    double total = double.parse(itemCardapio.valor) + totalItem;

    _valorTotalItemAdicional() {
      setState(() {
        totalItem = _itensAdicionais.ValorTotalItensSelecionados;
      });
    }

    _valorTotal() {
      setState(() {
        totalItem += double.parse(itemCardapio.valor);
      });
      return totalItem;
    }

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Adicionar'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black),
      body: Container(
        width: size.width,
        height: size.height,
        //padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            SizedBox(
              height: size.height - 57,
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                      child: Container(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          itemCardapio.titulo,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'R\$ ' + itemCardapio.valor + ',00',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    SizedBox(
                      height: 15,
                      child: Container(),
                    ),

                    // Definindo área de adicionais
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            totalItem++;
                          });
                          print(totalItem);
                        },
                        child: const Text(
                          'Adicionais',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: ListaItensAdicionais(
                          itensAdicionais: _itensAdicionais.itensAdicionais,
                          valorTotal: _valorTotalItemAdicional,
                        ),
                      ),
                    ),

                    const Divider(),

                    Expanded(
                        flex: 1,
                        child: Container(
                            width: size.width * 0.9,
                            child: InputObservacoes(
                                textObservacao: textObservacao))),

                    // Definindo label de input (Observações)

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'R\$ ' + total.toString() + ',00',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: FloatingActionButton.extended(
                        backgroundColor: Paleta.corSecundaria,
                        onPressed: () {
                          providerPedido.adicionarItemPedido(ModelPedido(
                            codigo: id.nextDouble().toString(),
                            pedido: itemCardapio,
                            adicionais: _itensAdicionais.itensSelecionados,
                            observacao: textObservacao.text,
                            valorTotalItem: itemCardapio.valor,
                          ));
                          Navigator.pop(context);
                          _itensAdicionais.limpar();
                        },
                        icon: const Icon(Icons.shopping_cart),
                        label: const Text(
                          'Adicionar ao carrinho',
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
