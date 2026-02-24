import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A professional preview card used across all feature pages.
/// Shows a title, optional description, a live widget demo area, and
/// an optional Dart code snippet with copy capability.
class PreviewCard extends StatefulWidget {
  final String title;
  final String? description;
  final Widget child;
  final String? codeSnippet;

  const PreviewCard({
    super.key,
    required this.title,
    this.description,
    required this.child,
    this.codeSnippet,
  });

  @override
  State<PreviewCard> createState() => _PreviewCardState();
}

class _PreviewCardState extends State<PreviewCard> {
  bool _showCode = false;
  bool _copied = false;

  void _copyCode() {
    if (widget.codeSnippet == null) return;
    Clipboard.setData(ClipboardData(text: widget.codeSnippet!));
    setState(() => _copied = true);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => _copied = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.only(bottom: 28),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Card Header ──────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFE2E8F0),
                  ),
                ),
                if (widget.description != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    widget.description!,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF94A3B8),
                    ),
                  ),
                ],
              ],
            ),
          ),

          const SizedBox(height: 20),

          // ── Live Preview Area ─────────────────────────────
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
            decoration: BoxDecoration(
              color: const Color(0xFF0F172A),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFF334155)),
            ),
            child: widget.child,
          ),

          // ── Code Toggle Bar ───────────────────────────────
          if (widget.codeSnippet != null) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => setState(() => _showCode = !_showCode),
                    borderRadius: BorderRadius.circular(6),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: _showCode
                            ? colors.primary.withOpacity(0.15)
                            : const Color(0xFF334155),
                        borderRadius: BorderRadius.circular(6),
                        border: _showCode
                            ? Border.all(
                                color: colors.primary.withOpacity(0.4))
                            : null,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.code_rounded,
                            size: 14,
                            color: _showCode
                                ? colors.primary
                                : const Color(0xFF94A3B8),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            _showCode ? 'Hide code' : 'View code',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: _showCode
                                  ? colors.primary
                                  : const Color(0xFF94A3B8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (_showCode)
              _CodeBlock(
                  code: widget.codeSnippet!, copied: _copied, onCopy: _copyCode),
          ],

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _CodeBlock extends StatelessWidget {
  final String code;
  final bool copied;
  final VoidCallback onCopy;

  const _CodeBlock({
    required this.code,
    required this.copied,
    required this.onCopy,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 12, 24, 0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF020817),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF1E293B)),
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              code,
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 12.5,
                color: Color(0xFF7DD3FC),
                height: 1.65,
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: onCopy,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: copied
                      ? const Color(0xFF22C55E).withOpacity(0.2)
                      : const Color(0xFF1E293B),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: copied
                        ? const Color(0xFF22C55E).withOpacity(0.5)
                        : const Color(0xFF334155),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      copied ? Icons.check_rounded : Icons.copy_rounded,
                      size: 12,
                      color: copied
                          ? const Color(0xFF22C55E)
                          : const Color(0xFF94A3B8),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      copied ? 'Copied!' : 'Copy',
                      style: TextStyle(
                        fontSize: 11,
                        color: copied
                            ? const Color(0xFF22C55E)
                            : const Color(0xFF94A3B8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// A small section heading used inside preview pages.
class PreviewSectionHeader extends StatelessWidget {
  final String title;
  final String? badge;

  const PreviewSectionHeader({super.key, required this.title, this.badge});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Color(0xFFF1F5F9),
            ),
          ),
          if (badge != null) ...[
            const SizedBox(width: 10),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: BoxDecoration(
                color: const Color(0xFF6366F1).withOpacity(0.15),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: const Color(0xFF6366F1).withOpacity(0.4)),
              ),
              child: Text(
                badge!,
                style: const TextStyle(
                  fontSize: 11,
                  color: Color(0xFF818CF8),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
