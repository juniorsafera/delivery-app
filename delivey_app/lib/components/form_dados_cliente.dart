import 'package:delivey_app/others/paleta_cores.dart';
import 'package:flutter/material.dart';

class FormDadosCliente extends StatefulWidget {
  final double total;
  final TextEditingController nomeControl;
  final TextEditingController telefoneControl;
  final TextEditingController enderecoControl;
  final TextEditingController numeroControl;
  final TextEditingController bairroControl;
  final TextEditingController complementoControl;
  final TextEditingController trocoControl;
  final void Function(bool entrega) isEntrega;
  final void Function(bool cartao) isCartao;

  const FormDadosCliente({
    Key? key,
    required this.total,
    required this.nomeControl,
    required this.telefoneControl,
    required this.enderecoControl,
    required this.numeroControl,
    required this.bairroControl,
    required this.complementoControl,
    required this.trocoControl,
    required this.isEntrega,
    required this.isCartao,
  }) : super(key: key);

  @override
  State<FormDadosCliente> createState() => _FormDadosClienteState();
}

class _FormDadosClienteState extends State<FormDadosCliente> {
  bool _entrega = true;
  bool _cartao = false;
  double _valorTotal = 0;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _valorTotal = widget.total + 5;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(labelText: 'Digite seu nome*'),
            controller: widget.nomeControl,
          ),
          TextField(
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(labelText: 'Telefone +DDD*'),
            controller: widget.telefoneControl,
          ),
          Row(
            children: [
              const Text('Retirar'),
              Switch(
                  activeColor: Paleta.corPrimaria,
                  value: _entrega,
                  onChanged: (bool v) {
                    setState(() {
                      _entrega = v;
                      widget.isEntrega(v);
                      if (_entrega == true) {
                        _valorTotal += 5;
                      } else {
                        _valorTotal -= 5;
                      }
                    });
                  }),
              const Text('Entregar R\$5,00'),
            ],
          ),
          _entrega == false
              ? const ListTile(
                  title: Text('Retirar no Local'),
                  subtitle: Text('Rua Governador Pedro Freitas 1494'),
                )
              : Column(
                  children: [
                    TextField(
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          labelText: 'Digite seu endereço*'),
                      controller: widget.enderecoControl,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Nº /AP*'),
                      controller: widget.numeroControl,
                    ),
                    TextField(
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(labelText: 'Bairro*'),
                      controller: widget.bairroControl,
                    ),
                    TextField(
                      keyboardType: TextInputType.text,
                      decoration:
                          const InputDecoration(labelText: 'Complemento*'),
                      controller: widget.complementoControl,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(15),
                      child: Text('Tipo Pagamento:'),
                    ),
                    Row(
                      children: [
                        const Text('Dinheiro'),
                        Switch(
                            activeColor: Paleta.corPrimaria,
                            value: _cartao,
                            onChanged: (bool v) {
                              setState(() {
                                _cartao = v;
                                widget.isCartao(v);
                              });
                            }),
                        const Text('Cartão'),
                      ],
                    ),
                    _cartao == false
                        ? TextField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                labelText: 'Troco pra R\$'),
                            controller: widget.trocoControl,
                          )
                        : const Text('')
                  ],
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  'VALOR TOTAL R\$' + _valorTotal.toString() + ',00',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
