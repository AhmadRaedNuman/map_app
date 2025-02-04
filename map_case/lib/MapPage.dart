import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Map World'),
          backgroundColor: Colors.blueAccent,
          titleTextStyle: const TextStyle(color: Colors.white),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final screenHeight = constraints.maxHeight;
            final screenWidth = constraints.maxWidth;

            return Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/map.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
                // Asia
                Positioned(
                  height: screenHeight * 0.45,
                  width: screenWidth * 0.35,
                  top: screenHeight * 0.15,
                  left: screenWidth * 0.62,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegoinScreen(
                            regionName: "Asia",
                            imagePath: 'assets/Asian.webp',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      color: Colors.transparent, // Transparent clickable area
                    ),
                  ),
                ),
                // Europe
                Positioned(
                  height: screenHeight * 0.14,
                  width: screenWidth * 0.135,
                  top: screenHeight * 0.20,
                  left: screenWidth * 0.50,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegoinScreen(
                            regionName: "Europe",
                            imagePath: 'Assets/europe-map.png',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      color: Colors.transparent, // Transparent clickable area
                    ),
                  ),
                ),
                // Africa
                Positioned(
                  height: screenHeight * 0.35,
                  width: screenWidth * 0.20,
                  left: screenWidth * 0.44,
                  top: screenHeight * 0.35,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegoinScreen(
                            regionName: "Africa",
                            imagePath: 'assets/africa.webp',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      color: Colors.transparent, // Transparent clickable area
                    ),
                  ),
                ),
                // Australia
                Positioned(
                  height: screenHeight * 0.15,
                  width: screenWidth * 0.20,
                  left: screenWidth * 0.80,
                  top: screenHeight * 0.60,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegoinScreen(
                            regionName: "Australia",
                            imagePath: 'assets/australia.png',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      color: Colors.transparent, // Transparent clickable area
                    ),
                  ),
                ),
                // N-America
                Positioned(
                  height: screenHeight * 0.45,
                  width: screenWidth * 0.40,
                  left: screenWidth * 0.05,
                  top: screenHeight * 0.05,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegoinScreen(
                            regionName: "North America",
                            imagePath: 'assets/n-america.png',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      color: Colors.transparent, // Transparent clickable area
                    ),
                  ),
                ),
                Positioned(
                  height: screenHeight * 0.33,
                  width: screenWidth * 0.20,
                  left: screenWidth * 0.25,
                  top: screenHeight * 0.50,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegoinScreen(
                            regionName: "South America",
                            imagePath: 'assets/south-america.webp',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      color: Colors.transparent, // Transparent clickable area
                    ),
                  ),
                ),
                // Arctic
                Positioned(
                  height: screenHeight * 0.15,
                  width: screenWidth * 1,
                  left: screenWidth * 0.0,
                  bottom: screenHeight * 0.0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegoinScreen(
                            regionName: "Arctic",
                            imagePath: 'assets/Arctic.jpg',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      color: Colors.transparent, // Transparent clickable area
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class RegoinScreen extends StatelessWidget {
  const RegoinScreen({
    super.key,
    required this.regionName,
    required this.imagePath,
  });
  final String regionName;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(regionName),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Image.asset(imagePath),
      ),
    );
  }
}
