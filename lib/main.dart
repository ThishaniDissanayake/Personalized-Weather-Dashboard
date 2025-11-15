import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

// Splash Screen with Loading Animation
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
    
    // Navigate to index input page after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const IndexInputPage()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade400,
              Colors.blue.shade700,
              Colors.indigo.shade900,
            ],
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.cloud,
                  size: 120,
                  color: Colors.white,
                ),
                const SizedBox(height: 24),
                const Text(
                  'Weather Dashboard',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Your Personal Weather Companion',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 48),
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Index Input Page
class IndexInputPage extends StatefulWidget {
  const IndexInputPage({super.key});

  @override
  State<IndexInputPage> createState() => _IndexInputPageState();
}

class _IndexInputPageState extends State<IndexInputPage> {
  final TextEditingController _indexController = TextEditingController(text: '224044P');
  final _formKey = GlobalKey<FormState>();
  bool _isValidating = false;

  void _submitIndex() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isValidating = true);
      
      // Simulate validation delay
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => WeatherDashboard(studentIndex: _indexController.text.trim()),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade50,
              Colors.blue.shade100,
              Colors.blue.shade200,
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Weather Icon
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.3),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.wb_sunny,
                        size: 80,
                        color: Colors.orange.shade400,
                      ),
                    ),
                    const SizedBox(height: 48),
                    
                    // Title
                    const Text(
                      'Welcome!',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Enter your student index to continue',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 48),
                    
                    // Index Input Card
                    Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              'Student Index',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo,
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _indexController,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: 'e.g., 224044P',
                                filled: true,
                                fillColor: Colors.grey.shade100,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none,
                                ),
                                prefixIcon: const Icon(Icons.person, color: Colors.blue),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 16,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your index number';
                                }
                                if (value.length < 4) {
                                  return 'Index must be at least 4 characters';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 24),
                            
                            // Submit Button
                            ElevatedButton(
                              onPressed: _isValidating ? null : _submitIndex,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue.shade600,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                elevation: 4,
                              ),
                              child: _isValidating
                                  ? const SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                      ),
                                    )
                                  : const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Get Weather',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Icon(Icons.arrow_forward),
                                      ],
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    
                    // Info Text
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.info_outline, color: Colors.blue.shade700),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Your index will be used to calculate coordinates for weather data',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _indexController.dispose();
    super.dispose();
  }
}

// Weather Dashboard - Main Page
class WeatherDashboard extends StatefulWidget {
  final String studentIndex;
  
  const WeatherDashboard({super.key, required this.studentIndex});

  @override
  State<WeatherDashboard> createState() => _WeatherDashboardState();
}

class _WeatherDashboardState extends State<WeatherDashboard> {
  late String studentIndex;
  
  double? latitude;
  double? longitude;
  String? temperature;
  String? windSpeed;
  String? weatherCode;
  String? lastUpdated;
  String? requestUrl;
  bool isLoading = false;
  String? errorMessage;
  bool isCached = false;

  @override
  void initState() {
    super.initState();
    studentIndex = widget.studentIndex;
    _calculateCoordinates(studentIndex);
    _loadCachedData();
    // Automatically fetch weather on page load
    Future.delayed(const Duration(milliseconds: 500), () {
      _fetchWeather();
    });
  }

  // Calculate coordinates from student index
  void _calculateCoordinates(String index) {
    // Remove any non-digit characters except the first 4 digits
    String digits = index.replaceAll(RegExp(r'[^0-9]'), '');
    
    if (digits.length >= 4) {
      int firstTwo = int.parse(digits.substring(0, 2)); // 22
      int nextTwo = int.parse(digits.substring(2, 4));  // 40
      
      latitude = 5 + (firstTwo / 10.0);  // 5 + 2.2 = 7.2
      longitude = 79 + (nextTwo / 10.0); // 79 + 4.0 = 83.0
    }
  }

  // Fetch weather from Open-Meteo API
  Future<void> _fetchWeather() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
      isCached = false;
    });

    try {
      if (studentIndex.isEmpty) {
        throw Exception('Invalid student index');
      }

      if (latitude == null || longitude == null) {
        throw Exception('Invalid index format');
      }

      // Build request URL
      requestUrl = 'https://api.open-meteo.com/v1/forecast?'
          'latitude=${latitude!.toStringAsFixed(2)}&'
          'longitude=${longitude!.toStringAsFixed(2)}&'
          'current_weather=true';

      // Make API call
      final response = await http.get(Uri.parse(requestUrl!)).timeout(
        const Duration(seconds: 10),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final currentWeather = data['current_weather'];

        setState(() {
          temperature = currentWeather['temperature'].toString();
          windSpeed = currentWeather['windspeed'].toString();
          weatherCode = currentWeather['weathercode'].toString();
          lastUpdated = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
          isLoading = false;
        });

        // Cache the successful result
        await _cacheWeatherData();
      } else {
        throw Exception('Failed to fetch weather data (Status: ${response.statusCode})');
      }
    } catch (e) {
      // Try to load cached data on error first
      await _loadCachedData();
      
      setState(() {
        errorMessage = 'Error: ${e.toString()}';
        isLoading = false;
        // If we loaded cached data, mark it as cached
        if (temperature != null) {
          isCached = true;
        }
      });
    }
  }

  // Cache weather data locally
  Future<void> _cacheWeatherData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('temperature', temperature ?? '');
    await prefs.setString('windSpeed', windSpeed ?? '');
    await prefs.setString('weatherCode', weatherCode ?? '');
    await prefs.setString('lastUpdated', lastUpdated ?? '');
    await prefs.setString('requestUrl', requestUrl ?? '');
    await prefs.setDouble('latitude', latitude ?? 0.0);
    await prefs.setDouble('longitude', longitude ?? 0.0);
  }

  // Load cached weather data
  Future<void> _loadCachedData() async {
    final prefs = await SharedPreferences.getInstance();
    final cachedTemp = prefs.getString('temperature');
    
    if (cachedTemp != null && cachedTemp.isNotEmpty) {
      if (mounted) {
        setState(() {
          temperature = cachedTemp;
          windSpeed = prefs.getString('windSpeed');
          weatherCode = prefs.getString('weatherCode');
          lastUpdated = prefs.getString('lastUpdated');
          requestUrl = prefs.getString('requestUrl');
          final cachedLat = prefs.getDouble('latitude');
          final cachedLon = prefs.getDouble('longitude');
          if (cachedLat != null && cachedLon != null) {
            latitude = cachedLat;
            longitude = cachedLon;
          }
          isCached = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade300,
              Colors.blue.shade600,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header with Student Index
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.person, color: Colors.white, size: 28),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Student Index',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            studentIndex,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Main Content
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Coordinates Display
                        if (latitude != null && longitude != null)
                          Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blue.shade50,
                                  Colors.blue.shade100,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.2),
                                  blurRadius: 15,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.my_location, color: Colors.blue.shade700, size: 24),
                                    const SizedBox(width: 12),
                                    const Text(
                                      'Location Coordinates',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.indigo,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: Column(
                                          children: [
                                            Icon(Icons.north, color: Colors.red.shade400, size: 32),
                                            const SizedBox(height: 8),
                                            const Text(
                                              'Latitude',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              '${latitude!.toStringAsFixed(2)}°',
                                              style: const TextStyle(
                                                fontSize: 28,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.indigo,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: Column(
                                          children: [
                                            Icon(Icons.east, color: Colors.blue.shade400, size: 32),
                                            const SizedBox(height: 8),
                                            const Text(
                                              'Longitude',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              '${longitude!.toStringAsFixed(2)}°',
                                              style: const TextStyle(
                                                fontSize: 28,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.indigo,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        const SizedBox(height: 24),

                        // Fetch Weather Button
                        ElevatedButton(
                          onPressed: isLoading ? null : _fetchWeather,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            backgroundColor: Colors.blue.shade600,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 5,
                          ),
                          child: isLoading
                              ? const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    Text(
                                      'Fetching Weather...',
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              : const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.cloud_download, size: 28),
                                    SizedBox(width: 12),
                                    Text(
                                      'Get Current Weather',
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                        ),
                        const SizedBox(height: 24),

                        // Error Message
                        if (errorMessage != null)
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.red.shade50,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.red.shade200),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.error_outline, color: Colors.red.shade700, size: 28),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Connection Error',
                                        style: TextStyle(
                                          color: Colors.red.shade900,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        errorMessage!,
                                        style: TextStyle(
                                          color: Colors.red.shade700,
                                          fontSize: 12,
                                        ),
                                      ),
                                      if (isCached)
                                        const Padding(
                                          padding: EdgeInsets.only(top: 8),
                                          child: Text(
                                            '✓ Showing cached data below',
                                            style: TextStyle(
                                              color: Colors.orange,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                        // Weather Data Display
                        if (temperature != null)
                          Container(
                            margin: const EdgeInsets.only(top: 16),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.green.shade50,
                                  Colors.green.shade100,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.green.withOpacity(0.2),
                                  blurRadius: 15,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.wb_sunny, color: Colors.orange.shade600, size: 28),
                                        const SizedBox(width: 12),
                                        const Text(
                                          'Current Weather',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.indigo,
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (isCached)
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: const Row(
                                          children: [
                                            Icon(Icons.offline_pin, color: Colors.white, size: 16),
                                            SizedBox(width: 4),
                                            Text(
                                              'CACHED',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                
                                // Weather Info Cards
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    children: [
                                      _buildWeatherRow(
                                        Icons.thermostat,
                                        'Temperature',
                                        '$temperature °C',
                                        Colors.red.shade400,
                                      ),
                                      const Divider(height: 24),
                                      _buildWeatherRow(
                                        Icons.air,
                                        'Wind Speed',
                                        '$windSpeed km/h',
                                        Colors.blue.shade400,
                                      ),
                                      const Divider(height: 24),
                                      _buildWeatherRow(
                                        Icons.wb_cloudy,
                                        'Weather Code',
                                        weatherCode ?? 'N/A',
                                        Colors.grey.shade600,
                                      ),
                                      const Divider(height: 24),
                                      _buildWeatherRow(
                                        Icons.access_time,
                                        'Last Updated',
                                        lastUpdated ?? 'N/A',
                                        Colors.green.shade600,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                        // Request URL Display
                        if (requestUrl != null)
                          Container(
                            margin: const EdgeInsets.only(top: 16),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.link, color: Colors.grey.shade700, size: 20),
                                    const SizedBox(width: 8),
                                    Text(
                                      'API Request URL',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade800,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                SelectableText(
                                  requestUrl!,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontFamily: 'monospace',
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherRow(IconData icon, String label, String value, Color iconColor) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 24, color: iconColor),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
