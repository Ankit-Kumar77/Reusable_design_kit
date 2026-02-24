import 'package:design_kit/design_adk/src/widgets/atoms/inputs/primary_textfield.dart';
import 'package:flutter/material.dart';
import '../../../shared/preview_container.dart';

class TextFieldPreview extends StatefulWidget {
  const TextFieldPreview({super.key});

  @override
  State<TextFieldPreview> createState() => _TextFieldPreviewState();
}

class _TextFieldPreviewState extends State<TextFieldPreview> {
  final _defaultController = TextEditingController();
  final _labelController = TextEditingController();
  final _errorController = TextEditingController();
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _defaultController.dispose();
    _labelController.dispose();
    _errorController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PreviewSectionHeader(title: 'TextField', badge: 'Atom'),

        // ── Default ───────────────────────────────────────────────────
        PreviewCard(
          title: 'Default TextField',
          description:
              'The standard input field from DesignKit with hint text and focus border.',
          codeSnippet: '''PrimaryTextField(
  hintText: 'Enter your name',
  controller: controller,
)''',
          child: SizedBox(
            width: 340,
            child: PrimaryTextField(
              hintText: 'Enter your name',
              controller: _defaultController,
            ),
          ),
        ),

        // ── With Label ────────────────────────────────────────────────
        PreviewCard(
          title: 'TextField with Label',
          description: 'Pair the field with a styled label for form context.',
          codeSnippet: '''Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text('Email address', style: labelStyle),
    SizedBox(height: 6),
    PrimaryTextField(
      hintText: 'you@example.com',
      controller: controller,
    ),
  ],
)''',
          child: SizedBox(
            width: 340,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Email address',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFCBD5E1),
                  ),
                ),
                const SizedBox(height: 6),
                PrimaryTextField(
                  hintText: 'you@example.com',
                  controller: _labelController,
                ),
              ],
            ),
          ),
        ),

        // ── Error State ───────────────────────────────────────────────
        PreviewCard(
          title: 'Error State',
          description:
              'Shows a red border and error message below the field when validation fails.',
          codeSnippet: '''TextField(
  controller: controller,
  decoration: InputDecoration(
    hintText: 'Enter password',
    errorText: 'Password must be at least 8 characters',
    ...
  ),
)''',
          child: SizedBox(
            width: 340,
            child: TextField(
              controller: _errorController,
              style: const TextStyle(color: Color(0xFFE2E8F0)),
              decoration: InputDecoration(
                hintText: 'Enter password',
                hintStyle: const TextStyle(color: Color(0xFF64748B)),
                filled: true,
                fillColor: const Color(0xFF1E293B),
                errorText: 'Password must be at least 8 characters',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      const BorderSide(color: Color(0xFFEF4444)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      const BorderSide(color: Color(0xFFEF4444)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      const BorderSide(color: Color(0xFFEF4444), width: 2),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      const BorderSide(color: Color(0xFFEF4444)),
                ),
              ),
            ),
          ),
        ),

        // ── Search Variant ────────────────────────────────────────────
        PreviewCard(
          title: 'Search TextField',
          description: 'TextField with a leading search icon for search UIs.',
          codeSnippet: '''TextField(
  decoration: InputDecoration(
    hintText: 'Search components...',
    prefixIcon: Icon(Icons.search_rounded),
    ...
  ),
)''',
          child: SizedBox(
            width: 340,
            child: TextField(
              controller: _searchController,
              style: const TextStyle(color: Color(0xFFE2E8F0)),
              decoration: InputDecoration(
                hintText: 'Search components...',
                hintStyle: const TextStyle(color: Color(0xFF64748B)),
                prefixIcon: const Icon(Icons.search_rounded,
                    color: Color(0xFF64748B), size: 18),
                filled: true,
                fillColor: const Color(0xFF1E293B),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      const BorderSide(color: Color(0xFF334155)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      const BorderSide(color: Color(0xFF334155)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                      color: Color(0xFF6366F1), width: 2),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}