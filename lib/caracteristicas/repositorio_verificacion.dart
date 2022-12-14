import 'dart:convert';
import 'package:fpdart/fpdart.dart';
import 'package:razajsonapp/caracteristicas/dominio/registroRaza.dart';
import 'package:razajsonapp/caracteristicas/dominio/varDominio.dart';
import 'dominio/problemas.dart';

abstract class RepositorioVerificacion {
  Either<Problema, RegistroRaza> obtenerRegistroRaza(NickFormado raza);
}

List campos = ['status', 'message'];

class RepositorioPruebasVerificacion extends RepositorioVerificacion {
  final String _dingo = """{"message":[],"status":"success"} """;

  final String _bulldog =
      """{"message":["boston","english","french"],"status":"success"}""";

  final String _gato = """
  {"status":"error",
  "message":"Breed not found (master breed does not exist)",
  "code":404}
  """;

  final String _Incorrecto = """{"Messagesasdas":[],"status":"success"} """;
  

  @override 
  Either<Problema,RegistroRaza> obtenerRegistroRaza(NickFormado raza){
    if (raza.valor == 'dingo') {
      return obtRazaJson(_dingo);
    }
     if (raza.valor == 'bulldog') {
      return obtRazaJson(_bulldog);
    }
    if (raza.valor == 'gato') {
      return obtRazaJson(_gato);
    }
    if (raza.valor == 'Incorrecto') {
      return left(IncorrectoJson());
    }
    return Left(NoRegistradaRaza());
  }

  
Either<Problema, RegistroRaza> obtRazaJson(String documento) {
  Map<String, dynamic> resultado = jsonDecode(documento);

  if (resultado['message'].isEmpty) {
    return left(SinSubRazas());
  }
  if (resultado['status'] == "error") {
    return left(NoRegistradaRaza());
  }

  return Right(RegistroRaza.constructor(
      propuestaSubRaza: resultado['message'],
      propuestaR: resultado['status']));
}

}