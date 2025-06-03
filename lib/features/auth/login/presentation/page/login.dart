import 'package:e_commerce/config/routs/routs.dart';
import 'package:e_commerce/core/class/api/api_manager.dart';
import 'package:e_commerce/core/class/uitls/color/app_colors.dart';
import 'package:e_commerce/core/class/uitls/components.dart';
import 'package:e_commerce/core/class/uitls/images/app_images.dart';
import 'package:e_commerce/core/class/uitls/text/app_text.dart';
import 'package:e_commerce/features/auth/login/data/data_suorce/remote_login_ds.dart';
import 'package:e_commerce/features/auth/login/data/repository/remote_repo_impl.dart';
import 'package:e_commerce/features/auth/login/doman/usecase/login_use_case.dart';
import 'package:e_commerce/features/auth/login/presentation/manager/event_login.dart';
import 'package:e_commerce/features/auth/login/presentation/manager/login_bloc.dart';
import 'package:e_commerce/features/auth/login/presentation/manager/state_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/class/states/request_state.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailC = TextEditingController();

  TextEditingController passC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlocLogin>(
      create: (context) => BlocLogin(
          UseCaseLogin(RepoRemoteLogin(RemoteLoginDSImpl(ApiManager())))),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: SingleChildScrollView(
          child:
              BlocConsumer<BlocLogin, StateLogin>(listener: (context, state) {
            if (state.state == RequestState.loading) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Center(
                    child: CircleAvatar(),
                  ),
                  content: Text("Loading..."),
                ),
              );
            }
            if (state.state == RequestState.error) {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Center(
                    child: Icon(Icons.error_outline_outlined),
                  ),
                  content: Text("Error : ${state.error!.message}"),
                ),
              );
            }
            if (state.state == RequestState.success) {
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.home, (r) => false);
            }
          }, builder: (context, state) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 91.h,
                    ),
                    Image.asset(
                      AppImages.route,
                      height: 71.h,
                      width: 237.w,
                    ),
                    SizedBox(
                      height: 86.h,
                    ),
                    Text(
                      AppStrings.welcome,
                      style: GoogleFonts.poppins(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    Text(
                      AppStrings.loginHint,
                      style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 80.h,
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
                      height: 8.h,
                    ),
                    InkWell(
                        onTap: () {},
                        child: Text(
                          "Forget Password ?",
                          textAlign: TextAlign.end,
                          style: GoogleFonts.poppins(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        )),
                    SizedBox(
                      height: 56.h,
                    ),
                    Container(
                      height: 64.h,
                      child: ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<BlocLogin>(context)
                              .add(EventLoginEx(emailC, passC));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        child: Text("Login", style: TextStyle()),
                      ),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't Have an account?",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp,
                              color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.signUp);
                          },
                          child: Text("Create Account",
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
