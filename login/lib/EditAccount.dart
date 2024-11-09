import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditAccount extends StatefulWidget {
  @override
  _EditAccountState createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  // Contrôleurs pour les champs de texte
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  // Fonction pour mettre à jour le compte
  Future<void> _updateAccount() async {
    final response = await http.put(
      Uri.parse('http://localhost:3000/api/users/update-password'), // Remplacez par votre URL de mise à jour
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': emailController.text,
        'newPassword': passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      // Traitement en cas de succès
      print('Compte mis à jour avec succès : ${response.body}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Compte mis à jour avec succès !')),
      );
      // Vous pouvez naviguer vers la page de profil ou de connexion après la mise à jour
      // Navigator.pop(context); // Exemple pour revenir à la page précédente
    } else {
      // Gestion des erreurs
      print('Échec de la mise à jour du compte : ${response.statusCode}, ${response.body}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Échec de la mise à jour du compte !')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modifier Compte'),
        backgroundColor: const Color(0xFF212936),
      ),
      backgroundColor: const Color(0xFF212936),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Champ email
            TextField(
              controller: emailController,
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

            // Champ téléphone
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Phone',
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
              controller: passwordController,
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

            // Bouton Mettre à jour
            ElevatedButton(
              onPressed: _updateAccount, // Appeler la fonction de mise à jour
              child: const Text('Mettre à jour'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFB1E457),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
