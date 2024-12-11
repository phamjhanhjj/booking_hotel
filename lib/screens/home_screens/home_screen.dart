// import 'package:flutter/material.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   int _currentIndex = 0; 
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           color: Colors.blue,
//           child: Padding(
//             padding: const EdgeInsets.only(left: 20.0, right: 20.0),
//             child: Column(
//               children: [
//                 _buildAppHeader(),
//                 _buildWelcomeText(),  
//                 _buildTravelInfoCard(),            
//               ],
//             ),
//           ),
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           currentIndex: _currentIndex, 
//           selectedItemColor: Colors.blue, 
//           unselectedItemColor: Colors.grey,
//           items: [
//             _buildBottomNavItem(Icons.home, "Home"),
//             _buildBottomNavItem(Icons.map, "Map"),
//             _buildBottomNavItem(Icons.book, "Booking"),
//             _buildBottomNavItem(Icons.person, "Profile"),
//           ],
//           onTap: (int itemIndex) {
//             setState(() {
//               _currentIndex = itemIndex;
//             });
//             List<String> itemLabels = ["Home", "Map", "Booking", "Profile"];
//             print(itemLabels[itemIndex]);
//           },
//         ),
//       ),
//     );
//   }
// }
//
// BottomNavigationBarItem _buildBottomNavItem(IconData icon, String label) {
//   return BottomNavigationBarItem(
//     icon: Icon(icon),
//     label: label,
//   );
// }
//
// Widget _buildAppHeader() {
//   return Padding(
//     padding: const EdgeInsets.only(bottom: 8.0),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween, 
//       children: [
//         Container(
//           padding: EdgeInsets.all(5.0),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(90.0),
//           ),
//           child: IconButton(
//             icon: Icon(Icons.person, size: 30.0),
//             onPressed: () {
//               print('Person icon pressed');
//             },
//           ),
//         ),
//         Container(
//           padding: EdgeInsets.all(5.0),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(90.0),
//           ),
//           child: IconButton(
//             icon: Icon(Icons.notifications, size: 30.0),
//             onPressed: () {
//               print('Notifications icon pressed');
//             },
//           ),
//         ),
//       ],
//     ),
//   );
// }
//
// Widget _buildWelcomeText() {
//   return const Padding(
//     padding: EdgeInsets.only(bottom: 8.0),
//     child: Align(
//       alignment: Alignment.centerLeft,
//       child: Text(
//         "Welcome!",
//         style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
//       ),
//     ),
//   );
// }
//
// Widget _buildTravelInfoCard() {
//   return Container(
//     color: Colors.white,
//     padding: EdgeInsets.all(16.0),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               "Row 1 - Left",
//               style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               "Row 1 - Right",
//               style: TextStyle(fontSize: 16.0),
//             ),
//           ],
//         ),
//         SizedBox(height: 16.0),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               "Row 2 - Left",
//               style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               "Row 2 - Right",
//               style: TextStyle(fontSize: 16.0),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../../providers/all_hotel_provider.dart';
import '../../widgets/app_text.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_nav_bar.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/hotel_card.dart';
import '../profile_screens/image_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue,
      bottomNavigationBar: const CustomNavBar(index: 0),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              margin: EdgeInsets.only(top: size.height * 0.25),
              color: Colors.white,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _HeaderSection(),
                    _SearchCard(),
                    SizedBox(height: 20),
                    _NearbyHotels(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderSection extends StatefulWidget {
  const _HeaderSection({Key? key}) : super(key: key);

  @override
  _HeaderSectionState createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<_HeaderSection> {
  final imageManager = ImageManager();
  Uint8List? _image;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    _image = await imageManager.loadImage();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            CircleAvatar(
              radius: 25,
              backgroundImage:_image != null ? MemoryImage(_image!) : const AssetImage('assets/images/sign-in.png') as ImageProvider,
            ),
            CustomIconButton(icon: SvgPicture.asset('assets/icon/notification.svg')),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: AppText.large(
            'Welcome!',
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}


class _SearchCard extends StatelessWidget {
  const _SearchCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final LocationTextController = TextEditingController();
    final dateFromTextController = TextEditingController();
    final dateToTextController = TextEditingController();

    LocationTextController.text = 'VietNam';
    dateFromTextController.text = dateToTextController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey.withAlpha(50),
        ),
      ),
      child: Column(
        children:[
          Row(
            children:[
              // ignore: deprecated_member_use
              SvgPicture.asset('assets/icon/location.svg', color: Colors.blue),
              const SizedBox(width: 20,),
              CustomTextField(
                label: "Where", 
                controller: LocationTextController,
              ),
            ],
          ),
          const Divider(),
          Row(
            children:[
              // ignore: deprecated_member_use
              SvgPicture.asset('assets/icon/calendar.svg', color: Colors.blue),
              const SizedBox(width: 20,),
              CustomTextField(
                label: "From", 
                controller: dateFromTextController,
              ),
              CustomTextField(
                label: "To", 
                controller: dateToTextController,
              ),
            ],
          ),
          const SizedBox(height: 10),
          // CustomButton(text: 'Search'),
        ],
      ),
    );
  }
}


class _NearbyHotels extends ConsumerWidget {
  const _NearbyHotels();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hotels = ref.watch(allHotelsProvider);
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Nearby Hotels',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'See all',
              style: TextStyle(
                fontSize: 14,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        hotels.when(
          data:(hotels) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: hotels.length,
              itemBuilder: (context, index) {
                return HotelCard(hotel: hotels[index]);
              },
            ); 
          },
          error: (error, stackTrace) => Text('Error: $error'),
          loading: () => const Center(child: CircularProgressIndicator()), 
        ),
      ],
    );
  }
}
