import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tourist_app/models/user_model.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  // firebase
  final _auth = FirebaseAuth.instance;

  // clave del formulario
  final _formKey = GlobalKey<FormState>();

  // Controles de edicion
  final identificacionController = TextEditingController();
  final nombreController = TextEditingController();
  final apellidoController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    // campo identificacion
    final identificacionField = TextFormField(
      autofocus: false,
      controller: identificacionController,
      keyboardType: TextInputType.number,
      validator: ( value ){
        RegExp regex = RegExp(r'^.{10,10}$');
        if(value!.isEmpty){
          return ('La identificación es obligatoria');
        }
        if(!regex.hasMatch(value)){
          return ("La identificación debe contener 10 caracteres");
        }
        return null;
      },
      onSaved: ( value ){
        identificacionController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.perm_contact_calendar_outlined),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'N° Identificación',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        )
      ),
    );

    // campo nombre
    final nombreField = TextFormField(
      autofocus: false,
      controller: nombreController,
      keyboardType: TextInputType.name,
      validator: ( value ){
        RegExp regex = RegExp(r'^.{3,}$');
        if(value!.isEmpty){
          return ('El nombre es obligatorio');
        }
        if(!regex.hasMatch(value)){
          return ("El nombre debe contener mas de 3 caracteres");
        }
        return null;
      },
      onSaved: ( value ){
        nombreController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.account_circle_rounded),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Nombre',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        )
      ),
    );

    // campo apellido
    final apellidoField = TextFormField(
      autofocus: false,
      controller: apellidoController,
      keyboardType: TextInputType.name,
      validator: ( value ){
        RegExp regex = RegExp(r'^.{3,}$');
        if(value!.isEmpty){
          return ('El apellido es obligatorio');
        }
        if(!regex.hasMatch(value)){
          return ("El apellido debe contener mas de 3 caracteres");
        }
        return null;
      },
      onSaved: ( value ){
        apellidoController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.account_circle_rounded),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Apellido',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        )
      ),
    );

    // campo de email
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: ( value ){
        if(value!.isEmpty){
          return ("Por favor ingresa tu email");
        }
        // reg expresion para validacion email
        if(!RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(value)){
          return ('Por favor ingrese un email válido');
        }
        return null;
      },
      onSaved: ( value ){
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.mail),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        )
      ),
    );

    // campo de password
    final passwordField = TextFormField(
      autofocus: false,
      autocorrect: false,
      obscureText: true,
      controller: passwordController,
      validator: ( value ){
        RegExp regex = RegExp(r'^.{8,}$');
        if(value!.isEmpty){
          return ('La contraseña es obligatoria para ingresar');
        }
        if(!regex.hasMatch(value)){
          return ("La contraseña debe ser de 8 o más caracteres");
        }
        return null;
      },
      onSaved: ( value ){
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Contraseña',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        )
      ),
    );

    // campo confirmacion password
    final confirmPasswordField = TextFormField(
      autofocus: false,
      autocorrect: false,
      obscureText: true,
      controller: confirmPasswordController,
      validator: ( value ){
        if(confirmPasswordController.text!= passwordController.text){
          return 'La contraseña no coincide';
        }
        return null;
      },
      onSaved: ( value ){
        confirmPasswordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Confirmar Contraseña',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        )
      ),
    );

    // boton registrar
    final registerButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.green[400],
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){
          registrarse(emailController.text, passwordController.text);
        },
        child: const Text(
          'Registar', 
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 100,
                      child: Image(
                        image: AssetImage("assets/img/logo-png.png"),
                        width: 100,
                        height: 100,
                      )
                    ),
                    const SizedBox(height: 45,),
                    identificacionField,
                    const SizedBox(height: 20,),
                    nombreField,
                    const SizedBox(height: 20,),
                    apellidoField,
                    const SizedBox(height: 20,),
                    emailField,
                    const SizedBox(height: 20,),
                    passwordField,
                    const SizedBox(height: 20,),
                    confirmPasswordField,
                    const SizedBox(height: 35,),
                    registerButton,
                    const SizedBox(height: 15,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('¿Ya tienes una cuenta? '),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushReplacementNamed(context, 'login');
                          },
                          child: const Text(
                            'Inicia Sesión', 
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold, 
                              fontSize: 15
                            )
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

  }

  void registrarse(String email, String password) async {
    if(_formKey.currentState!.validate()){
      await  _auth.createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => {
          postDetailsToFirestore()
        }).catchError((e){
          Fluttertoast.showToast(msg: e!.message);
        });
    }
  }

  postDetailsToFirestore() async {
    // llamando a nuestro firestore
    // llamando a nuestro UserModel
    // enviando los valores

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // escribiendo todos los valores
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.identificacion = identificacionController.text;
    userModel.nombre = nombreController.text;
    userModel.apellido = apellidoController.text;

    await firebaseFirestore
      .collection("users")
      .doc(user.uid)
      .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Usuario creado correctamente");

    Navigator.pushReplacementNamed(context, 'home');
  }

}