Row(
              children: [
                Expanded(
                  child: Expandable(
                      header: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('jksacnjkas'),
                          Text('jksacnjkas'),
                        ],
                      ),
                      children: [
                        Text('data'),
                        Image.network(
                          'https://www.flutterclutter.dev/wp-content/uploads/2020/07/flutter-splash-animation-rain-drop-blue.gif',
                          height: 200,
                        )
                      ]),
                ),
                ElevatedButton(onPressed: () {}, child: Text('data'))
              ],
            )