// dart
// File: lib/features/login/presentation/pages/login_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../config/route/app_route.dart';
import '../provider/LoginProvider.dart';
import '../widget/error_widget.dart';
import '../widget/inputDecoration.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController(text: 'abir');
  final _passCtrl = TextEditingController(text: 'ati123');

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          body: Stack(
            children: [
              Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 420),
                    child: Card(
                      elevation: 10,
                      shadowColor: Colors.black26,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Welcome Back',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Sign in to continue',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              const SizedBox(height: 24),

                              TextFormField(
                                controller: _emailCtrl,
                                keyboardType: TextInputType.emailAddress,
                                decoration: inputDecoration(
                                  'Username',
                                  Icons.person_outline,
                                ),
                              ),
                              const SizedBox(height: 16),

                              TextFormField(
                                controller: _passCtrl,
                                obscureText: true,
                                decoration: inputDecoration(
                                  'Password',
                                  Icons.lock_outline,
                                ),
                              ),
                              const SizedBox(height: 24),

                              SizedBox(
                                width: double.infinity,
                                height: 48,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: provider.isLoading
                                      ? null
                                      : () {
                                    provider.loginUser(
                                      _emailCtrl.text.trim(),
                                      _passCtrl.text.trim(),
                                        (){
                                          Navigator.of(context).pushReplacementNamed(AppRoute.dashboardRoute);
                                        }
                                    );
                                  },
                                  child: const Text(
                                    'Sign In',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),

                              if (provider.error != null) ...[
                                const SizedBox(height: 16),
                                Text(
                                  provider.error!,
                                  style: const TextStyle(color: Colors.red),
                                  textAlign: TextAlign.center,
                                ),
                              ],

                              const SizedBox(height: 12),
                              TextButton(
                                onPressed: () {},
                                child: const Text('Forgot password?'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              if (provider.isLoading)
                Positioned.fill(
                  child: Container(
                    color: Colors.black38,
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                ),
            ],
          ),

        );
      },
    );
  }
}
