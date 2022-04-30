
class UserModel {

  String? uid;
  String? email;
  String? nombre;
  String? apellido;

  UserModel({this.uid, this.email, this.nombre, this.apellido});

  // recibiendo datos desde el servidor
  factory UserModel.fromMap(map){
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      nombre: map['nombre'],
      apellido: map['apellido']
    );
  }

  // enviando datos al servidor
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'nombre': nombre,
      'apellido': apellido,
    };
  }

}
