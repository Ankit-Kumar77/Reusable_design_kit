import 'package:flutter/material.dart';

import '../../features/atoms/previews/buttons_preview.dart';
import '../../features/atoms/previews/textfield_preview.dart';
import '../../features/home/home_page.dart';
import '../../features/molecules/molecules_page.dart';
import '../../features/organisms/organisms_page.dart';

// ── Nav item model ────────────────────────────────────────────────────────────
class _NavItem {
  final String id;
  final String label;
  final IconData icon;
  final Widget page;

  const _NavItem({
    required this.id,
    required this.label,
    required this.icon,
    required this.page,
  });
}

class _Section {
  final String title;
  final List<_NavItem> items;
  const _Section({required this.title, required this.items});
}

class Sidebar extends StatefulWidget {
  final Function(Widget) onItemSelected;
  final String selectedId;

  const Sidebar({
    super.key,
    required this.onItemSelected,
    required this.selectedId,
  });

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  String? _hoveredId;

  static final List<_Section> _sections = [
    _Section(
      title: '',
      items: [
        _NavItem(
          id: 'home',
          label: 'Home',
          icon: Icons.home_rounded,
          page: const HomePage(),
        ),
      ],
    ),
    _Section(
      title: 'Atoms',
      items: [
        _NavItem(
          id: 'buttons',
          label: 'Buttons',
          icon: Icons.smart_button_rounded,
          page: const ButtonsPreview(),
        ),
        _NavItem(
          id: 'textfield',
          label: 'TextField',
          icon: Icons.text_fields_rounded,
          page: const TextFieldPreview(),
        ),
      ],
    ),
    _Section(
      title: 'Molecules',
      items: [
        _NavItem(
          id: 'form_group',
          label: 'Form Group',
          icon: Icons.view_agenda_rounded,
          page: const MoleculesPage(),
        ),
      ],
    ),
    _Section(
      title: 'Organisms',
      items: [
        _NavItem(
          id: 'app_header',
          label: 'App Header',
          icon: Icons.space_bar_rounded,
          page: const OrganismsPage(),
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      decoration: const BoxDecoration(
        color: Color(0xFF0F172A),
        border: Border(right: BorderSide(color: Color(0xFF1E293B))),
      ),
      child: Column(
        children: [
          // ── Search bar hint ────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 16, 12, 8),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFF334155)),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search_rounded,
                      size: 14, color: Color(0xFF64748B)),
                  SizedBox(width: 8),
                  Text(
                    'Find component…',
                    style:
                        TextStyle(fontSize: 12.5, color: Color(0xFF64748B)),
                  ),
                ],
              ),
            ),
          ),

          // ── Navigation sections ────────────────────────────
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 16),
              children: _sections.map((section) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (section.title.isNotEmpty) ...[
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(8, 16, 8, 6),
                        child: Text(
                          section.title.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF475569),
                            letterSpacing: 1.1,
                          ),
                        ),
                      ),
                    ],
                    ...section.items.map((item) => _buildItem(item)),
                  ],
                );
              }).toList(),
            ),
          ),

          // ── Bottom branding ────────────────────────────────
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              border:
                  Border(top: BorderSide(color: Color(0xFF1E293B))),
            ),
            child: Row(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF6366F1), Color(0xFF818CF8)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(Icons.widgets_rounded,
                      color: Colors.white, size: 14),
                ),
                const SizedBox(width: 8),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'DesignKit',
                      style: TextStyle(
                        color: Color(0xFFCBD5E1),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'v1.0.0 — 5 components',
                      style: TextStyle(
                        color: Color(0xFF475569),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(_NavItem item) {
    final isActive = widget.selectedId == item.id;
    final isHovered = _hoveredId == item.id;

    return MouseRegion(
      onEnter: (_) => setState(() => _hoveredId = item.id),
      onExit: (_) => setState(() => _hoveredId = null),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => widget.onItemSelected(item.page),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          margin: const EdgeInsets.only(bottom: 2),
          padding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
          decoration: BoxDecoration(
            color: isActive
                ? const Color(0xFF6366F1).withOpacity(0.15)
                : isHovered
                    ? const Color(0xFF1E293B)
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: isActive
                ? Border.all(
                    color: const Color(0xFF6366F1).withOpacity(0.35))
                : Border.all(color: Colors.transparent),
          ),
          child: Row(
            children: [
              Icon(
                item.icon,
                size: 16,
                color: isActive
                    ? const Color(0xFF818CF8)
                    : const Color(0xFF64748B),
              ),
              const SizedBox(width: 10),
              Text(
                item.label,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight:
                      isActive ? FontWeight.w600 : FontWeight.w400,
                  color: isActive
                      ? const Color(0xFFE2E8F0)
                      : const Color(0xFF94A3B8),
                ),
              ),
              if (isActive) ...[
                const Spacer(),
                Container(
                  width: 5,
                  height: 5,
                  decoration: const BoxDecoration(
                    color: Color(0xFF6366F1),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}