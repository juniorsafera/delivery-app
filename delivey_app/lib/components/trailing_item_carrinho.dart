import 'package:flutter/material.dart';

class TrailingItemCarrinho extends StatelessWidget {
  final String valorItem;
  const TrailingItemCarrinho({ Key? key,
  required this.valorItem
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      child: Row(
                      children: [
                        Text('R\$ ${valorItem},00'),
                        IconButton(onPressed: (){}, icon: Icon(Icons.delete))
                      ],
                    )
                    );
  }
}