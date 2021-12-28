import 'package:cozy/models/place.dart';
import 'package:cozy/pages/error_page.dart';
import 'package:cozy/pages/home_page.dart';
import 'package:cozy/theme.dart';
import 'package:cozy/widgets/facility_item.dart';
import 'package:cozy/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class DetailPage extends StatelessWidget {

  final Place place;

  DetailPage(this.place);

  @override
  Widget build(BuildContext context) {
    
    launchUrl (String url) async {
      if(await canLaunch(url)) {
        launch(url);
      } else {
        Navigator.push(
          context, MaterialPageRoute(
            builder: (context) => ErrorPage()
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              '${place.imageUrl}',
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(
                        20,
                      ),
                    ),
                    color: whiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),

                      // NOTE: THE TITLE OF PLACE
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${place.name}',
                                  style: blackTextStyle.copyWith(
                                    fontSize: 22,
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: '\$${place.price}',
                                    style: purpleTextStyle.copyWith(
                                      fontSize: 16,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ' / month',
                                        style: greyTextStyle.copyWith(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [1, 2, 3, 4, 5].map((index) {
                                return Container(
                                  margin: EdgeInsets.only(
                                    left: 2,
                                  ),
                                  child: RatingItem(
                                    index: index,
                                    rating: int.parse('${place.rating}'),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      // NOTE: MAIN FACILITIES
                      Padding(
                        padding: EdgeInsets.only(
                          left: edge,
                        ),
                        child: Text(
                          'Main Facilities',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilityItem(
                              name: 'kitchen(s)',
                              imageUrl: 'assets/icon_kitchen.png',
                              total: int.parse('${place.numberOfKitchens}'),
                            ),
                            FacilityItem(
                              name: 'bedroom(s)',
                              imageUrl: 'assets/icon_bedroom.png',
                              total: int.parse('${place.numberOfBedrooms}'),
                            ),
                            FacilityItem(
                              name: 'cupboard(s)',
                              imageUrl: 'assets/icon_cupboard.png',
                              total: int.parse('${place.numberOfCupboards}'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),


                      // NOTE: PHOTOS
                      Padding(
                        padding: EdgeInsets.only(
                          left: edge,
                        ),
                        child: Text(
                          'Photos',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 88,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: place.photos!.map((item){
                            return Container(
                              margin: EdgeInsets.only(
                                left: edge,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  16,
                                ),
                                child: Image.network(
                                  item,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      // NOTE: LOCATION
                      Padding(
                        padding: EdgeInsets.only(
                          left: edge,
                        ),
                        child: Text(
                          'Location',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${place.address}\n${place.city}, ${place.country}',
                              style: greyTextStyle.copyWith(
                                fontSize: 14,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                launchUrl(
                                  '${place.mapUrl}',
                                );
                              }, 
                              child: Image.asset(
                                'assets/btn_map.png',
                                width: 40,
                                height: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        width: MediaQuery.of(context).size.width - (2 * edge),
                        height: 50,
                        child: RaisedButton(
                          onPressed: () {
                            launchUrl(
                              'tel:${place.phone}',
                            );
                          },
                          color: purpleColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              17,
                            ),
                          ),
                          child: Text(
                            'Book Now',
                            style: whiteTextStyle.copyWith(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ], 
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(
                        context,
                      );
                    },
                    child: Image.asset(
                      'assets/btn_back.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                  Image.asset(
                    'assets/btn_wishlist.png',
                    width: 40,
                    height: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}