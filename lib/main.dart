import 'package:flutter/material.dart';

void main() {
  runApp(const ApocalypseApp());
}

class ApocalypseApp extends StatelessWidget {
  const ApocalypseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: const ApocalypseScreen(),
    );
  }
}

class ApocalypseScreen extends StatefulWidget {
  const ApocalypseScreen({Key? key}) : super(key: key);

  @override
  State<ApocalypseScreen> createState() => _ApocalypseScreenState();
}

class _ApocalypseScreenState extends State<ApocalypseScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFF2A2420),
              const Color(0xFF3D3830),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Заголовок
                  Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    child: Column(
                      children: [
                        Text(
                          'ВЫЖИВ И РАЗВИВАЙСЯ',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[400],
                            letterSpacing: 2,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'АПОКАЛИПСИС',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[100],
                            letterSpacing: 3,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.8),
                                blurRadius: 8,
                                offset: const Offset(2, 2),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Основная карточка - дневник
                  _buildDiaryCard(),
                  const SizedBox(height: 24),
                  // Задачи
                  _buildTasksList(),
                  const SizedBox(height: 24),
                  // Часы и дополнительная информация
                  _buildClockSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDiaryCard() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFD4C5B0),
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            blurRadius: 12,
            offset: const Offset(4, 6),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Текстура бумаги
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                  image: NetworkImage(
                    'data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100"><filter id="noise"><feTurbulence type="fractalNoise" baseFrequency="0.9" numOctaves="4" result="noise"/><feColorMatrix in="noise" type="saturate" values="0.3"/></filter><rect width="100" height="100" fill="%23D4C5B0" filter="url(%23noise)"/></svg>',
                  ),
                  repeat: ImageRepeat.repeat,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Контент
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Мастерская представляла из себя подвальное помещение в многоэтажном доме. Попасть туда можно было только через въезд на подземную парковку.',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.brown[900],
                    fontFamily: 'Courier',
                    fontStyle: FontStyle.italic,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Вам нужно найти инструменты по списку, чем больше - тем лучше. Но время не на Вашей стороне, с каждой потраченной минутой монстры всё больше.',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.brown[800],
                    fontFamily: 'Courier',
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTasksList() {
    final tasks = [
      'Искать инструменты',
      'Искать план здания',
      'Запереть все двери и окна',
    ];

    return Column(
      children: List.generate(
        tasks.length,
        (index) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _buildTaskButton(tasks[index], index),
        ),
      ),
    );
  }

  Widget _buildTaskButton(String text, int index) {
    bool isSelected = selectedIndex == index;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          setState(() => selectedIndex = index);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? Colors.amber[200]! : Colors.grey[600]!,
              width: isSelected ? 2.5 : 2,
            ),
            color: isSelected
                ? Colors.amber[200]!.withOpacity(0.15)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(2),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.amber[200]!.withOpacity(0.3),
                      blurRadius: 8,
                      spreadRadius: 1,
                    ),
                  ]
                : [],
          ),
          child: Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected ? Colors.amber[200]! : Colors.grey[500]!,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: isSelected
                    ? Center(
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.amber[200],
                            borderRadius: BorderRadius.circular(1),
                          ),
                        ),
                      )
                    : null,
              ),
              const SizedBox(width: 12),
              Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[200],
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClockSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[600]!,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Text(
            'ОСТАВШЕЕСЯ ВРЕМЯ',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[400],
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '23:47',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.grey[100],
              fontFamily: 'Courier',
              shadows: [
                Shadow(
                  color: Colors.red.withOpacity(0.4),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatBox('ЗДОРОВЬЕ', '85%', Colors.green[700]!),
              _buildStatBox('УГРОЗА', '62%', Colors.red[700]!),
              _buildStatBox('РЕСУРСЫ', '41%', Colors.orange[700]!),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatBox(String label, String value, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: color, width: 1.5),
          borderRadius: BorderRadius.circular(2),
        ),
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey[400],
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}