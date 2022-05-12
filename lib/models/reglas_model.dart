
class ReglasModel {

  final String title;
  final String imageName;
  final String descripcion;

  ReglasModel(
    this.title,
    this.imageName,
    this.descripcion
  );

}

List<ReglasModel> dataList = [
  ReglasModel("Regla 1", "assets/img/regla1.png", "Mantenga una distancia de 2 metros de la fauna incluidas las cámaras."),
  ReglasModel("Regla 2", "assets/img/regla2.png", "No toque ni alimente la fauna."),
  ReglasModel("Regla 3", "assets/img/regla3.png", "No retire elementos del ecosistema."),
  ReglasModel("Regla 4", "assets/img/regla4.png", "No fume, no beba alcohol, ni haga fogatas."),
  ReglasModel("Regla 5", "assets/img/regla5.png", "Camine dentro de los senderos."),
  ReglasModel("Regla 6", "assets/img/regla6.png", "Tome fotos sin flash. Filmaciones profesionales y drones necesitan autorización."),
  ReglasModel("Regla 7", "assets/img/regla7.png", "Acampe en los sitios designados, con autorización previa."),
  ReglasModel("Regla 8", "assets/img/regla8.png", "Use embarcaciones de pesca vivencial autorizadas."),
  ReglasModel("Regla 9", "assets/img/regla9.png", "No introduzca elementos externos al ecosistema."),
  ReglasModel("Regla 10", "assets/img/regla10.png", "No use vehículos acuáticos motorizados, submarinos, ni turismo aéreo."),
];
