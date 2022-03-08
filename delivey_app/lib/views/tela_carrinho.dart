// ignore_for_file: prefer_is_empty, duplicate_ignore, unnecessary_brace_in_string_interps, unused_local_variable, deprecated_member_use

import 'package:delivey_app/components/form_dados_cliente.dart';
import 'package:delivey_app/others/paleta_cores.dart';
import 'package:delivey_app/provider/itens_pedido.dart';
import 'package:flutter/material.dart';
import 'package:delivey_app/models/pedido.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class TelaCarrinho extends StatefulWidget {
  const TelaCarrinho({Key? key}) : super(key: key);

  @override
  State<TelaCarrinho> createState() => _TelaCarrinhoState();
}

class _TelaCarrinhoState extends State<TelaCarrinho> {
  final TextEditingController nomeControl = TextEditingController();
  final TextEditingController telefoneControl = TextEditingController();
  final TextEditingController enderecoControl = TextEditingController();
  final TextEditingController numeroControl = TextEditingController();
  final TextEditingController bairroControl = TextEditingController();
  final TextEditingController complementoControl = TextEditingController();
  final TextEditingController trocoControl = TextEditingController();
  bool _entrega = true;
  bool _cartao = false;

  void isEntrega(bool entrega) {
    setState(() {
      _entrega = entrega;
    });
  }

  void isCartao(bool cartao) {
    setState(() {
      _cartao = cartao;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final providerPedidos = Provider.of<ListaPedidosProvider>(context);
    final List<ModelPedido> pedidos = providerPedidos.itensPedido;

    void _enviar(String mensagem) async {
      if (!await launch("https://wa.me/5586995663305?text=${mensagem}"))
        // ignore: curly_braces_in_flow_control_structures
        throw 'Could not enviar! ';
    }

    void prepararEnviarPedido() {
      String p = '';
      String entregar = '*Endereço:* ${enderecoControl.text} \n'
          '*N°/AP:* ${enderecoControl.text} \n'
          '*Bairro:* ${bairroControl.text} \n'
          '*Complemento:* ${complementoControl.text} \n';
      String pagamento = 'TROCO PARA R\$ ${trocoControl.text}';
      String taxaEntrega = '*Taxa Entrega R\$ 5,00 \n';

      if (_entrega == false) {
        entregar = '*Retirar no local*';
        taxaEntrega = '';
      }
      if (_cartao == true) {
        entregar = 'Cartão';
      }

      for (int ip = 0; ip < pedidos.length; ip++) {
        String adc = '';
        for (int ia = 0; ia < pedidos[ip].adicionais.length; ia++) {
          adc += '${pedidos[ip].adicionais[ia].titulo} - ';
        }
        p += '*1x* ${pedidos[ip].pedido.titulo} \n'
            '*Adicionais:* $adc \n'
            '*Observação:* ${pedidos[ip].observacao} \n'
            '*Valor:* R\$${pedidos[ip].valorTotalItem},00\n'
            '__________________ \n';
      }

      String mensagem = '*NOVO PEDIDO* \n'
              '\n'
              '$p \n'
              ' \n'
              'Nome: ${nomeControl.text} \n'
              'Telefone +DDD: ${telefoneControl.text} \n' +
          entregar +
          '\n' +
          taxaEntrega +
          '\n'
              '*Valor Total R\$ ${providerPedidos.ValorTotalPedidos + 5}* \n'
              '*Tipo Pagamento:* $pagamento';

      String texto = Uri.encodeComponent(mensagem);
      _enviar(texto);
    }

    void _validarCampos() {
      if (nomeControl.text.isEmpty) {
        showDialog<void>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Atenção'),
            content: const Text('Informe seu nome!'),
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      } else if (telefoneControl.text.isEmpty) {
        showDialog<void>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Atenção'),
            content: const Text('Informe seu telefone para contato!'),
            actions: <Widget>[
              FlatButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      } else if (_entrega == true && enderecoControl.text.isEmpty ||
          _entrega == true && numeroControl.text.isEmpty ||
          _entrega == true && bairroControl.text.isEmpty ||
          _entrega == true && complementoControl.text.isEmpty) {
        showDialog<void>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Atenção'),
            content: const Text('Informe todos os dados corretamente*!'),
            actions: <Widget>[
              FlatButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      } else if(_cartao== false && trocoControl.text.isEmpty){
          showDialog<void>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Atenção'),
            content: const Text('Informe todos os dados corretamente*!'),
            actions: <Widget>[
              FlatButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      } else {
        prepararEnviarPedido();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // ignore: prefer_is_empty
        child: pedidos.length == 0
            ? SizedBox(
                width: size.width,
                height: size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Vazio'),
                  ],
                ),
              )
            : Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: pedidos.length,
                      itemBuilder: (context, index) {
                        final _pedido = pedidos[index];
                        final add = _pedido.adicionais.toList();
                        return Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        '1x  ' '${_pedido.pedido.titulo}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text('R\$ ' +
                                              _pedido.valorTotalItem +
                                              ',00'),
                                          IconButton(
                                              onPressed: () {
                                                providerPedidos
                                                    .removerItemPedido(_pedido);
                                              },
                                              icon: const Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              add.length == 0
                                  ? const Text('')
                                  : SizedBox(
                                      width: size.width,
                                      height: 30,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: add.length,
                                          itemBuilder: (context, i) {
                                            final ads = add[i];
                                            return add.length == 0
                                                ? const Text('')
                                                : Text(ads.titulo + ' -');
                                          }),
                                    ),
                              Text(
                                _pedido.observacao,
                                style: const TextStyle(color: Colors.red),
                              ),
                              const Divider(),
                            ],
                          ),
                        );
                      }),
                  ExpansionTile(
                    collapsedTextColor: Paleta.corPrimaria,
                    collapsedIconColor: Paleta.corPrimaria,
                    textColor: Colors.black,
                    iconColor: Colors.black,
                    title: const Center(
                        child: Text(
                      'Finalizar Pedido',
                    )),
                    children: [
                      FormDadosCliente(
                        total: providerPedidos.ValorTotalPedidos,
                        nomeControl: nomeControl,
                        telefoneControl: telefoneControl,
                        enderecoControl: enderecoControl,
                        numeroControl: numeroControl,
                        bairroControl: bairroControl,
                        complementoControl: complementoControl,
                        trocoControl: trocoControl,
                        isEntrega: isEntrega,
                        isCartao: isCartao,
                      ),
                      FloatingActionButton.extended(
                        onPressed: () {
                          _validarCampos();
                        },
                        label: const Text('Enviar Pedido'),
                        icon: const Icon(Icons.send),
                        backgroundColor: Paleta.corPrimaria,
                      )
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
