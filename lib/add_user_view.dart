import 'package:flutter/material.dart';
import 'package:nov6/services.dart';
import 'package:nov6/user_model.dart';

class AddUserView extends StatefulWidget {
  final String? id;

  AddUserView({super.key, this.id});

  @override
  State<AddUserView> createState() => _AddUserViewState();
}

class _AddUserViewState extends State<AddUserView> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  UserModel? user;

  fetchUser() async {
    user = await getSingleUser(userId: widget.id!);
    setState(() {});
    nameController.text = user!.name!;
    emailController.text = user!.email!;
  }

  @override
  void initState() {
    if (widget.id != null) {
      fetchUser();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: (widget.id == null || user != null)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: "Enter name",
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        hintText: "Enter email",
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () async {
                      var name = nameController.text;
                      var email = emailController.text;
                      if (name.isEmpty || email.isEmpty) {
                        print("Please input all fields");
                      } else {
                        if (widget.id == null) {
                          print("API calling");
                          await registerUser(name: name, email: email);
                          print("API is called");
                        } else {
                          await updateUser(
                              name: name,
                              email: email,
                              id: widget.id.toString());
                        }
                        Navigator.pop(context, true);
                      }
                    },
                    child: Text(widget.id == null ? "Add" : "Update"),
                  )
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
