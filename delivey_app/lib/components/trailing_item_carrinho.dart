// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';

class TrailingItemCarrinho extends StatelessWidget {
  final String valorItem;
  const TrailingItemCarrinho({ Key? key,
  required this.valorItem
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 50,
      child: Row(
                      children: [
                        Text('R\$ ${valorItem},00'),
                        IconButton(onPressed: (){}, icon:const Icon(Icons.delete))
                      ],
                    )
                    );
  }
}