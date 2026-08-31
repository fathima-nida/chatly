import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/utils/validation.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../widgets/auth_header.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isLoading = false;

  Future<void> _handleRegister() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    // Simulated network delay. Replace with FirebaseAuth.createUserWithEmailAndPassword.
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;
    setState(() => _isLoading = false);

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const HomeScreen()),
      (route) => false,
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: const BackButton(color: AppColors.textPrimary),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const AuthHeader(
                  title: 'Create Account',
                  subtitle: 'Join and start chatting in seconds.',
                ),
                const SizedBox(height: AppSpacing.lg),
                Container(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadow,
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextField(
                        label: 'Full Name',
                        hint: 'John Doe',
                        controller: _nameController,
                        prefixIcon: Icons.person_outline_rounded,
                        validator: Validators.name,
                      ),
                      const SizedBox(height: AppSpacing.md),
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
                        validator: (value) => Validators.password(value),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      CustomTextField(
                        label: 'Confirm Password',
                        hint: '••••••••',
                        controller: _confirmPasswordController,
                        isPassword: true,
                        prefixIcon: Icons.lock_outline_rounded,
                        textInputAction: TextInputAction.done,
                        validator: (value) => Validators.confirmPassword(
                          value,
                          _passwordController.text,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                CustomButton(
                  label: 'Register',
                  isLoading: _isLoading,
                  onPressed: _handleRegister,
                ),
                const SizedBox(height: AppSpacing.lg),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account? ',
                        style: AppTextStyle.caption()),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Text(
                        'Log In',
                        style: AppTextStyle.bodyMedium(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
