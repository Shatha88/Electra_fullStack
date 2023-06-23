import 'package:electra/Imports/imports.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  bool isPassword = false;
  bool hasAddress = false;
  bool isCarOwner = true;
  bool isStationOwner = false;
  bool isConsumer = true;

  @override
  Widget build(BuildContext context) {
    var screenH = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: bGColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          kVSpace64,
          const Align(
            alignment: AlignmentDirectional.bottomStart,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Electra",
                style: TextStyle(color: txtFieldColor, fontSize: 28),
              ),
            ),
          ),
          const Align(
            alignment: AlignmentDirectional.bottomStart,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Sign Up",
                style: TextStyle(
                    color: txtFieldColor,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          kVSpace24,
          const Align(
            alignment: AlignmentDirectional.bottomStart,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "You Own:",
                style: TextStyle(
                    color: txtFieldColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 36,
            width: screenH * 0.95,
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
              color: Colors.white,
              //___________________________ User Type ______________________
              child: Row(children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isCarOwner = !isCarOwner;
                        isStationOwner = !isStationOwner;
                        hasAddress = !hasAddress;
                        isConsumer = !isConsumer;
                      });
                    },
                    child: Container(
                      height: 36,
                      decoration: isCarOwner
                          ? BoxDecoration(
                              color: greenGradient,
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  greenGradient,
                                  purpleGradient,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20),
                            )
                          : null,
                      child: const Center(
                          child: Text(
                        "Electric car ",
                        style: TextStyle(
                            color: txtFieldColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      )),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isCarOwner = !isCarOwner;
                        isStationOwner = !isStationOwner;
                        hasAddress = !hasAddress;
                        isConsumer = !isConsumer;
                      });
                    },
                    child: Container(
                      height: 36,
                      decoration: isStationOwner
                          ? BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  greenGradient,
                                  purpleGradient,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20),
                            )
                          : null,
                      child: const Center(
                        child: Text(
                          "Electric Station ",
                          style: TextStyle(
                              color: txtFieldColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                children: [
                  TextFormCoustom(
                    hint: 'Enter your name',
                    label: 'Name',
                    controller: nameController,
                  ),
                  TextFormCoustom(
                    hint: 'example@gmail.com',
                    label: 'Email',
                    controller: emailController,
                  ),
                  TextFormCoustom(
                    hint: 'Enter your password',
                    label: 'Password',
                    isPassword: true,
                    controller: passwordController,
                  ),
                  TextFormCoustom(
                    hint: 'Re-enter your password',
                    label: 'Confirm password',
                    isPassword: true,
                    controller: confirmPasswordController,
                  ),
                  TextFormCoustom(
                    hint: 'Enter Phone',
                    label: 'Phone',
                    controller: phoneController,
                  ),
                ],
              )),
          kVSpace16,
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const ForgetPassword()),
                  (route) => false);
            },
            child: Align(
              alignment: AlignmentDirectional.bottomStart,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: const TextCustom(
                          text: "Already Have an Account",
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        onTap: () {
                          context.pushAndRemove(view: const LoginPage());
                        },
                      ),
                    ],
                  )),
            ),
          ),
          kVSpace16,
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: buttontxtColor,
              backgroundColor: buttonBGColor,
              // foreground
              padding: const EdgeInsets.symmetric(horizontal: 16),

              minimumSize: Size(screenH * 0.9, 57),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
            onPressed: () async {
              if (!isConsumer) {
                if (nameController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty &&
                    confirmPasswordController.text.isNotEmpty &&
                    phoneController.text.isNotEmpty &&
                    emailController.text.isNotEmpty) {
                  if (passwordController.text
                          .compareTo(confirmPasswordController.text) ==
                      0) {
                    final Map body = {
                      "phone": phoneController.text,
                      "password": passwordController.text,
                      "email": emailController.text,
                      "name": nameController.text,
                      "address": "", //addressController.text,
                      "bank_account": ""
                    };
                    final response =
                        await createAccount(body: body, userType: 'PROVIDER');
                    if (response.statusCode == 200) {
                      if (context.mounted) {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                            (route) => false);
                      }
                    } else if (response.statusCode == 422) {
                      showSnackBar(
                          'This email is used please enter another email');
                      setState(() {});
                    } else if (response.statusCode == 400) {
                      showSnackBar('Please enter correct email and Password');
                      setState(() {});
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Please enter identical password')));
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Please fill the Signup form')));
                }
              }
              if (isConsumer) {
                if (nameController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty &&
                    confirmPasswordController.text.isNotEmpty &&
                    emailController.text.isNotEmpty) {
                  if (passwordController.text
                      .contains(confirmPasswordController.text)) {
                    final Map body = {
                      "phone": phoneController.text,
                      "password": passwordController.text,
                      "email": emailController.text,
                      "name": nameController.text,
                      "address": "", //addressController,
                      "bank_account": ""
                    };
                    final response =
                        await createAccount(body: body, userType: 'CONSUMER');
                    if (response.statusCode == 200) {
                      if (context.mounted) {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                            (route) => false);
                      }
                    } else if (response.statusCode == 422) {
                      showSnackBar(
                          'This email is used please enter anoth email');
                      setState(() {});
                    } else if (response.statusCode == 400) {
                      showSnackBar('Please enter correct email and Password');
                      setState(() {});
                    }
                  } else {
                    showSnackBar('Please check that password is identecal');
                  }
                } else {
                  showSnackBar('Please fill the Signup form');
                }
              }
            },
            child: const Text(
              'Signup',
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
          ),
          kVSpace16,
        ]),
      ),
    );
  }

  showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
