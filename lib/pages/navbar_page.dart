import 'package:location_tracker/pages/nearby_page.dart';
import 'package:location_tracker/pages/home_page.dart';
import 'package:location_tracker/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavbarPage extends StatefulWidget {
  static final String routeName = '/navbar';
  @override
  _NavbarPageState createState() => _NavbarPageState();
}

class _NavbarPageState extends State<NavbarPage> {
  var currentTab = 0;
  final List<Widget> screens = [HomePage(), NearbyPage(), SettingsPage()];

  Widget currentScreen = HomePage();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  MaterialButton(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    minWidth: 40,
                    onPressed: () {
                      setState(
                        () {
                          currentScreen = HomePage();
                          currentTab = 0;
                        },
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home_rounded,
                          color:
                              currentTab == 0 ? Colors.red[600] : Colors.grey,
                        ),
                        Text(
                          'Home',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: currentTab == 0
                                  ? Colors.red[600]
                                  : Colors.grey,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    minWidth: 40,
                    onPressed: () {
                      setState(
                        () {
                          currentScreen = NearbyPage();
                          currentTab = 1;
                        },
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.near_me_rounded,
                          color:
                              currentTab == 1 ? Colors.red[600] : Colors.grey,
                        ),
                        Text(
                          'Nearby',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: currentTab == 1
                                  ? Colors.red[600]
                                  : Colors.grey,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // MaterialButton(
                  //   padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  //   minWidth: 40,
                  //   onPressed: () {
                  //     showModalBottomSheet(
                  //         context: context,
                  //         builder: (context) {
                  //           return Container(
                  //             height: 270,
                  //             child: Column(
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceEvenly,
                  //               children: [
                  //                 Text(
                  //                   'Select a Ride Option',
                  //                   style: GoogleFonts.poppins(
                  //                     textStyle: TextStyle(
                  //                         fontSize: 24,
                  //                         fontWeight: FontWeight.w500),
                  //                   ),
                  //                 ),
                  //                 Row(
                  //                   mainAxisAlignment:
                  //                       MainAxisAlignment.spaceEvenly,
                  //                   children: [
                  //                     Column(
                  //                       mainAxisAlignment:
                  //                           MainAxisAlignment.center,
                  //                       children: [
                  //                         CircleAvatar(
                  //                             backgroundColor: Colors.pink[50],
                  //                             backgroundImage:
                  //                                 AssetImage('images/bike.png'),
                  //                             radius: 60),
                  //                         SizedBox(height: 9),
                  //                         Container(
                  //                             width: 80,
                  //                             height: 35,
                  //                             child: ElevatedButton(
                  //                                 onPressed: () {},
                  //                                 style:
                  //                                     ElevatedButton.styleFrom(
                  //                                         primary:
                  //                                             Colors.pink[400],
                  //                                         //side: BorderSide(color: Colors.red, width: 2),
                  //                                         shape: RoundedRectangleBorder(
                  //                                             borderRadius:
                  //                                                 BorderRadius
                  //                                                     .circular(
                  //                                                         21))),
                  //                                 child: Text('Bike',
                  //                                     style: GoogleFonts
                  //                                         .poppins()))),
                  //                       ],
                  //                     ),
                  //                     Column(
                  //                       mainAxisAlignment:
                  //                           MainAxisAlignment.center,
                  //                       children: [
                  //                         CircleAvatar(
                  //                           backgroundColor: Colors.pink[50],
                  //                           backgroundImage:
                  //                               AssetImage('images/car.png'),
                  //                           radius: 60,
                  //                         ),
                  //                         SizedBox(
                  //                           height: 9,
                  //                         ),
                  //                         Container(
                  //                             width: 80,
                  //                             height: 35,
                  //                             child: ElevatedButton(
                  //                                 onPressed: () {},
                  //                                 style:
                  //                                     ElevatedButton.styleFrom(
                  //                                         primary:
                  //                                             Colors.pink[400],
                  //                                         //side: BorderSide(color: Colors.red, width: 2),
                  //                                         shape: RoundedRectangleBorder(
                  //                                             borderRadius:
                  //                                                 BorderRadius
                  //                                                     .circular(
                  //                                                         21))),
                  //                                 child: Text('Car',
                  //                                     style: GoogleFonts
                  //                                         .poppins()))),
                  //                       ],
                  //                     )
                  //                   ],
                  //                 ),
                  //               ],
                  //             ),
                  //           );
                  //         });
                  //     setState(
                  //       () {
                  //         currentScreen = RidePage();
                  //         currentTab = 2;
                  //       },
                  //     );
                  //   },
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Icon(
                  //         Icons.directions_bike,
                  //         color:
                  //             currentTab == 2 ? Colors.pink[300] : Colors.grey,
                  //       ),
                  //       Text(
                  //         'Rides',
                  //         style: GoogleFonts.poppins(
                  //           textStyle: TextStyle(
                  //             color: currentTab == 2
                  //                 ? Colors.pink[300]
                  //                 : Colors.grey,
                  //           ),
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  MaterialButton(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    minWidth: 40,
                    onPressed: () {
                      setState(
                        () {
                          currentScreen = SettingsPage();
                          currentTab = 2;
                        },
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.settings,
                          color:
                              currentTab == 2 ? Colors.red[600] : Colors.grey,
                        ),
                        Text(
                          'More',
                          style: TextStyle(
                            color:
                                currentTab == 2 ? Colors.red[600] : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
