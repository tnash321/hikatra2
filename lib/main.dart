import 'package:flutter/material.dart';

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const NavigationExample(),
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.green,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Homepage',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.tag_faces)),
            label: 'Profile',
          ),
          NavigationDestination(
            icon: Badge(
              //label: Text('2'),
              child: Icon(Icons.map_outlined),
            ),
            label: 'Map',
          ),
          NavigationDestination(
            icon: Badge(
              child: Icon(Icons.add_a_photo),
            ),
            label: 'Photo Gallery',
          ),
        ],
      ),
      body: <Widget>[
        /// Homepage
      Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Image(
                    image: NetworkImage('https://media.istockphoto.com/id/1369171053/photo/group-of-sporty-people-walks-in-mountains-at-sunset-with-backpacks.jpg?s=612x612&w=0&k=20&c=ajQuWt2YRWd0FPaCpdKz2Tt3WX2NI1ddeZjf8HIxlwU='),
                  ),
                  Text(
                      'Home page',
                        style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 30),
                  TextButton(
                    style: TextButton.styleFrom(foregroundColor: Colors.blue),
                    onPressed: null,
                    child: const Text('Most Visited'),
                  ),
                  const SizedBox(height: 15),
                  TextButton(
                    style: TextButton.styleFrom(foregroundColor: Colors.blue),
                    onPressed: null,
                    child: const Text('Highest Rated'),
                  ),
                ],
              ),
            ),
          ),
        ),

        //profile page
        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Image(
                    image: NetworkImage('https://freerangestock.com/sample/120140/business-man-profile-vector.jpg'),
                  ),
                  Text(
                    'Profile page',
                    style: theme.textTheme.displayLarge,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'This is where your personal settings should go',
                    style: theme.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'This is also where personal preferences should go',
                    style: theme.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),

        /// Map page
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: Icon(Icons.nordic_walking),
                  title: Text('Route 1'),
                  subtitle: Text('This is a route'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.nordic_walking),
                  title: Text('Route 2'),
                  subtitle: Text('This is a route'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.nordic_walking),
                  title: Text('Route 3'),
                  subtitle: Text('This is a route'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.nordic_walking),
                  title: Text('Route 4'),
                  subtitle: Text('This is a route'),
                ),
              ),
            ],
          ),
        ),

        /// Photo page
        const Column(
          children: [
            Image(
              image: NetworkImage('https://media.istockphoto.com/id/1141196125/photo/hiking-in-the-allgaeu-alps.jpg?s=612x612&w=0&k=20&c=scBnm6PxD4eJm49IKmP-EJiarbI_lds_z5QCWgViqTo='),
            ),
            Image(
              image: NetworkImage('https://media.istockphoto.com/id/1189969126/photo/group-of-hikers-walks-in-mountains-at-sunset.jpg?s=612x612&w=0&k=20&c=YlJOZLmELRF0HaEr1Xv4-Uae_VN4vnB8XnE99hGD3gQ='),
            ),
            Image(
              image: NetworkImage('https://www.ruidosonews.com/gcdn/presto/2018/08/21/PNM8/0f2772dd-aa08-42c2-93f4-e5c7b7e6737e-RichAnnaDozier.jpg?crop=2893,1627,x0,y166&width=2893&height=1627&format=pjpg&auto=webp'),
            ),
          ],
        ),


      ][currentPageIndex],
    );
  }
}
//