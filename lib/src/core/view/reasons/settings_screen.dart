import 'package:flutter/material.dart';
import 'package:reference_app/src/core/view/reasons/mami_screen.dart';
import 'package:reference_app/src/core/view/reasons/reason_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  String _selectedLanguage = 'Español';

  final List<String> _languages = ['Español', 'Ponchopes'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: Icon(Icons.arrow_back)
        ),
      ),
      body: ListView(
        children: [
          _buildSectionHeader('General'),
          _buildToggleTile(
            icon: Icons.notifications,
            title: 'Ponchificaciones',
            value: _notificationsEnabled,
            onChanged: (val) => setState(() => _notificationsEnabled = val),
          ),
          _buildDropdownTile(
            icon: Icons.language,
            title: 'Idioma',
            value: _selectedLanguage,
            items: _languages,
            onChanged: (val) => setState(() => _selectedLanguage = val!),
          ),
          SizedBox(height: 24),
          _buildSectionHeader('Cuenta'),
          _buildNavigationTile(
            icon: Icons.person,
            title: 'Perfil',
            onTap: () => _navigateTo(context,BeautifulScreen()),
          ),
          _buildNavigationTile(
            icon: Icons.lock,
            title: 'Secreto',
            onTap: () => _navigateTo(context,ReasonScreenExtra()),
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        text.toUpperCase(),
        style: Theme.of(context).textTheme.bodyMedium
      ),
    );
  }

  Widget _buildToggleTile({
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      secondary: Icon(icon),
      title: Text(title,style: Theme.of(context).textTheme.bodyMedium,),
      value: value,
      onChanged: onChanged,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }

  Widget _buildDropdownTile({
    required IconData icon,
    required String title,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title,style: Theme.of(context).textTheme.bodyMedium,),
      trailing: DropdownButton<String>(
        value: value,
        underline: SizedBox(),
        items: items.map((lang) => DropdownMenuItem(
          value: lang,
          child: Text(lang),
        )).toList(),
        onChanged: onChanged,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }

  Widget _buildNavigationTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title,style: Theme.of(context).textTheme.bodyMedium,),
      trailing: Icon(Icons.chevron_right),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }

  void _navigateTo(BuildContext context, Widget screen) { ///[Funcion basica de navigate sin Widget Function solo Widget]
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
  }
}
