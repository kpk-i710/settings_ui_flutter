import 'package:flutter/material.dart';

void main() {
  runApp(const BitLifeApp());
}

class BitLifeApp extends StatelessWidget {
  const BitLifeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BitLife Settings',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFF5E6D3),
          brightness: Brightness.light,
        ),
      ),
      home: const BitLifeSettingsScreen(),
    );
  }
}

class BitLifeSettingsScreen extends StatefulWidget {
  const BitLifeSettingsScreen({Key? key}) : super(key: key);

  @override
  State<BitLifeSettingsScreen> createState() => _BitLifeSettingsScreenState();
}

class _BitLifeSettingsScreenState extends State<BitLifeSettingsScreen> {
  double brightnessValue = 60;
  double timerValue = 6;
  bool onceToggle = false;
  bool everydayToggle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0EDE6),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with logo and Go back
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: const Color(0xFF333333),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.apps,
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xFF333333),
                                  width: 2,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Go back',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF666666),
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      '4:52',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1D1D1D),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Title
                const Text(
                  'Active Settings',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1D1D1D),
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Double tap on a widget\nto edit settings',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF8E8E93),
                    letterSpacing: -0.2,
                    height: 1.4,
                  ),
                ),

                const SizedBox(height: 24),

                // Main Settings Card
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8DCC8),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'After Work Chill',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF1D1D1D),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Hex number',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF666666),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    '#FEE951',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF333333),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Brightness',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF666666),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    '60%',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF333333),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFEE951),
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFFFEE951)
                                          .withOpacity(0.4),
                                      blurRadius: 16,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                '60',
                                style: TextStyle(
                                  fontSize: 56,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF1D1D1D),
                                  letterSpacing: -1,
                                ),
                              ),
                              const Text(
                                '%',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF1D1D1D),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Brightness Slider
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8DCC8),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  child: Row(
                    children: [
                      const Text(
                        'Brightness',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF333333),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: SliderTheme(
                          data: SliderThemeData(
                            trackHeight: 3,
                            thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 5,
                            ),
                            activeTrackColor: const Color(0xFF333333),
                            inactiveTrackColor: const Color(0xFFD4C9BA),
                            thumbColor: const Color(0xFF333333),
                          ),
                          child: Slider(
                            value: brightnessValue,
                            min: 0,
                            max: 100,
                            onChanged: (value) {
                              setState(() {
                                brightnessValue = value;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        '${brightnessValue.toInt()}%',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF333333),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Timer Slider
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8DCC8),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  child: Row(
                    children: [
                      const Text(
                        'Timer',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF333333),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: SliderTheme(
                          data: SliderThemeData(
                            trackHeight: 3,
                            thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 5,
                            ),
                            activeTrackColor: const Color(0xFF333333),
                            inactiveTrackColor: const Color(0xFFD4C9BA),
                            thumbColor: const Color(0xFF333333),
                          ),
                          child: Slider(
                            value: timerValue,
                            min: 0,
                            max: 24,
                            onChanged: (value) {
                              setState(() {
                                timerValue = value;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        '${timerValue.toInt()}h',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF333333),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Toggle Settings
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8DCC8),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Only once',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF333333),
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                '5:30 pm',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF1D1D1D),
                                ),
                              ),
                            ],
                          ),
                          Switch(
                            value: onceToggle,
                            onChanged: (value) {
                              setState(() {
                                onceToggle = value;
                              });
                            },
                            activeColor: const Color(0xFF333333),
                            inactiveThumbColor: const Color(0xFF666666),
                            inactiveTrackColor: const Color(0xFFD4C9BA),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Divider(
                        color: const Color(0xFFD4C9BA),
                        height: 1,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Everyday',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF333333),
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                '6:45 pm',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF1D1D1D),
                                ),
                              ),
                            ],
                          ),
                          Switch(
                            value: everydayToggle,
                            onChanged: (value) {
                              setState(() {
                                everydayToggle = value;
                              });
                            },
                            activeColor: const Color(0xFF333333),
                            inactiveThumbColor: const Color(0xFF666666),
                            inactiveTrackColor: const Color(0xFFD4C9BA),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}