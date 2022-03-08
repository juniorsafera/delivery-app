import 'package:delivey_app/others/rotas.dart';
import 'package:flutter/material.dart';
import 'package:delivey_app/components/botaoadd.dart';
import 'package:delivey_app/models/item_cardapio.dart';
import 'package:delivey_app/others/paleta_cores.dart';

class ListaItemCardapio extends StatefulWidget {
  final List<ModelItemCardapio> itens;
  final String categoria;

  const ListaItemCardapio({
    Key? key,
    required this.itens,
    required this.categoria,
  }) : super(key: key);

  @override
  State<ListaItemCardapio> createState() => _ListaItemCardapioState();
}

class _ListaItemCardapioState extends State<ListaItemCardapio> {
  @override
  Widget build(BuildContext context) {
    final List<ModelItemCardapio> listaItens = widget.itens
        .where((e) => e.categorias.contains(widget.categoria))
        .toList();
    return ListView.builder(
      itemCount: listaItens.length,
      itemBuilder: (context, index) {
        final _item = listaItens[index];
        return Column(
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => Navigator.of(context)
                    .pushNamed(Rotas.telaAdicionarCarrinho, arguments: _item),
                child: ListTile(
                  leading: SizedBox(
                    width: 80,
                    height: 80,
                    child: Image.network(
                      _item.urlImagem,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    _item.titulo,
                    style: const TextStyle(
                      color: Paleta.corPrimaria,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    _item.itens
                        .toString()
                        .replaceAll('[', '')
                        .replaceAll(']', ''),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  trailing: BotaoAdd(valor: _item.valor),
                ),
              ),
            ),
            const Divider(),
          ],
        );
      },
    );
  }
}
