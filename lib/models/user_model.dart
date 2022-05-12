
class UserModel {

  String? uid;
  String? email;
  String? identificacion;
  String? nombre;
  String? apellido;

  UserModel({this.uid, this.email, this.identificacion, this.nombre, this.apellido});

  // recibiendo datos desde el servidor
  factory UserModel.fromMap(map){
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      identificacion: map['identificacion'],
      nombre: map['nombre'],
      apellido: map['apellido']
    );
  }

  // enviando datos al servidor
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'identificacion': identificacion,
      'nombre': nombre,
      'apellido': apellido,
    };
  }

}
