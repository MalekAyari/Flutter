import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/login_scene.dart';

class ForgetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Récupérer la largeur et la hauteur de l'écran
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF212936),
      body: Center( // Centrer le contenu
        child: Container(
          width: screenWidth * 0.8, // Largeur du conteneur
          constraints: BoxConstraints(
            maxHeight: screenHeight * 0.75, // Limite de hauteur
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView( // Permettre le défilement
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, // Alignement en haut
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo en haut
                Image.asset(
                  'assets/logo.png', // Remplace par ton logo
                  height: 100,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 40), // Espacement après le logo

                // Champ Email
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
                const SizedBox(height: 30), // Espacement entre les champs

                // Bouton pour envoyer le lien de réinitialisation
                ElevatedButton(
                  onPressed: () {
                    // Action pour envoyer le lien de réinitialisation
                  },
                  child: const Text('Send Reset Link'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB1E457),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                    minimumSize: const Size(double.infinity, 50), // Remplir la largeur
                  ),
                ),
                const SizedBox(height: 40), // Augmenter l'espacement avant le lien

                // Lien pour revenir à la page de connexion
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: const Text(
                    'Back to Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
