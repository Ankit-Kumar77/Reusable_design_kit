import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import '../widgets/sidebar.dart';
import '../../features/home/home_page.dart';

class PlaygroundShell extends StatefulWidget {
  const PlaygroundShell({super.key});

  @override
  State<PlaygroundShell> createState() => _PlaygroundShellState();
}

class _PlaygroundShellState extends State<PlaygroundShell> {
  Widget _currentPage = const HomePage();
  String _selectedId = 'home';

  void _changePage(Widget page, String id) {
    setState(() {
      _currentPage = page;
      _selectedId = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: Column(
        children: [
          const AppHeader(),
          Expanded(
            child: Row(
              children: [
                Sidebar(
                  selectedId: _selectedId,
                  onItemSelected: (page) {
                    // Derive the id from the widget type
                    final id = _resolveId(page);
                    _changePage(page, id);
                  },
                ),
                Expanded(
                  child: Container(
                    color: const Color(0xFF0F172A),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(32),
                      child: _currentPage,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _resolveId(Widget page) {
    final type = page.runtimeType.toString();
    final map = {
      'HomePage': 'home',
      'ButtonsPreview': 'buttons',
      'TextFieldPreview': 'textfield',
      'MoleculesPage': 'form_group',
      'OrganismsPage': 'app_header',
    };
    return map[type] ?? 'home';
  }
}