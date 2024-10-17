import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geeksynergy_mechine_task/Controller/AuthBloc/bloc/auth_bloc.dart';
import 'package:geeksynergy_mechine_task/Model/user_model.dart';
import 'package:geeksynergy_mechine_task/Utils/constants.dart';
import 'package:geeksynergy_mechine_task/Utils/styles.dart';
import 'package:geeksynergy_mechine_task/View/LoginScreen/login_screen.dart';
import 'package:geeksynergy_mechine_task/View/LoginScreen/widgets/main_button.dart';
import 'package:geeksynergy_mechine_task/View/LoginScreen/widgets/maintextfield.dart';

class SignupScreenWrapper extends StatelessWidget {
  const SignupScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: SignupScreen(),
    );
  }
}

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  TextEditingController fullnamecontroller = TextEditingController();

  TextEditingController phonecontroller = TextEditingController();

  String profession = 'Select Profession';

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is SignUpFailed) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            } else if (state is SignUpSuccess) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const LoginScreenWrapper()));
            }
          },
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 14),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: constants.white,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Text(
                        "Sign up",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: MainTextfield(
                        controller: emailcontroller,
                        preicon: Icons.email_outlined,
                        hinttext: "Please enter your email",
                        namefield: "Email",
                        keyboard: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter a valid email";
                          } else if (!constants.regemail.hasMatch(value)) {
                            return "Please enter a valid email";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    MainTextfield(
                      controller: passwordcontroller,
                      preicon: Icons.lock,
                      hinttext: "Please enter your password",
                      namefield: "Password",
                      keyboard: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a password";
                        } else if (!constants.password.hasMatch(value)) {
                          return 'Password should contain at least one upper case, one lower case, one digit, one special character and  must be 8 characters in length';
                        } else {
                          return null;
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: MainTextfield(
                        controller: fullnamecontroller,
                        preicon: Icons.person_3_outlined,
                        hinttext: "Please enter your full name",
                        namefield: "Full name",
                        keyboard: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter name";
                          } else if (!constants.name.hasMatch(value)) {
                            return "Enter a valid name";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: MainTextfield(
                        controller: phonecontroller,
                        preicon: Icons.person_search_sharp,
                        hinttext: "Please enter your phone number",
                        namefield: "User name",
                        keyboard: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter phone number";
                          } else if (value.length > 10) {
                            return "number must be 10";
                          } else if (!constants.phonreg.hasMatch(value)) {
                            return "Please enter a valid number";
                          }
                          return null;
                        },
                      ),
                    ),
                    DropdownButton<String>(
                      value: profession,
                      items: [
                        'Select Profession',
                        'Doctor',
                        'Engineer',
                        'Teacher',
                        'Artist'
                      ]
                          .map((e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          profession = value ?? 'Select Profession';
                        });
                      },
                      dropdownColor: Colors.grey[850],
                      iconEnabledColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          if (state is SignUpLoading) {
                            return MainButton(
                                onpressed: () {},
                                child: const Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Signing up",
                                      style: styles.textfieldhintstyle,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    SizedBox(
                                        width: 15,
                                        height: 15,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 1,
                                          color: constants.white,
                                        )),
                                  ],
                                ));
                          }
                          return MainButton(
                            child: const Text("Sign up",
                                style: styles.mainbuttontext),
                            onpressed: () {
                              if (formKey.currentState!.validate()) {
                                final user = UserModel(
                                    name: fullnamecontroller.text,
                                    password: passwordcontroller.text,
                                    email: emailcontroller.text,
                                    phone: phonecontroller.text,
                                    profession: profession);
                                BlocProvider.of<AuthBloc>(context)
                                    .add(SignUpEvent(userModel: user));
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
