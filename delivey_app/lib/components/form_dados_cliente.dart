import 'package:flutter/material.dart';

class FormDadosCliente extends StatefulWidget {
  const FormDadosCliente({
    Key? key,
  }) : super(key: key);

  @override
  State<FormDadosCliente> createState() => _FormDadosClienteState();
}

class _FormDadosClienteState extends State<FormDadosCliente> {
  @override
  Widget build(BuildContext context) {
    bool entrega = false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(labelText: 'Digite seu nome'),
        ),
        const TextField(
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(labelText: 'Digite seu Telefone'),
        ),
        entrega == false
            ? const ListTile(
                title: Text('Retirar no Local'),
                subtitle: Text('Rua Governador Pedro Freitas 1494'),
              )
            : Column(
                children: const [
                  TextField(
                    keyboardType: TextInputType.text,
                    decoration:
                        InputDecoration(labelText: 'Digite seu endereço'),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Nº /AP'),
                  ),
                  TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: 'Bairro'),
                  ),
                  TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: 'Complemento'),
                  ),
                ],
              )
      ],
    );
  }
}
