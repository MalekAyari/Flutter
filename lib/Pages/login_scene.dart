import 'dart:convert'; // Importer pour utiliser jsonEncode
import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/EditAccount.dart';
import 'package:flutter_app/Pages/forgetpass.dart';
import 'package:flutter_app/Pages/signup_scene.dart';
import 'package:flutter_app/Pages/wallet.dart';
import 'package:http/http.dart' as http; // Importer http pour les requêtes réseau


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Contrôleurs pour les champs de texte
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String userId = '';
  // Fonction de connexion
  Future<void> _login() async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:3000/api/users/login'), // Remplacez par votre URL de connexion
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': emailController.text,
        'password': passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      // Traitement en cas de succès
      print('User logged in successfully: ${response.body}');
      final data = jsonDecode(response.body);
      userId = data['user']['_id'];
      // Afficher un message de succès
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Connexion réussie !')),
      );
        Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyWalletPage(userId: userId)), // Remplacez par la page suivante
              );
      // Naviguer vers une autre page si nécessaire
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NextPage())); // Remplacez par la page suivante
    } else {
      // Gestion des erreurs
      print('Failed to log in: ${response.statusCode}, ${response.body}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Échec de la connexion !')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Récupérer les dimensions de l'écran
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF212936),
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          child: Stack(
            children: [
              Positioned(
                left: screenWidth * 0.1,
                top: screenHeight * 0.2,
                child: Container(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.6,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 40),

                      // Champ email
                      TextField(
                        controller: emailController, // Ajout du contrôleur
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: const TextStyle(color: Colors.white),
                          fillColor: const Color(0xFF6C727F),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Champ mot de passe
                      TextField(
                        controller: passwordController, // Ajout du contrôleur
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(color: Colors.white),
                          fillColor: const Color(0xFF6C727F),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Bouton Login
                      ElevatedButton(
                        onPressed: _login, // Appeler la fonction de connexion
                        child: const Text('Login'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFB1E457),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                          minimumSize: const Size(double.infinity, 50),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Lien pour mot de passe oublié
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgetPassword(),
                            ),
                          );
                        },
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(color: Color(0xFFB1E457)),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Lien pour inscription
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUp(),
                            ),
                          );
                        },
                        child: const Text(
                          'Don’t have an account? Sign up',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
