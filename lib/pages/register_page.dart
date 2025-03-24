import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phi_app/components/login_button.dart';
import 'package:phi_app/components/login_text_field.dart';
import 'package:phi_app/components/my_colors.dart';

/// RegisterPage widget that handles user registration functionality
class RegisterPage extends StatefulWidget {
  final VoidCallback onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  static const double _padding = 26.0;
  static const double _spacing = 20.0;
  static const double _largeSpacing = 30.0;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String _errorMessage = '';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _showError(String message) {
    setState(() => _errorMessage = message);
  }

  Future<void> _signUserUp() async {
    try {
      if (!_validatePasswords()) return;

      await _showLoadingDialog();
      await _createUserAccount();

      if (mounted) Navigator.pop(context); // Remove loading dialog
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        Navigator.pop(context); // Remove loading dialog
        _showError(e.message ?? 'An error occurred during registration');
      }
    }
  }

  bool _validatePasswords() {
    if (_passwordController.text != _confirmPasswordController.text) {
      _showError('Passwords do not match!');
      return false;
    }
    return true;
  }

  Future<void> _showLoadingDialog() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );
  }

  Future<void> _createUserAccount() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(_padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLogo(),
                const SizedBox(height: _spacing),
                _buildTitle(),
                const SizedBox(height: _spacing),
                _buildErrorMessage(),
                const SizedBox(height: 10),
                _buildEmailField(),
                const SizedBox(height: _spacing),
                _buildPasswordField(),
                const SizedBox(height: _spacing),
                _buildConfirmPasswordField(),
                const SizedBox(height: _largeSpacing),
                _buildRegisterButton(),
                const SizedBox(height: _spacing),
                _buildLoginPrompt(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Image.asset(
      'lib/images/logo.png',
      height: 100,
    );
  }

  Widget _buildTitle() {
    return const Text(
      'PHI Assistant',
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: MyColors.mainColor,
      ),
    );
  }

  Widget _buildErrorMessage() {
    return Text(
      _errorMessage,
      style: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildEmailField() {
    return LoginTextField(
      controller: _emailController,
      obscureText: false,
      hintText: 'Email',
    );
  }

  Widget _buildPasswordField() {
    return LoginTextField(
      controller: _passwordController,
      obscureText: true,
      hintText: 'Password',
    );
  }

  Widget _buildConfirmPasswordField() {
    return LoginTextField(
      controller: _confirmPasswordController,
      obscureText: true,
      hintText: 'Confirm Password',
    );
  }

  Widget _buildRegisterButton() {
    return LoginButton(
      onTap: _signUserUp,
      buttonText: 'Register',
    );
  }

  Widget _buildLoginPrompt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already Registered?  ',
          style: TextStyle(fontSize: 15),
        ),
        GestureDetector(
          onTap: widget.onTap,
          child: Text(
            'Log In',
            style: TextStyle(
              color: Colors.blue[800],
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
