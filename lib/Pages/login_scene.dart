import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/forgetpass.dart';
import 'package:flutter_app/Pages/signup_scene.dart';


class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Récupérer les dimensions de l'écran
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF212936), // Utilisation de Scaffold ici
      body: SingleChildScrollView( // Ajout du défilement
        child: Container(
          width: screenWidth,
          height: screenHeight,
          child: Stack(
            children: [
              Positioned(
                left: screenWidth * 0.1, // Réduit l'espace à gauche
                top: screenHeight * 0.2, // Ajustement de la position top
                child: Container(
                  width: screenWidth * 0.8, // Augmentation de la largeur du conteneur
                  height: screenHeight * 0.6, // Augmentation de la hauteur pour donner plus d'espace
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start, // Alignement en haut
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Logo
                      Image.asset(
                        'assets/logo.png',
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 40), // Espacement

                      // Champ email
                      TextField(
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
                      const SizedBox(height: 20), // Espacement

                      // Champ mot de passe
                      TextField(
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
                      const SizedBox(height: 20), // Espacement

                      // Bouton Login
                      ElevatedButton(
                        onPressed: () {
                          // Action à exécuter lors de la connexion
                        },
                        child: const Text('Login'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFB1E457),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                          minimumSize: const Size(double.infinity, 50),
                        ),
                      ),
                      const SizedBox(height: 20), // Espacement

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
                      const SizedBox(height: 10), // Espacement

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
