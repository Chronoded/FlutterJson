class RegistroRaza{
  late final List nomRaza;
  late final String SubRazas;

  RegistroRaza._(this.nomRaza, this.SubRazas);

  factory RegistroRaza.constructor({
    required List propuestaR,
    required String propuestaSubRaza,
  }){
    final resultado = RegistroRaza._(propuestaR, propuestaSubRaza);
    return resultado;
  }
  
}