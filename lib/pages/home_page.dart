import 'package:cozy/models/place.dart';
import 'package:cozy/models/tips.dart';
import 'package:cozy/providers/place_provider.dart';
import 'package:cozy/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:cozy/theme.dart';
import 'package:cozy/widgets/city_card.dart';
import 'package:cozy/models/city.dart';
import 'package:cozy/widgets/place_card.dart';
import 'package:cozy/widgets/bottom_navbar_item.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var placeProvider = Provider.of<PlaceProvider>(context);
    

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(

          // NOTE: HEADER
          children: [
            SizedBox(
              height: edge,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: edge,
              ),
              child: Text(
                'Explore Now',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: edge,
              ),
              child: Text(
                'Search a cozy place',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),

            // NOTE POPULAR CITIES
            Padding(
              padding: EdgeInsets.only(
                left: edge,
              ),
              child: Text(
                'Popular Cities',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    City(
                      id: 1,
                      name: 'Jakarta',
                      imageUrl: 'assets/city1.png',
                    ),
                  ), 
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 2,
                      name: 'Bandung',
                      imageUrl: 'assets/city2.png',
                      isPopular: true,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 3,
                      name: 'Surabaya',
                      imageUrl: 'assets/city3.png',
                    ),
                  ), 
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 4,
                      name: 'Palembang',
                      imageUrl: 'assets/city4.png',
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 5,
                      name: 'Aceh',
                      imageUrl: 'assets/city5.png',
                      isPopular: true,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 6,
                      name: 'Bogor',
                      imageUrl: 'assets/city6.png',
                    ),
                  ),
                  SizedBox(
                    width: 71,
                  ),
                ],
              ),
            ),

            // RECOMMENDED PLACES
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: edge,
              ),
              child: Text(
                'Recommended Places',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: edge,
              ),
              child: FutureBuilder(
                future: placeProvider.getRecommendedPlaces(),
                builder: (context, snapshot) {
                  if(snapshot.hasData) {

                    int index = 0;

                    List <Place> data = snapshot.data as List<Place>;

                    return Column(
                      children: data.map((item){
                        index++;
                        return Container(
                          margin: EdgeInsets.only(
                            top: index == 1 ? 0 : 30,
                          ),
                          child: PlaceCard(item),
                        );
                      }).toList(),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),


            SizedBox(
              height: 30,
            ),
            // NOTE: TIPS AND GUIDANCE
            Padding(
              padding: EdgeInsets.only(
                left: edge,
              ),
              child: Text(
                'Tips & Guidance',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
              ),
              child: Column(
                children: [
                  TipsCard(
                    Tips(
                      id: 1,
                      name: 'City Guidelines',
                      imageUrl: 'assets/tips1.png',
                      updatedOn: '25 Dec 2021',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TipsCard(
                    Tips(
                      id: 2,
                      name: 'Jakarta Fair',
                      imageUrl: 'assets/tips2.png',
                      updatedOn: '26 Dec 2021',
                    ),
                  ),
                  SizedBox(
                    height: 115,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    // NAVIGATION MENU
    floatingActionButton: Container(
        width: MediaQuery.of(context).size.width - (2 * edge),
        height: 65,
        margin: EdgeInsets.symmetric(
          horizontal: edge,
        ),
        decoration: BoxDecoration(
          color: Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(
            23,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavBarItem(
              imageUrl: 'assets/icon_home.png',
              isActive: true,
            ),
            BottomNavBarItem(
              imageUrl: 'assets/icon_email.png',
              isActive: false,
            ),
            BottomNavBarItem(
              imageUrl: 'assets/icon_card.png',
              isActive: false,
            ),
            BottomNavBarItem(
              imageUrl: 'assets/icon_love.png',
              isActive: false,
            ),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  getRecommendedPlaces() {}
}