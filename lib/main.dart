import 'package:flutter/material.dart';

void main() {
  runApp(const DungeonGame());
}

class DungeonGame extends StatelessWidget {
  const DungeonGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const GameScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String currentScene = 'chamber';
  List<String> history = [];

  void _handleAction(String action) {
    setState(() {
      if (action == 'attack') {
        history.add('You attempt to attack the masked woman...');
        history.add(
            'She moves with supernatural speed. Your final thought is of regret.');
        history.add('GAME OVER');
      } else if (action == 'retreat') {
        history.add('You slowly back away from the hallway...');
        history.add('The woman watches silently as you retreat into darkness.');
        history.add('You have survived another day in the dungeon...');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black87,
                  Colors.brown[900]!,
                  Colors.brown[800]!,
                ],
              ),
            ),
            child: Opacity(
              opacity: 0.3,
              child: Image.network(
                'https://images.unsplash.com/photo-1578926314433-b5eef1b8b735?w=600',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Column(
              children: [
                // Decorative top border
                Container(
                  height: 20,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.brown[600]!,
                        width: 2,
                      ),
                    ),
                  ),
                ),

                // Main content area
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 40,
                      ),
                      child: Column(
                        children: [
                          // Story text box
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.7),
                              border: Border.all(
                                color: Colors.grey[800]!,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            padding: const EdgeInsets.all(28),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Hidden text hint
                                Text(
                                  'There is nothing here but piles upon piles of\nskeletal remains, reduced to spinal fragments\nand cranial shards, broken like the residue\nof countless failures.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 12,
                                    height: 1.6,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                const SizedBox(height: 24),

                                // Main narrative
                                const Text(
                                  'You emerge from the dark chamber. A cloaked woman stands in the hallway, armed with two daggers. Her face is concealed behind a circular white mask. "You might be able to fool the others, but not me. Any last words, thief?"',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    height: 1.8,
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: 0.5,
                                  ),
                                ),

                                // History
                                if (history.isNotEmpty) ...[
                                  const SizedBox(height: 20),
                                  Container(
                                    height: 1,
                                    color: Colors.grey[700],
                                  ),
                                  const SizedBox(height: 16),
                                  ...history.map((text) => Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 6),
                                    child: Text(
                                      text,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: text.contains('GAME OVER')
                                            ? Colors.red[400]
                                            : Colors.amber[300],
                                        fontSize: 14,
                                        height: 1.6,
                                      ),
                                    ),
                                  )),
                                ],
                              ],
                            ),
                          ),

                          const SizedBox(height: 32),

                          // Action buttons
                          if (!history.any((text) => text.contains('GAME OVER')))
                            Column(
                              children: [
                                // Attack button
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () => _handleAction('attack'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black87,
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 18,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        side: BorderSide(
                                          color: Colors.grey[700]!,
                                          width: 1.5,
                                        ),
                                      ),
                                      elevation: 4,
                                    ),
                                    child: const Text(
                                      'Attack',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 14),

                                // Retreat button
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () => _handleAction('retreat'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black87,
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 18,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        side: BorderSide(
                                          color: Colors.grey[700]!,
                                          width: 1.5,
                                        ),
                                      ),
                                      elevation: 4,
                                    ),
                                    child: const Text(
                                      'Retreat',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          // Reset button if game over
                          if (history.any((text) => text.contains('GAME OVER')))
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    history.clear();
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.brown[900],
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 18,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: const Text(
                                  'Start Again',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Bottom border
                Container(
                  height: 20,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.brown[600]!,
                        width: 2,
                      ),
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
}
// sfd