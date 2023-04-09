import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  CardBody(
      {Key? key,
      required this.item,
      required this.handleDelete,
      required this.index})
      : super(key: key);

  var item;
  var index;
  final Function handleDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: (index % 2 == 0)
            ? const Color.fromARGB(255, 51, 240, 246)
            : const Color.fromARGB(255, 241, 141, 233),
      ),
      width: double.infinity,
      height: 74,
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            item.name,
            style: const TextStyle(
              fontSize: 20,
              color: Color(0xff4b4b4b),
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            onTap: () async {
              if (await confirm(context)) {
                handleDelete(item.id);
              }
              return;
            },
            child: const Icon(
              Icons.delete_outlined,
              color: Color(0xff4b4b4b),
              size: 30,
            ),
          ),
        ]),
      ),
    );
  }
}
