import 'package:delivey_app/models/categorias.dart';
import 'package:delivey_app/models/item_cardapio.dart';
import 'package:delivey_app/provider/categorias.dart';
import 'package:delivey_app/provider/itens_cardapio.dart';
import 'package:delivey_app/provider/itens_pedido.dart';
import 'package:flutter/material.dart';
import 'package:delivey_app/components/botao_carrinho.dart';
import 'package:delivey_app/components/lista_itens_cardapio.dart';
import 'package:delivey_app/controller/controller_tela_principal.dart';
import 'package:delivey_app/others/paleta_cores.dart';
import 'package:provider/provider.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({
    Key? key,
  }) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

int qntPedidos = 0;

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    final size = MediaQuery.of(context).size;
    final providerCategorias = Provider.of<ListaCategoriasProvider>(context);
    final providerCardapio = Provider.of<ListaItensCardapioProvider>(context);
    final providerPedidos = Provider.of<ListaPedidosProvider>(context);
    final List<ModelItemCardapio> itensCardapio =
        providerCardapio.itensCardapio;
    final List<ModelCategoria> itensCategoria =
        providerCategorias.itensCategoria;

    setState(() {
      qntPedidos = providerPedidos.numeroPedidos;
    });

    ControllerTelaPrincipal controller = ControllerTelaPrincipal();

    final _views = List.generate(
      itensCategoria.length,
      (index) {
        return ListaItemCardapio(
            itens: itensCardapio, categoria: itensCategoria[index].id);
      },
      //  nomeCategoria = itensCategoria[index].titulo;
    );

    // ignore: sized_box_for_whitespace
    return DefaultTabController(
      length: itensCategoria.length,
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: size.width,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.03,
                ),
                // ignore: sized_box_for_whitespace
        
                Container(
                  width: size.width,
                  padding: const EdgeInsets.all(18),
                  child: TabBar(
                    labelColor: Paleta.corPrimaria,
                    unselectedLabelColor: Colors.black,
                    isScrollable: true,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                    ),
                    tabs: List.generate(
                      itensCategoria.length,
                      (index) {
                        return Tab(
                          text: itensCategoria[index].titulo,
                        );
                      },
                      //  nomeCategoria = itensCategoria[index].titulo;
                    ),
                  ),
                ),
        
                // ÁREA DE LISTA DE ITENS DO CARDÁPIO
        
                Expanded(
                  child: Container(
                    width: size.width,
                    height: size.height * 0.5,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
                    child: TabBarView(
                      children: _views,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {
              controller.abrirTelaCarrinho(context);
            },
            child: BotaoCarrinho(
              numeroPedidos: qntPedidos.toString(),
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      ),
    );
  }
}
