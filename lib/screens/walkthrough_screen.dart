import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ecommerce_app/common_widgets/utils.dart';
import 'package:flutter_ecommerce_app/screens/signin_screen.dart';

class WalkthroughScreen extends StatefulWidget {
  const WalkthroughScreen({Key? key}) : super(key: key);

  @override
  _WalkthroughScreenState createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  int pageNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Slider
          Expanded(
            child: PageView(
              children: [
                //
                Container(
                  color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image
                      Container(
                        height: 200,
                        width: 200,
                        color: Colors.white,
                      ),

                      const SizedBox(
                        height: 20.0,
                      ),

                      // Title
                      const Text(
                        "Title",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),

                      // Subtitle
                      const Text("This is a subtitle"),
                    ],
                  ),
                ),

                //
                Container(
                  color: Colors.blue,
                ),

                //
                Container(
                  color: Colors.yellow,
                ),
              ],
              onPageChanged: (index) {
                setState(() {
                  pageNumber = index;
                });
              },
            ),
          ),

          const SizedBox(
            height: 20.0,
          ),

          // Three dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 1st dot
              Container(
                height: 12,
                width: 12,
                decoration: BoxDecoration(
                  color:
                      (pageNumber == 0) ? Colors.grey[700] : Colors.grey[300],
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),

              //
              const SizedBox(
                width: 15,
              ),

              // 2nd dot
              Container(
                height: 12,
                width: 12,
                decoration: BoxDecoration(
                  color:
                      (pageNumber == 1) ? Colors.grey[700] : Colors.grey[300],
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),

              //
              const SizedBox(
                width: 15,
              ),

              // 3rd dot
              Container(
                height: 12,
                width: 12,
                decoration: BoxDecoration(
                  color:
                      (pageNumber == 2) ? Colors.grey[700] : Colors.grey[300],
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ],
          ),

          const SizedBox(
            height: 20.0,
          ),

          // Get started button
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: ElevatedButton(
              onPressed: () {
                return pushToAnotherPage(context, SignInScreen());
              },
              child: const Text("Get started"),
            ),
          ),
        ],
      ),
    );
  }
}
