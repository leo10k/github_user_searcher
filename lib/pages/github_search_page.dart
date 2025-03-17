import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/github_service.dart';
import 'package:flutter_application_1/models/github_model.dart';
import 'github_user_details_page.dart';

class GithubSearchPage extends StatefulWidget {
  const GithubSearchPage({super.key});

  @override
  State<GithubSearchPage> createState() => _GithubSearchPage();
}

class _GithubSearchPage extends State<GithubSearchPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('GitHub User Search'),
        centerTitle: true,
        backgroundColor: Colors.green[200],
      ),
      body: _SearchTab(),
    );
  }
}

class _SearchTab extends StatelessWidget {
  const _SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          TextField(
            controller: _controller,
            style: const TextStyle(color: Colors.black),
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              hintText: 'Github username',
              hintStyle: const TextStyle(color: Colors.green),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.green),
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.green, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.green, width: 2.5),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              final userName = _controller.text.trim();
              if (userName.isNotEmpty) {
                _searchUser(userName, context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Por favor, insira um nome de usuário!'),
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 14.0,
                horizontal: 32.0,
              ),
            ),
            child: const Text(
              'Search',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          ],
        ),
      ),
    );
  }

  void _searchUser(String userName, BuildContext context) async {
    try {
      GitHub user = await GithubService.getUser(userName);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GithubDetailsPage(githubUser: user),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Usuário não encontrado!')));
    }
  }
}
