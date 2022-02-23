import 'package:flutter/material.dart';
import 'package:delivey_app/models/item_adicional.dart';

class ListaItensAdicionais extends StatefulWidget {
  final List<ModelItemAdicional> itensAdicionais;
  const ListaItensAdicionais({
    Key? key,
    required this.itensAdicionais,
  }) : super(key: key);

  @override
  State<ListaItensAdicionais> createState() => _ListaItensAdicionaisState();
}

List<bool> checkMarcado = [false];

class _ListaItensAdicionaisState extends State<ListaItensAdicionais> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkMarcado = List<bool>.filled(widget.itensAdicionais.length, false);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.8,
      height: size.height * 0.3,
      child: Container(
        child: ListView.builder(
          itemCount: widget.itensAdicionais.length,
          itemBuilder: (context, index) {
            final _itens = widget.itensAdicionais[index];
            return Column(
              children: [
                Material(
                  child: ListTile(
                    title: CheckboxListTile(
                      title: Text(_itens.titulo),
                      value: checkMarcado[index],
                      controlAffinity: ListTileControlAffinity.leading, 
                      onChanged: (bool? value) {
                        setState(() {
                          checkMarcado[index] = value!;
                        });
                      },
                    ),
                    trailing: Text('R\$ ${_itens.valor}'),
                  ),
                ),
                
                   
              ],
              
            );
          },
        ),
      ),
    );
  }
}
