//Estados y Eventos

import 'package:flutter_bloc/flutter_bloc.dart';

class Estado {}

class Creandose extends Estado{}

class SolicitarRaza extends Estado {}

class EsperandoConfirmacion extends Estado {}

class BlocVerificacion extends Bloc<Evento,Estado>{
  BlocVerificacion() : super((Creandose())){
    on<Creado>((event, emit) {
      emit(SolicitarRaza());
    });
  }

}

class MostrandoRazaConf extends Estado  {}

class MostrandoRazaNoConf extends Estado{}


class Evento {}

class Creado extends Evento{}

class NombreRecibidoRaza extends Evento{}

class Verificacion extends Evento {}


