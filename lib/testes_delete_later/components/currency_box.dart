import 'package:flutter/material.dart';
import 'package:pokemon_vgc/testes_delete_later/model/currency_model.dart';

class CurrencyBox extends StatelessWidget {

  final List<CurrencyModel> items;
  final TextEditingController controller;
  final void Function(CurrencyModel model) onChanged;
  final CurrencyModel selectItem;

  const CurrencyBox({super.key, required this.items, required this.controller, required this.onChanged, required this.selectItem});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 1,
            child: SizedBox(
              height: 56,
              child: DropdownButton<CurrencyModel>(
                  isExpanded: true,
                  value: selectItem,
                  underline: Container(
                    height: 1,
                    color: Colors.red,
                  ),
                  items: items.map((e) => DropdownMenuItem(value: e, child: Text(e.name))).toList(),
                  onChanged: (value){},),
            )),
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 2,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red)),
            ),
          ),
        ),
      ],
    );
  }
}
