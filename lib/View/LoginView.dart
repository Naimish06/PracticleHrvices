import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicle_hrvices/Constant/colors.dart';
import 'package:practicle_hrvices/Controller/LoginController.dart';

class LoginView extends StatefulWidget {
   LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool passwordvisible=false;
  final RegExp emailRegex =
  RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: LoginController(),
        builder: (LoginController controller){
          return Scaffold(
            backgroundColor: EditTextFillColor,
            body: Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Container(
                  padding: EdgeInsets.all(5),
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: ContainerColor,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 23,
                      ),
                      const SizedBox(
                        child: Text(
                          'Email Id',
                          style: TextStyle(color: TitleTextColor, fontSize: 15),
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Padding(
                        padding: EdgeInsets.all(3),
                        child: TextFormField(
                          controller: controller.emailcon,
                          decoration:const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email Id',
                            hintStyle: TextStyle(color: HintColor),
                            filled: true,
                            fillColor: EditTextFillColor,
                            suffixIcon: Icon(Icons.email_outlined,color: IconColor,)
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const SizedBox(
                        child: Text(
                          'Password',
                          style: TextStyle(color: TitleTextColor, fontSize: 15),
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Padding(
                        padding: EdgeInsets.all(3),
                        child: TextFormField(
                          controller: controller.passwordcon,
                          obscureText: !passwordvisible,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: TextStyle(color: HintColor),
                              filled: true,
                              fillColor: EditTextFillColor,
                              suffixIcon: IconButton(onPressed: () {
                                setState(() {
                                  passwordvisible = !passwordvisible;
                                });
                              }, icon: Icon(passwordvisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,color: IconColor,),)
                              ),
                        ),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppbarColor,
                              ),
                              onPressed: () {
                                if (controller.emailcon.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Please Enter Email Id!'),
                                    ),
                                  );
                                } else if (controller.emailcon.text.toString().isNotEmpty &&
                                    !emailRegex.hasMatch(controller.emailcon.text.toString())) {
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                      content:
                                      Text('Please Enter valid Email Id')));
                                } else if (controller.passwordcon.text.isEmpty || controller.passwordcon.text.length < 4) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Enter valid Password!'),
                                    ),
                                  );
                                } else {
                                  controller.Login(context);
                                }
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(fontSize: 20),
                              ))),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
