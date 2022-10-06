class NickFormado {
  late final String valor;


  NickFormado._(this.valor);

  factory NickFormado.constructor(String propuesta){
    if (propuesta.trim().isEmpty) {
      throw ('Nombre raza esta mal formado');
    }
    return NickFormado._(propuesta);
  }
}