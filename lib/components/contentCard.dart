import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ContentCard extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final String description;
  final String imageurl;

  const ContentCard(
      {Key? key,
      required this.onTap,
      required this.title,
      required this.description,
      required this.imageurl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: this.onTap,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 5,
            child: ClipPath(
              clipper: ShapeBorderClipper(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: ListTile(
                //    contentPadding: EdgeInsets.only(bottom: 3),
                leading: CachedNetworkImage(
                  imageUrl: this.imageurl,
                  placeholder: (context, url) => Icon(
                    Icons.auto_stories,
                    size: MediaQuery.of(context).size.width * 0.1,
                    color: Colors.black12,
                  ),
                ),
                title: Text(
                  this.title,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    this.description,
                    style: TextStyle(fontSize: 11),
                  ),
                ),
                tileColor: Colors.white,
                trailing: Icon(
                  Icons.play_circle_fill,
                  color: Color.fromARGB(255, 69, 22, 99),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
