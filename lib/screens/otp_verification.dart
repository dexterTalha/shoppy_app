import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';

class OtpVerification extends StatefulWidget {
  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {

  bool otp_filled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Colors.grey),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0),
            child: Card(
              elevation: 6,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Enter your OTP received",style: TextStyle(
                          fontFamily: 'SFUIDisplay',
                          color: Colors.black,
                          fontSize: 18,
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    PinEntryTextField(
                      fontSize: 16,
                      fieldWidth: MediaQuery.of(context).size.width * 0.2,
                      fields: 6,
                      showFieldAsBox: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 25.0, left: 25.0),
                      child: MaterialButton(
                        onPressed: () {
                          if(!otp_filled){
                            Fluttertoast.showToast(msg: "Please fill otp", gravity: ToastGravity.CENTER);
                          }
                        }, //since this is only a UI app
                        child: Text(
                          'Verify OTP',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'SFUIDisplay',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: Color(0xffff2d55),
                        elevation: 0,
                        minWidth: 400,
                        height: 50,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Resend OTP?",
                        style: TextStyle(
                          fontFamily: 'SFUIDisplay',
                          color: Color(0xffff2d55),
                          fontSize: 15,
                        ))
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
