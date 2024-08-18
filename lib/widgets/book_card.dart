// import 'package:flutter/material.dart';
//
// class BookCard extends StatelessWidget {
//   final String title;
//   final String imagePath;
//
//   BookCard({required this.title, required this.imagePath});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: (){
//
//       },
//       child: Card(
//         color: Colors.white,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero)),
//         elevation: 4,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,

//           children: [
//             Expanded(
//               child: Container(
//                 color: Colors.white, // Background color for image placeholder
//                 child: Image.asset(
//                   imagePath,
//                   fit: BoxFit.cover,
//                   errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
//                     return Center(
//                       child: Icon(
//                         Icons.cloud_download,
//                         size: 30,
//                         color: Colors.grey,
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 title,
//                 style: TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 maxLines: 3,
//                 overflow: TextOverflow.ellipsis,
//                 softWrap: true,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String url;

  BookCard({required this.title, required this.imagePath, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Implement navigation or action on tap
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  WebViewScreen(url: url)),
        );
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                // Changed to use network images
                child: Image.network(
                  imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                    return Center(
                      child: Icon(
                        Icons.cloud_download,
                        size: 30,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WebViewScreen extends StatelessWidget {
  final String url;

  WebViewScreen({required this.url});

  @override
  Widget build(BuildContext context) {
    // Implement the WebView or other navigation mechanism here
    return Scaffold(
      appBar: AppBar(title: Text('WebView')),
      body: Center(
        child: Text('Navigate to URL: $url'), // Placeholder
      ),
    );
  }
}
