import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Pour convertir en JSON
import 'package:login/login_scene.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? selectedNationality;
  bool isTermsAccepted = false;

  final List<String> nationalities = [
    'Select Nationality',
    'American',
    'Canadian',
    'British',
    'French',
    'German',
    'Italian',
    'Spanish',
    'Tunisian',
  ];

  // Contrôleurs pour les champs de texte
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF212936),
      body: Center(
        child: Container(
          width: screenWidth * 0.8,
          constraints: BoxConstraints(
            maxHeight: screenHeight * 0.9,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo
                Image.asset(
                  'assets/logo.png',
                  height: 100,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 40), // Espacement après le logo

                // Champ Email
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
                const SizedBox(height: 20), // Espacement entre les champs

                // Champ Numéro de téléphone
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle: const TextStyle(color: Colors.white),
                    fillColor: const Color(0xFF6C727F),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 20), // Espacement entre les champs

                // Liste déroulante pour la nationalité
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Nationality',
                    labelStyle: const TextStyle(color: Colors.white),
                    fillColor: const Color(0xFF6C727F),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  value: selectedNationality,
                  items: nationalities.map((String nationality) {
                    return DropdownMenuItem<String>(
                      value: nationality,
                      child: Text(
                        nationality,
                        style: const TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedNationality = newValue;
                    });
                  },
                ),
                const SizedBox(height: 20), // Espacement entre les champs

                // Champ Mot de passe
                TextField(
                  controller: passwordController,
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
                  obscureText: true,
                ),
                const SizedBox(height: 20), // Espacement entre les champs

                // Champ Confirmer le mot de passe
                TextField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    labelStyle: const TextStyle(color: Colors.white),
                    fillColor: const Color(0xFF6C727F),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20), // Espacement entre les champs

                // Checkbox pour accepter les conditions
                Row(
                  children: [
                    Checkbox(
                      value: isTermsAccepted,
                      onChanged: (bool? value) {
                        setState(() {
                          isTermsAccepted = value ?? false;
                        });
                      },
                      activeColor: const Color(0xFFB1E457),
                    ),
                    Expanded(
                      child: Text(
                        'I agree to the terms and conditions',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20), // Espacement avant le bouton

                // Bouton S'inscrire
                ElevatedButton(
                  onPressed: () async {
                    if (isTermsAccepted &&
                        selectedNationality != null &&
                        selectedNationality != 'Select Nationality') {
                           try {
        final response = await http.post(
          Uri.parse('http://localhost:3000/api/users/register'), // Remplacez par votre URL
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'email': emailController.text,
            'phone': phoneController.text,
            'nationality': selectedNationality!,
            'password': passwordController.text,
          }),
        );

       if (response.statusCode == 201) {
  // Traitement en cas de succès
  print('User registered successfully: ${response.body}');
  
  // Afficher un message de succès
  showDialog(
    context: context, // Utilisez le BuildContext actuel
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Succès'),
        content: Text('Compte créé avec succès !'),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(); // Fermer la boîte de dialogue
              // Naviguer vers une autre page si nécessaire
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()), // Remplacez par la page suivante
              );
            },
          ),
        ],
      );
    },
  );
}
else {
          // Gestion des erreurs
          print('Failed to register user: ${response.statusCode}, ${response.body}');
        }
      } catch (e) {
        print('Error occurred: $e');
      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Veuillez accepter les conditions et sélectionner une nationalité.')),
                      );
                    }
                  },
                  child: const Text('Sign Up'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB1E457),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                ),
                const SizedBox(height: 30), // Espacement avant le lien

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
