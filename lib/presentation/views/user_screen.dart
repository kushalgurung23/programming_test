import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:programming_test/logic/controllers/map_provider.dart';
import 'package:programming_test/logic/controllers/user_provider.dart';
import 'package:programming_test/presentation/views/map_screen.dart';
import 'package:programming_test/presentation/views/single_user.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatelessWidget {
  static const String id = '/';

  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, data, child) {
        MediaQueryData mediaQueryData = MediaQuery.of(context);
        return Scaffold(
            appBar: AppBar(
              title: const Text('All Users'),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MapScreen.id);
                    },
                    icon: const Icon(CupertinoIcons.map))
              ],
            ),
            body: data.userList.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: data.userList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          Provider.of<MapProvider>(context, listen: false)
                              .setUserDetails(
                                  id: data.userList[index].id,
                                  firstName: data.userList[index].name.first,
                                  lastName: data.userList[index].name.last,
                                  latitude:
                                      data.userList[index].location.latitude,
                                  longitude:
                                      data.userList[index].location.longitude,
                                  image: data.userList[index].picture,
                                  email: data.userList[index].email);
                          Navigator.pushNamed(context, SingleUser.id);
                        },
                        leading: CachedNetworkImage(
                          imageUrl: data.userList[index].picture,
                          imageBuilder: (context, image) => CircleAvatar(
                            backgroundImage: image,
                          ),
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                        title: Text(
                          data.userList[index].name.first.toString() +
                              " " +
                              data.userList[index].name.last.toString(),
                          style: const TextStyle(color: Colors.black),
                        ),
                      );
                    }));
      },
    );
  }
}
