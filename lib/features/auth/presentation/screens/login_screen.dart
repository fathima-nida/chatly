import 'package:flutter/material.dart';
import 'package:messaging_app/core/utils/validation.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../widgets/auth_header.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    // Simulated network delay. Replace with FirebaseAuth.signInWithEmailAndPassword.
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;
    setState(() => _isLoading = false);

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.xl,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: AppSpacing.xl),
                const AuthHeader(
                  title: 'Welcome Back',
                  subtitle: 'Log in to continue your conversations.',
                ),
                const SizedBox(height: AppSpacing.xl),
                CustomTextField(
                  label: 'Email',
                  hint: 'you@example.com',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.mail_outline_rounded,
                  validator: Validators.email,
                ),
                const SizedBox(height: AppSpacing.md),
                CustomTextField(
                  label: 'Password',
                  hint: '••••••••',
                  controller: _passwordController,
                  isPassword: true,
                  prefixIcon: Icons.lock_outline_rounded,
                  textInputAction: TextInputAction.done,
                  validator: (value) => Validators.password(value),
                ),
                const SizedBox(height: AppSpacing.xs),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Forgot password?'),
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                CustomButton(
                  label: 'Log In',
                  isLoading: _isLoading,
                  onPressed: _handleLogin,
                ),
                const SizedBox(height: AppSpacing.lg),
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                      child: Text('or', style: AppTextStyle.caption()),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? ",
                        style: AppTextStyle.caption()),
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const RegisterScreen(),
                        ),
                      ),
                      child: Text(
                        'Register',
                        style: AppTextStyle.bodyMedium(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
