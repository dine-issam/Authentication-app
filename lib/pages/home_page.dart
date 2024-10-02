import 'package:auth_app/models/user.dart';
import 'package:auth_app/services/auth/auth_service.dart';
import 'package:auth_app/services/database/database_provider.dart';

import 'package:auth_app/utils/my_row_information.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.uid});
  final String uid;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // providers
  late final databaseProvider =
      Provider.of<DatabaseProvider>(context, listen: false);
  // user info
  UserProfile? user;
  String currentUserId = AuthService().getCurrentUid();
  // loading ...
  bool _isLoading = true;
  // on startup
  @override
  void initState() {
    super.initState();
    // lets load user info
    LoadUser();
  }

  // ignore: non_constant_identifier_names
  Future<void> LoadUser() async {
    // get the user profile info
    user = await databaseProvider.userProfile(widget.uid);
    // finish loading
    setState(() {
      _isLoading = false;
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("Profile Page"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 25),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Image.asset("assets/images/profile.png"),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Change profile picture",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Profile Information",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              MyRowInformation(
                  title: "Name", info: _isLoading ? '' : user!.name),
              MyRowInformation(
                  title: "User Name", info: _isLoading ? '' : user!.userName),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Personal Information",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [
                    // Title section (Name, Username, etc.)
                    const Expanded(
                      flex: 2,
                      child: Text(
                        "User Id",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    // Info section (e.g., Dine Issam)
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _isLoading ? '' : user!.uid,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          overflow: TextOverflow
                              .ellipsis, // Ensure long text doesn't overflow
                        ),
                      ),
                    ),
                    // Arrow icon
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: user!.uid));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('User ID copied to clipboard')),
                        );
                      },
                      child: Icon(
                        Icons.copy_all_outlined,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
              MyRowInformation(
                  title: "E-mail", info: _isLoading ? '' : user!.email),
              MyRowInformation(
                  title: "Phone Number",
                  info: _isLoading ? '' : user!.phoneNumber),
              const MyRowInformation(title: "Gender", info: "Male"),
              const MyRowInformation(
                  title: "Date of Birth", info: "22 Oct, 2004"),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    AuthService().logout();
                  },
                  child: const Text(
                    "Logout",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.red),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
