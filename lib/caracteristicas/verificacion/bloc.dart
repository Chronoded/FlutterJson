//Estados y Eventos

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razajsonapp/caracteristicas/dominio/registroRaza.dart';
import 'package:razajsonapp/caracteristicas/dominio/varDominio.dart';
import 'package:razajsonapp/caracteristicas/dominio/problemas.dart';
import 'package:razajsonapp/caracteristicas/repositorio_verificacion.dart';

class Estado {}

class Creandose extends Estado{}

class SolicitarRaza extends Estado {}

class EsperandoConfirmacion extends Estado {}



class MostrandoRazaConf extends Estado  {
  final RegistroRaza registroRaza;
  final NickFormado nombreRaza;

  MostrandoRazaConf(this.registroRaza, this.nombreRaza);
}

class MostrandoRazaNoConf extends Estado{
  final NickFormado nombreRazaNoCofirmada;

  MostrandoRazaNoConf(this.nombreRazaNoCofirmada);
}

class MostrandoRazaSinSubRazas extends Estado {
  final NickFormado nombreRazaSinSubRazas;

  MostrandoRazaSinSubRazas(this.nombreRazaSinSubRazas);
}

class MostrandoSolicitudActualizacion extends Estado {}

class Evento {}

class Creado extends Evento{}

class NombreRecibidoRaza extends Evento{
  final NickFormado raza;
  NombreRecibidoRaza(this.raza);
}

class Verificacion extends Evento {}

class BlocVerificacion extends Bloc<Evento, Estado> {
  final RepositorioVerificacion _repositorioVerificacion;
  BlocVerificacion(this._repositorioVerificacion) : super(Creandose()) {
    on<Creado>((event, emit) {
      emit(SolicitarRaza());
    });

    on<NombreRecibidoRaza>((event, emit) {
      emit(EsperandoConfirmacion());
      final resultado =
          _repositorioVerificacion.obtenerRegistroRaza(event.raza);
      resultado.match((l) {
        if (l is IncorrectoJson) emit(MostrandoSolicitudActualizacion());
        if (l is NoRegistradaRaza) emit(MostrandoRazaNoConf(event.raza));
        if (l is SinSubRazas) emit(MostrandoRazaSinSubRazas(event.raza));
      }, (r) {
        emit(MostrandoRazaConf(r, event.raza));
      });
    });
  }
}
