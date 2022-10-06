import 'package:flutter_test/flutter_test.dart';
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
        expect(r.SubRazas, equals(["boston" "english", "french"]));
        expect(r.nomRaza, equals("success"));
      });
    });
  });
}