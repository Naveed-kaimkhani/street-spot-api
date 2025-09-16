import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:StreetSpot/routes/route_name.dart';
import 'package:get/get.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String selectedFilter = 'Cuisine Type';

  final List<Map<String, String>> foodTrucks = [
    {
      'name': 'Burger Uncle',
      'location': 'Riverside Park',
      'distance': '1.5 miles',
      'status': 'Open Now'
    },
    {
      'name': 'Taco Express',
      'location': 'Central Market',
      'distance': '2.0 miles',
      'status': 'Open Now'
    },
    {
      'name': 'Pizza Rider',
      'location': 'West End Plaza',
      'distance': '3.0 miles',
      'status': 'Closed'
    },
    {
      'name': 'Wrap & Roll',
      'location': 'North Gate Square',
      'distance': '0.7 miles',
      'status': 'Open Now'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Map Section
          Container(
            height: 300,
            color: Colors.grey[300], // Placeholder for map
            child: Stack(
              children: [
                // Map image covering the container
                Container(
                  height: Get.height,
                  width: Get.width,
                  child: Image.asset(
                    "assets/images/mapimg.png",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 300,
                  ),
                ),
                // Search Bar
                Positioned(
                  top: 40,
                  left: 10,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                            icon: Icon(Icons.arrow_back), onPressed: () {}),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Sushi Samurai',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(icon: Icon(Icons.menu), onPressed: () {}),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Filter Buttons
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedFilter = 'Cuisine Type';
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      gradient: selectedFilter == 'Cuisine Type'
                          ? LinearGradient(
                              colors: [Colors.orange, Colors.deepOrange])
                          : null,
                      color: selectedFilter != 'Cuisine Type'
                          ? Colors.grey[200]
                          : null,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text('Cuisine Type'),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedFilter = 'Rating';
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      gradient: selectedFilter == 'Rating'
                          ? LinearGradient(
                              colors: [Colors.orange, Colors.deepOrange])
                          : null,
                      color:
                          selectedFilter != 'Rating' ? Colors.grey[200] : null,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text('Rating'),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedFilter = 'Open Now';
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      gradient: selectedFilter == 'Open Now'
                          ? LinearGradient(
                              colors: [Colors.orange, Colors.deepOrange])
                          : null,
                      color: selectedFilter != 'Open Now'
                          ? Colors.grey[200]
                          : null,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text('Open Now'),
                  ),
                ),
              ],
            ),
          ),
          // Food Truck List
          Expanded(
            child: ListView.builder(
              itemCount: foodTrucks.length,
              itemBuilder: (context, index) {
                final truck = foodTrucks[index];
                Color statusColor =
                    truck['status'] == 'Open Now' ? Colors.green : Colors.red;
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRouteName.Trackyouroder_ROUTE);
                  },
                  child: Card(
                    elevation: 4,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Image.asset('assets/images/truckimage.png',
                              width: 50,
                              height: 50), // Replace with your image asset
                          title: Text(truck['name']!),
                          subtitle: Text(truck['location']!),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(truck['status']!,
                                  style: TextStyle(color: statusColor)),
                              SizedBox(height: 18.h),
                              Text('${truck['distance']} away',
                                  style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ),
                        // Divider(color: Colors.grey[300], thickness: 1),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
