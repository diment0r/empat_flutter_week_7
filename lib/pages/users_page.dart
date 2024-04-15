import 'dart:convert';

import 'package:empat_flutter_week_7/state/user_list_model.dart';
import 'package:empat_flutter_week_7/widgets/loading/custom_list_shimmer.dart';
import 'package:empat_flutter_week_7/widgets/tile_customs/custom_user_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsersPageWidget extends StatefulWidget {
  const UsersPageWidget({super.key});

  @override
  State<UsersPageWidget> createState() => _UsersPageWidgetState();
}

class _UsersPageWidgetState extends State<UsersPageWidget> {
  late final Future<UserListModel> users;

  Future<UserListModel> fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=1'));
    if (response.statusCode == 200) {
      return UserListModel.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  void initState() {
    users = fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          sliver: FutureBuilder(
            future: users,
            builder: (context, snapshot) {
              int childLenght;
              if (snapshot.connectionState != ConnectionState.done ||
                  !snapshot.hasData) {
                childLenght = 1;
              } else {
                childLenght = snapshot.data!.users.length;
              }
              return SliverList.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  if (snapshot.connectionState != ConnectionState.done ||
                      !snapshot.hasData) {
                    return const CustomListShimmerWidget();
                  } else {
                    return CustomUserListTileWidget(
                      user: snapshot.data!.users[index],
                    );
                  }
                },
                itemCount: childLenght,
              );
            },
          ),
        ),
      ],
    );
  }
}
