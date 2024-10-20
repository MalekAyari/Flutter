import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/login_scene.dart';

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
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF212936),
      body: Center( // Centrer le contenu
        child: Container(
          width: screenWidth * 0.8, // Ajustement de la largeur
          constraints: BoxConstraints(
            maxHeight: screenHeight * 0.9, // Limite de hauteur
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
                  onPressed: () {
                    // Action du bouton d'inscription
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
