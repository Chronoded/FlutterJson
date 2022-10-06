const String mensajeRegistroRazaError = "Registro de raza Incorrecta";
class RegistroRaza{
  late final List<String> nomRaza;
  late final String SubRazas;

  RegistroRaza._(this.nomRaza, this.SubRazas);

  factory RegistroRaza.constructor({
    required List<String> propuestaR,
    required String propuestaSubRaza,
  }){
     if (propuestaR == "Breed not found (master breed does not exist)") {
      throw mensajeRegistroRazaError;
    }

    if (propuestaSubRaza == "error") {
      throw mensajeRegistroRazaError;
    }
    RegistroRaza._(propuestaR, propuestaSubRaza);
    final resultado = RegistroRaza._(propuestaR, propuestaSubRaza);
    return resultado;
  }
  
}