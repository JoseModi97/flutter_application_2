import 'package:flutter/material.dart';
import 'package:flutter_application_2/views/product_list_view.dart';
import 'package:provider/provider.dart';
import '../viewmodels/login_viewmodel.dart';

class LoginView extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            loginViewModel.isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      await loginViewModel.login(
                        _usernameController.text,
                        _passwordController.text,
                      );
                      if (loginViewModel.token != null) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductListView(),
                          ),
                        );
                      }
                    },
                    child: Text('Login'),
                  ),
          ],
        ),
      ),
    );
  }
}
