import 'package:flutter_test/flutter_test.dart';
import 'package:razajsonapp/caracteristicas/dominio/problemas.dart';
import 'package:razajsonapp/caracteristicas/dominio/varDominio.dart';
import 'package:razajsonapp/caracteristicas/repositorio_verificacion.dart';

void main() {
  group('Pruebas Offline', () {
    test('con bulldog me regresa valor', () {
      RepositorioPruebasVerificacion repositorio = RepositorioPruebasVerificacion();

      var resultado =
          repositorio.obtenerRegistroRaza(NickFormado.constructor('bulldog'));

      resultado.match((l) {
        expect(false, equals(true));
      }, (r) {
        expect(r.SubRazas, equals(["boston", "english", "french"]));
        expect(r.nomRaza, equals('success'));
      });
    });
  });


    test('Con dingo me regresa valor sin subrazas', () {
      RepositorioPruebasVerificacion repositorio =
          RepositorioPruebasVerificacion();

      var resultado =
          repositorio.obtenerRegistroRaza(NickFormado.constructor('dingo'));
      resultado.match((l) {
        expect(true, equals(true));
      }, (r) {
        expect(r.SubRazas, equals([]));
        expect(r.nomRaza, equals('success'));
      });
    });

  



  test('Con incorrecto me regresa de json incorrecto', () {
      RepositorioPruebasVerificacion repositorio =
          RepositorioPruebasVerificacion();

      var resultado = repositorio
          .obtenerRegistroRaza(NickFormado.constructor('Incorrecto'));
      resultado.match((l) {
        expect(l, isA<IncorrectoJson>());
      }, (r) {
        assert(false);
      });
    });
}