import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:razajsonapp/caracteristicas/verificacion/bloc.dart';

//Se espera solicitando raza
void main() {
  blocTest<BlocVerificacion, Estado>(
    'emits [MyState] when MyEvent is added.',
    build: () => BlocVerificacion(),
    act: (bloc) => bloc.add(Creado()),
    expect: () => [isA<SolicitarRaza>()],
  );
}