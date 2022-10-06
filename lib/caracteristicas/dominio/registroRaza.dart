class RegistroRaza{
  late final String nomRaza;
  late final List<String> SubRazas;

  RegistroRaza._(this.nomRaza, this.SubRazas);

  factory RegistroRaza.constructor({
    required String propuestaR,
    required List<String> propuestaSubRaza,
  }){
    final resultado = RegistroRaza._(propuestaR, propuestaSubRaza);
    return resultado;
  }
  
}