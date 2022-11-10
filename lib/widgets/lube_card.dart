import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../models/lube.dart';

// ignore: must_be_immutable
class LubeCard extends StatelessWidget {
  Future<Lube>? lube;
  double screenWidth;

  LubeCard({Key? key, required this.lube, required this.screenWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Lube>(
      future: lube,
      builder: (context, snapshot) {
        return snapshot.data != null
            ? InkWell(
                onTap: () {
                  launchUrlString(snapshot.data!.lubeTDS);
                },
                child: Card(
                  margin:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 20,
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        snapshot.data!.lubeName,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      CachedNetworkImage(
                        imageUrl: snapshot.data!.lubeImage,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(
                            color: Colors.red,
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            Image.asset('assets/not_available_image.png'),
                        height: screenWidth * 0.5,
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              )
            : Container();
      },
    );
  }
}
