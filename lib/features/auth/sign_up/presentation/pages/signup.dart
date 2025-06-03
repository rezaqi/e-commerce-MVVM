import 'package:e_commerce/config/routs/routs.dart';
import 'package:e_commerce/core/class/api/api_manager.dart';
import 'package:e_commerce/core/class/states/request_state.dart';
import 'package:e_commerce/core/class/uitls/color/app_colors.dart';
import 'package:e_commerce/core/class/uitls/components.dart';
import 'package:e_commerce/core/class/uitls/images/app_images.dart';
import 'package:e_commerce/features/auth/sign_up/data/datasource/remote_ds.dart';
import 'package:e_commerce/features/auth/sign_up/data/model/request_model.dart';
import 'package:e_commerce/features/auth/sign_up/data/repository/repo_remote_.dart';
import 'package:e_commerce/features/auth/sign_up/domain/usecase/signup_usecase.dart';
import 'package:e_commerce/features/auth/sign_up/presentation/bloc/bloc.dart';
import 'package:e_commerce/features/auth/sign_up/presentation/bloc/event.dart';
import 'package:e_commerce/features/auth/sign_up/presentation/bloc/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  var nameC = TextEditingController();

  var emailC = TextEditingController();

  var passC = TextEditingController();

  var rePassC = TextEditingController();

  var phoneC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpBloc>(
      create: (context) => SignUpBloc(
          SignupUseCase(RepoRemoteSignUp(SignUpImplDS(ApiManager())))),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: SingleChildScrollView(
          child:
              BlocConsumer<SignUpBloc, SignUpState>(listener: (context, state) {
            if (state.requestState == RequestState.loading) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Loading..."),
                  content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [CircularProgressIndicator()]),
                ),
              );
            }
            if (state.requestState == RequestState.error) {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Error"),
                  content: Icon(Icons.error_outline_sharp),
                ),
              );
            }
            if (state.requestState == RequestState.success) {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(Routes.home, (r) => false);
            }
          }, builder: (context, state) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 85.h,
                    ),
                    Image.asset(
                      AppImages.route,
                      height: 71.h,
                      width: 237.w,
                    ),
                    SizedBox(
                      height: 47.h,
                    ),
                    defaultFormField(
                        controller: nameC,
                        label: "Full name",
                        validate: (value) {
                          return null;
                        }),
                    SizedBox(
                      height: 32.h,
                    ),
                    defaultFormField(
                        controller: phoneC,
                        label: "Phone Number",
                        validate: (value) {
                          return null;
                        }),
                    SizedBox(
                      height: 32.h,
                    ),
                    defaultFormField(
                        controller: emailC,
                        label: "Email",
                        validate: (value) {
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value!);
                          if (value == null || value.isEmpty || !emailValid) {
                            return "Please Enter valid Email Address";
                          }
                          return null;
                        }),
                    SizedBox(
                      height: 32.h,
                    ),
                    defaultFormField(
                        controller: passC,
                        label: "Password",
                        validate: (value) {
                          return null;
                        },
                        isPassword: true),
                    SizedBox(
                      height: 32.h,
                    ),
                    defaultFormField(
                        controller: rePassC,
                        label: "Password",
                        validate: (value) {
                          return null;
                        },
                        isPassword: true),
                    SizedBox(
                      height: 56.h,
                    ),
                    SizedBox(
                      height: 64.h,
                      child: ElevatedButton(
                        onPressed: () {
                          print("gggg");
                          SignUpRequestModel model = SignUpRequestModel(
                              name: nameC.text,
                              email: emailC.text,
                              password: passC.text,
                              phone: phoneC.text,
                              rePassword: rePassC.text);
                          BlocProvider.of<SignUpBloc>(context)
                              .add(SignUpRequestEvent(model));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        child: Text(
                          "Create Account",
                          style: GoogleFonts.poppins(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "I Have an account?",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp,
                              color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.login);
                          },
                          child: Text("Login",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  color: Colors.white)),
                        )
                      ],
                    )
                  ]),
            );
          }),
        ),
      ),
    );
  }
}
