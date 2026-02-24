import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Hero ─────────────────────────────────────────────────────
        _HeroSection(),

        const SizedBox(height: 40),

        // ── Stats Row ─────────────────────────────────────────────────
        Row(
          children: [
            _StatCard(count: '2', label: 'Atoms', icon: Icons.grain_rounded, color: const Color(0xFF6366F1)),
            const SizedBox(width: 16),
            _StatCard(count: '1', label: 'Molecules', icon: Icons.hub_rounded, color: const Color(0xFF8B5CF6)),
            const SizedBox(width: 16),
            _StatCard(count: '1', label: 'Organisms', icon: Icons.account_tree_rounded, color: const Color(0xFFA78BFA)),
          ],
        ),

        const SizedBox(height: 40),

        // ── Getting Started heading ───────────────────────────────────
        const Text(
          'Quick Access',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFFF1F5F9),
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Jump into any component category below.',
          style: TextStyle(fontSize: 13, color: Color(0xFF64748B)),
        ),

        const SizedBox(height: 20),

        // ── Quick-access cards ────────────────────────────────────────
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: const [
            _QuickCard(
              icon: Icons.smart_button_rounded,
              title: 'Buttons',
              subtitle: 'Primary, outlined, disabled variants',
              color: Color(0xFF6366F1),
            ),
            _QuickCard(
              icon: Icons.text_fields_rounded,
              title: 'TextField',
              subtitle: 'Text inputs with states & validation',
              color: Color(0xFF0EA5E9),
            ),
            _QuickCard(
              icon: Icons.view_agenda_rounded,
              title: 'Form Group',
              subtitle: 'Label + input + action molecule',
              color: Color(0xFF10B981),
            ),
            _QuickCard(
              icon: Icons.space_bar_rounded,
              title: 'App Header',
              subtitle: 'Navigation organism with logo + actions',
              color: Color(0xFFF59E0B),
            ),
          ],
        ),

        const SizedBox(height: 48),

        // ── Info banner ───────────────────────────────────────────────
        _InfoBanner(),
      ],
    );
  }
}

// ── Hero Section ──────────────────────────────────────────────────────────────

class _HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1E1B4B), Color(0xFF0F172A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xFF6366F1).withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFF6366F1).withOpacity(0.4)),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.bolt_rounded, size: 12, color: Color(0xFF818CF8)),
                SizedBox(width: 5),
                Text(
                  'Component Library Playground',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF818CF8),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Title
          const Text(
            'Build Faster with\nDesignKit',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w800,
              color: Color(0xFFF1F5F9),
              height: 1.2,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'A professional design system explorer for Flutter components.\nBrowse atoms, molecules, and organisms — all in one place.',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF94A3B8),
              height: 1.6,
            ),
          ),
          const SizedBox(height: 28),
          Row(
            children: [
              _HeroButton(
                label: 'Browse Components',
                icon: Icons.arrow_forward_rounded,
                primary: true,
              ),
              const SizedBox(width: 12),
              _HeroButton(
                label: 'View Source',
                icon: Icons.open_in_new_rounded,
                primary: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeroButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool primary;

  const _HeroButton({
    required this.label,
    required this.icon,
    required this.primary,
  });

  @override
  State<_HeroButton> createState() => _HeroButtonState();
}

class _HeroButtonState extends State<_HeroButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
        decoration: BoxDecoration(
          gradient: widget.primary
              ? LinearGradient(
                  colors: _hovered
                      ? [const Color(0xFF818CF8), const Color(0xFF6366F1)]
                      : [const Color(0xFF6366F1), const Color(0xFF4F46E5)],
                )
              : null,
          color: widget.primary
              ? null
              : (_hovered ? const Color(0xFF334155) : const Color(0xFF1E293B)),
          borderRadius: BorderRadius.circular(9),
          border: widget.primary
              ? null
              : Border.all(color: const Color(0xFF334155)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: widget.primary ? Colors.white : const Color(0xFFCBD5E1),
              ),
            ),
            const SizedBox(width: 6),
            Icon(widget.icon,
                size: 14,
                color:
                    widget.primary ? Colors.white : const Color(0xFFCBD5E1)),
          ],
        ),
      ),
    );
  }
}

// ── Stat Card ─────────────────────────────────────────────────────────────────

class _StatCard extends StatelessWidget {
  final String count;
  final String label;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.count,
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF334155)),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  count,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFFF1F5F9),
                    height: 1,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ── Quick-access card ─────────────────────────────────────────────────────────

class _QuickCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  const _QuickCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  State<_QuickCard> createState() => _QuickCardState();
}

class _QuickCardState extends State<_QuickCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 240,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: _hovered ? const Color(0xFF1E293B) : const Color(0xFF172033),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _hovered
                ? widget.color.withOpacity(0.4)
                : const Color(0xFF334155),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: widget.color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(widget.icon, color: widget.color, size: 18),
            ),
            const SizedBox(height: 14),
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFFE2E8F0),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.subtitle,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF64748B),
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Info banner ───────────────────────────────────────────────────────────────

class _InfoBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0EA5E9).withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF0EA5E9).withOpacity(0.25)),
      ),
      child: const Row(
        children: [
          Icon(Icons.info_outline_rounded,
              color: Color(0xFF0EA5E9), size: 20),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Select a component from the sidebar to see its live preview, variants, and Dart code snippets.',
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF7DD3FC),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
