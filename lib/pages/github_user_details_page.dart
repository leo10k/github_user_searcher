import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/github_model.dart';

class GithubDetailsPage extends StatelessWidget {
  final GitHub githubUser;

  const GithubDetailsPage({super.key, required this.githubUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(githubUser.userName),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
          child: ListView(
            children: [
              Center(
                child: ClipOval(
                  child: Image.network(
                    githubUser.avatar, 
                    fit: BoxFit.fill,
                    height: 120,
                    width: 120,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 26),
                child: Center(
                  child: 
                  Text(
                    githubUser.bio, 
                    style: TextStyle(fontSize: 18)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Followers: ${githubUser.followers} · ',
                    ),
                    Text(
                      'Following: ${githubUser.following}'
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on, size: 14,),
                    Text(
                      ' ${githubUser.location}'
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: Center(
                  child: Text(
                    'Public Repositorys: ${githubUser.publicRepositorys}',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        
        ),
    );
  }
}
