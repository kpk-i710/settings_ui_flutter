import 'package:flutter/material.dart';

void main() {
  runApp(const BitLifeApp());
}

class BitLifeApp extends StatelessWidget {
  const BitLifeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BitLife - Life Simulator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFF5E6D3),
          brightness: Brightness.light,
        ),
      ),
      home: const BitLifeGameScreen(),
    );
  }
}

class BitLifeGameScreen extends StatefulWidget {
  const BitLifeGameScreen({Key? key}) : super(key: key);

  @override
  State<BitLifeGameScreen> createState() => _BitLifeGameScreenState();
}

class _BitLifeGameScreenState extends State<BitLifeGameScreen> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0EDE6),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '4:52',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1D1D1D),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: const Color(0xFF333333),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.apps,
                                color: Colors.white,
                                size: 10,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xFF333333),
                                  width: 1.5,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 24,
                        color: Color(0xFF333333),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Title
                const Text(
                  'My Family Life',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1D1D1D),
                    letterSpacing: -0.8,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Build, manage and grow your family story',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF8E8E93),
                  ),
                ),

                const SizedBox(height: 24),

                // Main Character Card
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8DCC8),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 16,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'You',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF666666),
                                ),
                              ),
                              const SizedBox(height: 6),
                              const Text(
                                'Alex Johnson',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF1D1D1D),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Text(
                                  'Age 32 • Married',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF333333),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  const Color(0xFF6B5B95),
                                  const Color(0xFF88B0D3),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF6B5B95).withOpacity(0.3),
                                  blurRadius: 12,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      _buildStatBar('Health', 85),
                      const SizedBox(height: 12),
                      _buildStatBar('Happiness', 72),
                      const SizedBox(height: 12),
                      _buildStatBar('Career', 65),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Family Members
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8DCC8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Your Family',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1D1D1D),
                        ),
                      ),
                      const SizedBox(height: 14),
                      _buildFamilyMember(
                        name: 'Sarah Johnson',
                        relation: 'Spouse',
                        age: '31 years',
                        color: const Color(0xFFE91E63),
                      ),
                      const SizedBox(height: 12),
                      _buildFamilyMember(
                        name: 'Emma Johnson',
                        relation: 'Daughter',
                        age: '8 years',
                        color: const Color(0xFF9C27B0),
                      ),
                      const SizedBox(height: 12),
                      _buildFamilyMember(
                        name: 'James Johnson',
                        relation: 'Son',
                        age: '5 years',
                        color: const Color(0xFF2196F3),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Life Events
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8DCC8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Life Choices',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1D1D1D),
                        ),
                      ),
                      const SizedBox(height: 14),
                      _buildChoiceButton(
                        icon: Icons.home,
                        title: 'Home Life',
                        description: 'Family activities and bonding',
                        color: const Color(0xFF4CAF50),
                      ),
                      const SizedBox(height: 10),
                      _buildChoiceButton(
                        icon: Icons.work,
                        title: 'Career',
                        description: 'Make career decisions',
                        color: const Color(0xFFFFC107),
                      ),
                      const SizedBox(height: 10),
                      _buildChoiceButton(
                        icon: Icons.favorite,
                        title: 'Relationships',
                        description: 'Strengthen family bonds',
                        color: const Color(0xFFE91E63),
                      ),
                      const SizedBox(height: 10),
                      _buildChoiceButton(
                        icon: Icons.school,
                        title: 'Education',
                        description: 'Kids school and learning',
                        color: const Color(0xFF673AB7),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Daily Events
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8DCC8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Today\'s Events',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1D1D1D),
                        ),
                      ),
                      const SizedBox(height: 14),
                      _buildEventItem(
                        'Emma has soccer practice',
                        '3:00 PM',
                        const Color(0xFF00BCD4),
                      ),
                      const SizedBox(height: 10),
                      _buildEventItem(
                        'Family dinner night',
                        '6:30 PM',
                        const Color(0xFFFF6F00),
                      ),
                      const SizedBox(height: 10),
                      _buildEventItem(
                        'Work deadline approaching',
                        'Tomorrow',
                        const Color(0xFFD32F2F),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Continue Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF333333),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 8,
                      shadowColor: const Color(0xFF333333).withOpacity(0.3),
                    ),
                    child: const Text(
                      'Continue Your Life',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatBar(String label, int value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333),
              ),
            ),
            Text(
              '$value%',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF666666),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: value / 100,
            minHeight: 6,
            backgroundColor: const Color(0xFFD4C9BA),
            valueColor: AlwaysStoppedAnimation<Color>(
              _getColorForStat(label),
            ),
          ),
        ),
      ],
    );
  }

  Color _getColorForStat(String stat) {
    switch (stat) {
      case 'Health':
        return const Color(0xFF4CAF50);
      case 'Happiness':
        return const Color(0xFFFFC107);
      case 'Career':
        return const Color(0xFF2196F3);
      default:
        return const Color(0xFF666666);
    }
  }

  Widget _buildFamilyMember({
    required String name,
    required String relation,
    required String age,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.person,
              color: Colors.white,
              size: 22,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1D1D1D),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '$relation • $age',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF8E8E93),
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right,
            color: Color(0xFFC7C7CC),
            size: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildChoiceButton({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withOpacity(0.2),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 22,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1D1D1D),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF8E8E93),
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFFC7C7CC),
            size: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildEventItem(String title, String time, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1D1D1D),
              ),
            ),
          ),
          Text(
            time,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF8E8E93),
            ),
          ),
        ],
      ),
    );
  }
}