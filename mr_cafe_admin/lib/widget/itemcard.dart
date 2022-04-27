import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.title,
    required this.image,
    required this.price,
  }) : super(key: key);
  final String title;
  final ImageProvider image;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
          child: GestureDetector(
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Color(0xFF212325)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,

                // SkeletonAnimation method
                children: <Widget>[
                  SizedBox(
                    width: 110.0,
                    height: 110.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                          image: image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, bottom: 5.0),
                            child: SizedBox(
                              // height: 25,
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Text(
                                title,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white70,
                                    fontFamily: 'Libre Baskerville'),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Padding(
                              padding: EdgeInsets.only(right: 5.0),
                              child: SizedBox(
                                // width: 60,
                                // height: 13,
                                child: Text(
                                  '$price/-',
                                  style: TextStyle(color: Colors.white70),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.chevron_right,
                    color: Colors.white70,
                    size: 40,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
