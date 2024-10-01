import 'package:flutter/material.dart';

class MyRowInformation extends StatelessWidget {
  const MyRowInformation({super.key, required this.title, required this.info});
  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          // Title section (Name, Username, etc.)
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          // Info section (e.g., Dine Issam)
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                info,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
                overflow: TextOverflow.ellipsis, // Ensure long text doesn't overflow
              ),
            ),
          ),
          // Arrow icon
          Icon(
            Icons.navigate_next_outlined,
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
