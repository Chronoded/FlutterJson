import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:razajsonapp/caracteristicas/dominio/varDominio.dart';
import 'package:razajsonapp/caracteristicas/repositorio_verificacion.dart';
import 'package:razajsonapp/caracteristicas/verificacion/bloc.dart';

//Se espera solicitando raza
void main() {
  blocTest<BlocVerificacion, Estado>(
    'emits [MyState] when MyEvent is added.',
    build: () => BlocVerificacion(RepositorioPruebasVerificacion()),
    act: (bloc) => bloc.add(Creado()),
    expect: () => [isA<SolicitarRaza>()],
  );

  blocTest<BlocVerificacion, Estado>(
    'Cuando Nombre recibido sea bulldog debe de tener mostrando nombre confirmado',
    build: () => BlocVerificacion(RepositorioPruebasVerificacion()),
    act: (bloc) =>
        bloc.add(NombreRecibidoRaza(NickFormado.constructor('bulldog'))),
    expect: () =>
        [isA<EsperandoConfirmacion>(), isA<MostrandoRazaConf>()],
  );

  blocTest<BlocVerificacion, Estado>(
    'CUando NOmbre recibido es Dingo debo de tener Mostando nombre confirmado',
    build: () => BlocVerificacion(RepositorioPruebasVerificacion()),
    act: (bloc) =>
        bloc.add(NombreRecibidoRaza(NickFormado.constructor('dingo'))),
    expect: () =>
        [isA<EsperandoConfirmacion>(), isA<MostrandoRazaSinSubRazas>()],
  );

   blocTest<BlocVerificacion, Estado>(
    'CUando NOmbre recibido es gato debo de tener Mostando nombre no confirmado',
    build: () => BlocVerificacion(RepositorioPruebasVerificacion()),
    act: (bloc) => bloc.add(NombreRecibidoRaza(NickFormado.constructor('gato'))),
    expect: () =>
        [isA<EsperandoConfirmacion>(), isA<MostrandoRazaConf>()],
  );

  
  blocTest<BlocVerificacion, Estado>(
    'CUando NOmbre recibido es incorrecto debo de tener Incorrecto Json',
    build: () => BlocVerificacion(RepositorioPruebasVerificacion()),
    act: (bloc) =>
        bloc.add(NombreRecibidoRaza(NickFormado.constructor('Incorrecto'))),
    expect: () =>
        [isA<EsperandoConfirmacion>(), isA<MostrandoSolicitudActualizacion>()],
  );



}