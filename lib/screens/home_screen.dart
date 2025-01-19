import 'package:flutter/material.dart';
import 'package:lab2_186061/services/api_services.dart';
import 'package:lab2_186061/widgets/custom_appbar.dart';
import 'package:lab2_186061/widgets/loading_indicator.dart';
import 'package:lab2_186061/widgets/error_widget.dart';
import 'package:lab2_186061/widgets/joke_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<String>> _jokeTypes;

  @override
  void initState() {
    super.initState();
    _jokeTypes = ApiServices().getJokeTypes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Joke Types',
        actions: [
          IconButton(
            icon: Icon(Icons.casino),
            onPressed: () {
              Navigator.pushNamed(context, '/random');
            },
          ),
        ],
      ),  
      body: FutureBuilder<List<String>>(
        future: _jokeTypes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingIndicator();
          } else if (snapshot.hasError) {
            return CustomErrorWidget(errorMessage: 'Failed to load joke types');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No joke types available'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final jokeType = snapshot.data![index];
              return JokeCard(
                onTap: () {
                  Navigator.pushNamed(
                    context, 
                    '/jokes', 
                    arguments: jokeType,
                  );
                },
                joke: null, 
              );
            },
          );
        },
      ),
    );
  }
}