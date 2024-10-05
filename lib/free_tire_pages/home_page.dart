import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:microbiocol/api_services/apiservice.dart';
import 'package:microbiocol/free_tire_pages/camerascreen.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_box.dart';
import 'package:microbiocol/widgets/custom_button.dart';
import 'package:microbiocol/widgets/lock_box.dart';
import 'package:microbiocol/global.dart' as globals; // Import globals


class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _recentPredictions = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchRecentPredictions(); // Fetch recent predictions when the page loads
  }

  // Fetch recent predictions from the API
  Future<void> _fetchRecentPredictions() async {
    int userId = globals.userId ?? 1; // Get the userId from globals (or use a default one)
    final recentPredictions = await ApiService.fetchRecentPredictions(userId);

    if (recentPredictions != null) {
      setState(() {
        _recentPredictions = recentPredictions;
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mwhiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Displaying the first name from globals
                Text(
                  "Hi, ${globals.firstName ?? 'User'}", // Use globals.firstName
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: mprimaryColor),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Welcome back",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: mprimaryColor),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Recent",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: mprimaryColor),
                ),
                const SizedBox(
                  height: 10,
                ),

                // Display the recent predictions fetched from API
                SizedBox(
                  height: 150,
                  child: _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : _recentPredictions.isEmpty
                          ? const Text("No recent predictions found.")
                          : ListView.builder(
                              itemCount: _recentPredictions.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                var prediction = _recentPredictions[index];
                                return _recentCard(prediction);
                              },
                            ),
                ),
                const SizedBox(
                  height: 20,
                ),

                const Text(
                  "Quick Actions",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: mprimaryColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int i = 0; i < 2; i++)
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: i == 0
                              ? const EdgeInsets.only(right: 8)
                              : const EdgeInsets.only(left: 8),
                          child: GestureDetector(
                            onTap: () {
                              // Navigate to CameraUI page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CameraUI(),
                                ),
                              );
                            },
                            child: CustomButton(
                              isHasWidget: true,
                              isHasBorder: false,
                              widget: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  i == 0
                                      ? SvgPicture.asset(
                                          "assets/images/abacus.svg",
                                          fit: BoxFit.cover,
                                          width: 16,
                                          height: 16,
                                          color: mwhiteColor,
                                        )
                                      : const Padding(
                                          padding: EdgeInsets.only(top: 2),
                                          child: Icon(
                                            Icons.camera_alt_outlined,
                                            color: Color(0xffFDFFFC),
                                            size: 15,
                                          ),
                                        ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    i == 0 ? "Count" : "Identify",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(
                                        0xffFDFFFC,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Saved",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: mprimaryColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 160,
                  child: Stack(
                    children: [
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 3, // Static or dynamic number of saved items
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return _savedItemList(index, context); // Example saved items
                        },
                      ),
                      if (true) // Change 'true' with actual condition to lock
                        lockBox(context, true, MediaQuery.of(context).size.height)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Create single recent card with actual data from API
  Widget _recentCard(Map<String, dynamic> data) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: CustommBox(
        isHasBoxShadow: false,
        isHasBorder: false,
        width: 115,
        height: 150,
        borderRadius: 16,
        color: mwhiteColor,
        widget: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        data['image_url'] ?? '',  // Display image from URL
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.error); // Show error icon if image fails to load
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: 115,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                          colors: [mprimaryColor.withOpacity(0), mprimaryColor],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [0.7, 1]),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            data['predicted_class'] ?? 'Unknown',  // Display predicted class
                            style: const TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w400,
                              color: mwhiteColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // Create a saved item list (replace with actual saved items logic)
  Widget _savedItemList(int index, BuildContext context) {
    // Replace this widget with actual saved items logic
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustommBox(
            isHasBoxShadow: false,
            isHasBorder: false,
            width: 64,
            height: 64,
            borderRadius: 42,
            color: mprimaryColor.withOpacity(0.1),
            widget: const Center(
              child: Icon(
                FontAwesomeIcons.folder,
                color: mprimaryColor,
                size: 40,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Saved Item",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: mprimaryColor,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "Date",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: mprimaryColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}