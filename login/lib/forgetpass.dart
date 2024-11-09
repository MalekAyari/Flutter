import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Pour décoder la réponse JSON
import 'package:login/login_scene.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _emailController = TextEditingController();

  Future<void> _sendResetLink() async {
    final email = _emailController.text;
    final url = 'http://localhost:3000/api/users/forgot-password'; // Remplacez par l'URL de votre API

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email}),
      );

      if (response.statusCode == 200) {
        // Traitement en cas de succès
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Un lien de réinitialisation a été envoyé à votre e-mail.')),
        );
      } else {
        // Traitement en cas d'erreur
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur lors de l\'envoi du lien. Veuillez réessayer.')),
        );
      }
    } catch (error) {
      // Gestion des erreurs réseau
      print('Error: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur réseau. Veuillez vérifier votre connexion.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Récupérer la largeur et la hauteur de l'écran
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF212936),
      body: Center(
        child: Container(
          width: screenWidth * 0.8,
          constraints: BoxConstraints(
            maxHeight: screenHeight * 0.75,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png', // Remplace par ton logo
                  height: 100,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 40),

                // Champ Email
                TextField(
                  controller: _emailController,
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
                const SizedBox(height: 30),

                // Bouton pour envoyer le lien de réinitialisation
                ElevatedButton(
                  onPressed: _sendResetLink,
                  child: const Text('Send Reset Link'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB1E457),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                ),
                const SizedBox(height: 40),

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
