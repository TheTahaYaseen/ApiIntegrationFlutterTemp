import 'package:flutter/material.dart';
import 'package:nov6/add_user_view.dart';
import 'package:nov6/services.dart';
import 'package:nov6/user_model.dart';

class UsersView extends StatefulWidget {
  const UsersView({super.key});

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  List<UserModel> users = [];
  bool isDataFetch = false;

  fetchUser() async {
    users = await getUsers();
    setState(() {
      isDataFetch = true;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final isUserAdded = await Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddUserView()));
          if (isUserAdded != null && isUserAdded) {
            setState(() {});
          }
        },
        child: Icon(Icons.add),
      ),
      body: isDataFetch
          ? ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () async {
                    final isUserUpdated = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddUserView(
                                  id: users[index].id.toString(),
                                )));
                    if (isUserUpdated != null && isUserUpdated) {
                      setState(() {});
                    }
                  },
                  leading: Icon(Icons.person),
                  title: Text(users[index].name!),
                  subtitle: Text(users[index].email!),
                  trailing: IconButton(
                      onPressed: () async {
                        await deleteUser(id: users[index].id.toString());
                        setState(() {});
                      },
                      icon: Icon(Icons.delete)),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
