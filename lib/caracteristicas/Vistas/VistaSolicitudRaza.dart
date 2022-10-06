import 'package:flutter/material.dart';


class SolicitarRaza extends StatelessWidget {
  const SolicitarRaza({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Escribe la Raza A Buscar"),
        const TextFieldA(),
        TextButton(onPressed: () {}, child: const Text('Ok'))
      ],
    );
  }
}

class TextFieldA extends StatelessWidget {
  const TextFieldA({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 100, width: 200, child: TextField());
  }
}

