import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const FamilyLifeApp());
}

class FamilyLifeApp extends StatelessWidget {
  const FamilyLifeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Family Life',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        scaffoldBackgroundColor: Colors.grey[50],
      ),
      home: const FamilyLifeScreen(),
    );
  }
}

class FamilyLifeScreen extends StatefulWidget {
  const FamilyLifeScreen({Key? key}) : super(key: key);

  @override
  State<FamilyLifeScreen> createState() => _FamilyLifeScreenState();
}

class _FamilyLifeScreenState extends State<FamilyLifeScreen> {
  int _selectedTab = 0;

  final character = {
    'name': 'Jennifer Foreman',
    'age': 17,
    'status': 'Student',
    'balance': 420,
    'happiness': 90,
    'health': 76,
  };

  final events = [
    {
      'age': '15 years',
      'title': 'My big brother, Stanley, started high school.',
      'detail': 'My Shiba Inu, Champ, growled at my friends. I praised him.'
    },
    {
      'age': '16 years',
      'title': 'I tongue-kissed Travis Reynolds. It was my first kiss.',
      'detail': 'He tasted like moldy yogurt.'
    },
    {
      'age': '17 years',
      'title': 'I graduated from high school.',
      'detail': 'I decided to take some time off to focus on practicing magic.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Family Life'),
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Card
            Card(
              margin: const EdgeInsets.all(12),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Character Info
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  character['name'] as String,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(
                                  CupertinoIcons.info_circle,
                                  size: 18,
                                  color: Colors.blue,
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Icon(
                                  CupertinoIcons.heart_fill,
                                  size: 14,
                                  color: Colors.red,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  character['status'] as String,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '\$${character['balance']}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            Text(
                              'Bank Balance',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Happiness stat
                    _buildStatBar(
                      'Happiness',
                      character['happiness'] as int,
                      Colors.green,
                    ),
                    const SizedBox(height: 16),
                    // Health stat
                    _buildStatBar(
                      'Health',
                      character['health'] as int,
                      Colors.orange,
                    ),
                  ],
                ),
              ),
            ),
            // Life Events
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Life Events',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 16),
                    ...List.generate(
                      events.length,
                      (index) => _buildEventCard(
                        events[index],
                        index < events.length - 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Bottom tagline
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              padding: const EdgeInsets.symmetric(vertical: 24),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  'Live your Best Life...',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedTab,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedTab = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(CupertinoIcons.book),
            selectedIcon: Icon(CupertinoIcons.book_fill),
            label: 'School',
          ),
          NavigationDestination(
            icon: Icon(CupertinoIcons.money_dollar),
            selectedIcon: Icon(CupertinoIcons.money_dollar),
            label: 'Assets',
          ),
          NavigationDestination(
            icon: Icon(CupertinoIcons.plus_circle, size: 28),
            selectedIcon: Icon(CupertinoIcons.plus_circle_fill, size: 28),
            label: 'Age',
          ),
          NavigationDestination(
            icon: Icon(CupertinoIcons.heart),
            selectedIcon: Icon(CupertinoIcons.heart_fill),
            label: 'Relations',
          ),
          NavigationDestination(
            icon: Icon(CupertinoIcons.ellipsis),
            label: 'More',
          ),
        ],
      ),
    );
  }

  Widget _buildStatBar(String label, int value, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
            Text(
              '$value%',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(
            value: value / 100,
            minHeight: 8,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ],
    );
  }

  Widget _buildEventCard(Map<String, String> event, bool showDivider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          event['age'] ?? '',
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          event['title'] ?? '',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
            height: 1.4,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          event['detail'] ?? '',
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[700],
            height: 1.4,
          ),
        ),
        if (showDivider) ...[
          const SizedBox(height: 12),
          Divider(
            color: Colors.grey[300],
            height: 1,
          ),
          const SizedBox(height: 12),
        ],
      ],
    );
  }
}