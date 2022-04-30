import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // clave del formulario
  final _formKey = GlobalKey<FormState>();

  // controlador de edicion
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
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
        if(RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(value)){
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
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.green,
            width: 2
          ),
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
      },
      onSaved: ( value ){
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Contraseña',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.green,
            width: 2
          ),
          borderRadius: BorderRadius.circular(10),
        )
      ),
    );

    // boton
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.green[400],
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){
          
        },
        child: const Text(
          'Ingresar', 
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
                      height: 200,
                      child: Icon(Icons.person_pin, color: Colors.green, size: 100,)
                    ),
                    const SizedBox(height: 45,),
                    emailField,
                    const SizedBox(height: 25,),
                    passwordField,
                    const SizedBox(height: 35,),
                    loginButton,
                    const SizedBox(height: 15,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('¿No tienes una cuenta? '),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushReplacementNamed(context, 'register');
                          },
                          child: const Text(
                            'Regístrate', 
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

}