import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        border: Border(
          bottom: BorderSide(color: Color(0xFF334155), width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          // ── Logo ────────────────────────────────────────────
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF6366F1), Color(0xFF818CF8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.widgets_rounded, color: Colors.white, size: 18),
          ),
          const SizedBox(width: 12),
          const Text(
            'DesignKit',
            style: TextStyle(
              color: Color(0xFFF1F5F9),
              fontSize: 16,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: const Color(0xFF6366F1).withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFF6366F1).withOpacity(0.4)),
            ),
            child: const Text(
              'Playground',
              style: TextStyle(
                color: Color(0xFF818CF8),
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const Spacer(),

          // ── Right Controls ────────────────────────────────────
          _HeaderBadge(label: 'v1.0.0'),
          const SizedBox(width: 12),
          const _VerticalDivider(),
          const SizedBox(width: 12),
          _IconButton(icon: Icons.search_rounded, tooltip: 'Search components'),
          const SizedBox(width: 4),
          _IconButton(icon: Icons.dark_mode_rounded, tooltip: 'Toggle theme'),
          const SizedBox(width: 4),
          _IconButton(icon: Icons.open_in_new_rounded, tooltip: 'GitHub'),
        ],
      ),
    );
  }
}

class _HeaderBadge extends StatelessWidget {
  final String label;
  const _HeaderBadge({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF334155),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF94A3B8),
          fontSize: 11,
          fontWeight: FontWeight.w600,
          fontFamily: 'monospace',
        ),
      ),
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider();

  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 24, color: const Color(0xFF334155));
  }
}

class _IconButton extends StatefulWidget {
  final IconData icon;
  final String tooltip;

  const _IconButton({required this.icon, required this.tooltip});

  @override
  State<_IconButton> createState() => _IconButtonState();
}

class _IconButtonState extends State<_IconButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: _hovered
                  ? const Color(0xFF334155)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Icon(widget.icon, color: const Color(0xFF94A3B8), size: 18),
          ),
        ),
      ),
    );
  }
}