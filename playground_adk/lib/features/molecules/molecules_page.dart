import 'package:flutter/material.dart';
import 'package:design_kit/design_kit.dart';
import '../../shared/preview_container.dart';

class MoleculesPage extends StatefulWidget {
  const MoleculesPage({super.key});

  @override
  State<MoleculesPage> createState() => _MoleculesPageState();
}

class _MoleculesPageState extends State<MoleculesPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  bool _submitted = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PreviewSectionHeader(title: 'Molecules', badge: 'Composed'),

        // ── Form Group ─────────────────────────────────────────────────
        PreviewCard(
          title: 'Form Group',
          description:
              'A label + text field + button molecule — the fundamental unit of data collection.',
          codeSnippet: '''Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text('Full Name', style: labelStyle),
    SizedBox(height: 6),
    PrimaryTextField(
      hintText: 'Enter your full name',
      controller: controller,
    ),
    SizedBox(height: 16),
    PrimaryButton(
      text: 'Submit',
      onPressed: () => handleSubmit(),
    ),
  ],
)''',
          child: SizedBox(
            width: 360,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Full Name',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFCBD5E1),
                  ),
                ),
                const SizedBox(height: 6),
                PrimaryTextField(
                  hintText: 'Enter your full name',
                  controller: _nameController,
                ),
                const SizedBox(height: 16),
                PrimaryButton(
                  text: _submitted ? '✓ Submitted!' : 'Submit',
                  onPressed: () =>
                      setState(() => _submitted = !_submitted),
                ),
              ],
            ),
          ),
        ),

        // ── Login Form ─────────────────────────────────────────────────
        PreviewCard(
          title: 'Login Form',
          description:
              'A more complex molecule: email + password fields with a full-width CTA.',
          codeSnippet: '''Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    _FormField(label: 'Email', hint: 'you@example.com'),
    SizedBox(height: 16),
    _FormField(label: 'Password', hint: '••••••••', obscure: true),
    SizedBox(height: 24),
    SizedBox(
      width: double.infinity,
      child: PrimaryButton(text: 'Sign In', onPressed: () {}),
    ),
  ],
)''',
          child: SizedBox(
            width: 360,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _FormField(
                  label: 'Email',
                  hint: 'you@example.com',
                  controller: _emailController,
                ),
                const SizedBox(height: 16),
                _FormField(
                  label: 'Password',
                  hint: '••••••••',
                  controller: TextEditingController(),
                  obscure: true,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6366F1),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Center(
                  child: Text(
                    "Don't have an account? Sign up",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF818CF8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _FormField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool obscure;

  const _FormField({
    required this.label,
    required this.hint,
    required this.controller,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Color(0xFFCBD5E1),
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          obscureText: obscure,
          style: const TextStyle(color: Color(0xFFE2E8F0)),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Color(0xFF64748B)),
            filled: true,
            fillColor: const Color(0xFF1E293B),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFF334155)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFF334155)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  const BorderSide(color: Color(0xFF6366F1), width: 2),
            ),
          ),
        ),
      ],
    );
  }
}