import 'package:flutter/cupertino.dart';

class AppBarBG extends StatelessWidget {
  const AppBarBG({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(214, 41, 118, 1),
              Color.fromRGBO(150, 47, 191, 1)
            ]),
      ),
    );
  }
}
