import 'package:flutter/material.dart';
import 'package:design_kit/design_kit.dart';
import '../../../shared/preview_container.dart';

class ButtonsPreview extends StatelessWidget {
  const ButtonsPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PreviewSectionHeader(
          title: 'Buttons',
          badge: 'Atom',
        ),

        // ── Primary Button ─────────────────────────────────────────────
        PreviewCard(
          title: 'Primary Button',
          description: 'The main call-to-action button with brand color fill.',
          codeSnippet: '''PrimaryButton(
  text: 'Click Me',
  onPressed: () {},
)''',
          child: Wrap(
            spacing: 16,
            runSpacing: 12,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              PrimaryButton(text: 'Click Me', onPressed: () {}),
              PrimaryButton(text: 'Save Changes', onPressed: () {}),
              PrimaryButton(text: 'Get Started', onPressed: () {}),
            ],
          ),
        ),

        // ── Outlined / Ghost Button ─────────────────────────────────────
        PreviewCard(
          title: 'Outlined Button',
          description: 'Secondary action with a bordered, transparent style.',
          codeSnippet: '''OutlinedButton(
  onPressed: () {},
  child: Text('Cancel'),
)''',
          child: Wrap(
            spacing: 16,
            runSpacing: 12,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF818CF8),
                  side: const BorderSide(color: Color(0xFF6366F1)),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Cancel'),
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF818CF8),
                  side: const BorderSide(color: Color(0xFF6366F1)),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Learn More'),
              ),
            ],
          ),
        ),

        // ── Disabled State ──────────────────────────────────────────────
        PreviewCard(
          title: 'Disabled State',
          description:
              'Pass null to onPressed or onTap to render a disabled button.',
          codeSnippet: '''PrimaryButton(
  text: 'Unavailable',
  onPressed: null,   // <- disables the button
)''',
          child: Wrap(
            spacing: 16,
            runSpacing: 12,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              ElevatedButton(
                onPressed: null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF334155),
                  disabledBackgroundColor: const Color(0xFF1E293B),
                  disabledForegroundColor: const Color(0xFF475569),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Unavailable'),
              ),
              OutlinedButton(
                onPressed: null,
                style: OutlinedButton.styleFrom(
                  disabledForegroundColor: const Color(0xFF475569),
                  side: const BorderSide(color: Color(0xFF334155)),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Disabled'),
              ),
            ],
          ),
        ),

        // ── Icon Buttons ────────────────────────────────────────────────
        PreviewCard(
          title: 'Icon Buttons',
          description: 'Buttons with leading or trailing icons for added context.',
          codeSnippet: '''ElevatedButton.icon(
  icon: Icon(Icons.download_rounded),
  label: Text('Download'),
  onPressed: () {},
)''',
          child: Wrap(
            spacing: 16,
            runSpacing: 12,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.download_rounded, size: 16),
                label: const Text('Download'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6366F1),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add_rounded, size: 16),
                label: const Text('New Item'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF10B981),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.delete_rounded, size: 16),
                label: const Text('Delete'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEF4444),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}