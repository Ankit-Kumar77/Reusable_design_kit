import 'package:flutter/material.dart';
import '../../shared/preview_container.dart';

class OrganismsPage extends StatelessWidget {
  const OrganismsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PreviewSectionHeader(title: 'Organisms', badge: 'Complex'),

        // ── App Header Organism ────────────────────────────────────────
        PreviewCard(
          title: 'App Header',
          description:
              'The top navigation bar featuring a logo, sections, and action controls.',
          codeSnippet: '''AppHeader(
  logo: 'DesignKit',
  navItems: ['Docs', 'Components', 'Blog'],
  actions: [
    IconButton(icon: Icon(Icons.search_rounded), ...),
    IconButton(icon: Icon(Icons.dark_mode_rounded), ...),
  ],
)''',
          child: _AppHeaderPreview(),
        ),

        // ── Dashboard Card Row Organism ───────────────────────────────
        PreviewCard(
          title: 'Stats Dashboard Row',
          description:
              'A row of metric cards — a common organism in dashboards and admin panels.',
          codeSnippet: '''Row(
  children: [
    StatCard(label: 'Users', value: '12.4K', trend: '+8.2%'),
    StatCard(label: 'Revenue', value: '\$48.2K', trend: '+4.5%'),
    StatCard(label: 'Orders', value: '3,210', trend: '-1.1%'),
  ],
)''',
          child: _StatsDashboardPreview(),
        ),

        // ── Notification Card ─────────────────────────────────────────
        PreviewCard(
          title: 'Alert / Notification',
          description:
              'Status alert cards for success, warning, info, and error states.',
          codeSnippet: '''AlertCard(
  type: AlertType.success,
  title: 'Deployment successful',
  message: 'Your app was deployed to production.',
)''',
          child: _AlertsPreview(),
        ),
      ],
    );
  }
}

// ── App Header Preview ────────────────────────────────────────────────────────

class _AppHeaderPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        children: [
          // Logo
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF6366F1), Color(0xFF818CF8)],
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Icon(Icons.widgets_rounded,
                color: Colors.white, size: 14),
          ),
          const SizedBox(width: 10),
          const Text(
            'DesignKit',
            style: TextStyle(
              color: Color(0xFFF1F5F9),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 24),
          // Nav items
          ..._navLabels.map((label) => Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 13,
                    color: label == 'Components'
                        ? const Color(0xFF818CF8)
                        : const Color(0xFF94A3B8),
                    fontWeight: label == 'Components'
                        ? FontWeight.w600
                        : FontWeight.w400,
                  ),
                ),
              )),
          const Spacer(),
          // Actions
          const Icon(Icons.search_rounded,
              color: Color(0xFF64748B), size: 16),
          const SizedBox(width: 12),
          const Icon(Icons.dark_mode_rounded,
              color: Color(0xFF64748B), size: 16),
          const SizedBox(width: 12),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xFF6366F1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text(
              'Get Started',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  static const _navLabels = ['Docs', 'Components', 'Changelog', 'Blog'];
}

// ── Stats Dashboard Preview ───────────────────────────────────────────────────

class _StatsDashboardPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const stats = [
      _Stat('Total Users', '12.4K', '+8.2%', true, Color(0xFF6366F1),
          Icons.people_rounded),
      _Stat('Revenue', '\$48.2K', '+4.5%', true, Color(0xFF10B981),
          Icons.trending_up_rounded),
      _Stat('Active Orders', '3,210', '-1.1%', false, Color(0xFFEF4444),
          Icons.shopping_bag_rounded),
    ];

    return Row(
      children: stats
          .map((s) => Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      right: s == stats.last ? 0 : 12),
                  child: _StatTile(stat: s),
                ),
              ))
          .toList(),
    );
  }
}

class _Stat {
  final String label;
  final String value;
  final String trend;
  final bool positive;
  final Color color;
  final IconData icon;
  const _Stat(this.label, this.value, this.trend, this.positive, this.color,
      this.icon);
}

class _StatTile extends StatelessWidget {
  final _Stat stat;
  const _StatTile({required this.stat});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                stat.label,
                style: const TextStyle(
                    fontSize: 11, color: Color(0xFF94A3B8)),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: stat.color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(stat.icon, color: stat.color, size: 13),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            stat.value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: Color(0xFFF1F5F9),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(
                stat.positive
                    ? Icons.arrow_upward_rounded
                    : Icons.arrow_downward_rounded,
                size: 11,
                color: stat.positive
                    ? const Color(0xFF22C55E)
                    : const Color(0xFFEF4444),
              ),
              const SizedBox(width: 3),
              Text(
                stat.trend,
                style: TextStyle(
                  fontSize: 11,
                  color: stat.positive
                      ? const Color(0xFF22C55E)
                      : const Color(0xFFEF4444),
                ),
              ),
              const SizedBox(width: 4),
              const Text(
                'vs last month',
                style:
                    TextStyle(fontSize: 10, color: Color(0xFF475569)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Alerts Preview ────────────────────────────────────────────────────────────

class _AlertsPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const alerts = [
      _Alert(Icons.check_circle_rounded, Color(0xFF22C55E),
          Color(0xFF052E16), 'Deployment successful',
          'Your app v1.2.0 was deployed to production successfully.'),
      _Alert(Icons.warning_rounded, Color(0xFFF59E0B), Color(0xFF1C1400),
          'API rate limit warning',
          'You have used 85% of your monthly API quota.'),
      _Alert(Icons.error_rounded, Color(0xFFEF4444), Color(0xFF1A0000),
          'Build failed',
          'Unable to compile: missing dependency in pubspec.yaml.'),
    ];

    return Column(
      children: alerts
          .map((a) => Padding(
                padding: EdgeInsets.only(bottom: a == alerts.last ? 0 : 12),
                child: _AlertTile(alert: a),
              ))
          .toList(),
    );
  }
}

class _Alert {
  final IconData icon;
  final Color color;
  final Color bgColor;
  final String title;
  final String message;
  const _Alert(this.icon, this.color, this.bgColor, this.title, this.message);
}

class _AlertTile extends StatelessWidget {
  final _Alert alert;
  const _AlertTile({required this.alert});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: alert.bgColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: alert.color.withOpacity(0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(alert.icon, color: alert.color, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  alert.title,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: alert.color,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  alert.message,
                  style: TextStyle(
                    fontSize: 12,
                    color: alert.color.withOpacity(0.75),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}