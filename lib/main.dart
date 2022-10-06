import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razajsonapp/caracteristicas/verificacion/bloc.dart';
import 'caracteristicas/Vistas/VistaCreandose.dart';

void main() {
  runApp(const AppInyectada());
}

class AppInyectada extends StatelessWidget {
  const AppInyectada({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocVerificacion(),
      child:  const Aplicacion(),
    );
  }
}


class Aplicacion extends StatelessWidget {
  const Aplicacion({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Builder(builder: (context) {
          var estado = context.watch<BlocVerificacion>().state;

          if (estado is Creandose) {
             return const VistaCreandose();
          }
          return const Center(
            child: Text("Error, vete de aqui si ves esto"),
          );
        }),
      ),
    );
  }
}
