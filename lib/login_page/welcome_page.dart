import 'package:aplikasi_pemesanan_makanan/home_screen/home.dart';
import 'package:aplikasi_pemesanan_makanan/login_page/theme_shared.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final _formKey = GlobalKey<FormState>();
  bool _isHidden = true;
  bool _isHiddenEmail = true;
  bool _isHiddenPassword = true;
  bool _isHiddenConfirmPw = true;
  final _namaTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _confirmPwTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            children: [
              Image.asset(
                'assets/images/fast_food.png',
                height: 333,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Welcome',
                textAlign: TextAlign.center,
                style: welcomeTextStyle,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Pesan makanan ga perlu antri lama ',
                style: blackTextStyle.copyWith(fontSize: 20),
              ),
              const SizedBox(
                height: 51,
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width - 2 * defaultMargin,
                child: ElevatedButton(
                  onPressed: () {
                    // modal tampilan registrasi screen
                    _modalRegister();
                  },
                  child: Text(
                    'Buat Akun',
                    style: blackTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width - 2 * defaultMargin,
                child: ElevatedButton(
                  onPressed: () {
                    _modalLogin();
                  },
                  child: Text(
                    'Login',
                    style: blackTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black54),
                          borderRadius: BorderRadius.circular(15))),
                ),
              )
            ]),
      ),
    );
  }

  void _tootleUsernameView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _tootleEmailView() {
    setState(() {
      _isHiddenEmail = !_isHiddenEmail;
    });
  }

  void _tootlePasswordView() {
    setState(() {
      _isHiddenPassword = !_isHiddenPassword;
    });
  }

  void _tootleConfirmPwView() {
    setState(() {
      _isHiddenConfirmPw = !_isHiddenConfirmPw;
    });
  }

  void _modalRegister() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Form(
                key: _formKey,
                child: Wrap(
                  children: [
                    // bagian modal
                    Container(
                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                            color: modal,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40),
                                topLeft: Radius.circular(40))),
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: defaultMargin),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // jarak
                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Sikahkan',
                                        style: blackTextStyle.copyWith(
                                            fontSize: 20, color: blackColor),
                                      ),
                                      Text(
                                        'Registrasi',
                                        style: blackTextStyle.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30,
                                            color: blackColor),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Center(
                                    child: InkWell(
                                      onTap: () {
                                        // Ketika icon close ditekan
                                        Navigator.pop(context);
                                        _emailTextController.clear();
                                        _passwordTextController.clear();
                                        _namaTextController.clear();
                                        _confirmPwTextController.clear();
                                      },
                                      child: Image.asset(
                                        'assets/images/close.png',
                                        height: 30,
                                        width: 30,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              // field nama
                              TextFormField(
                                controller: _namaTextController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Nama harus diisi';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: 'Masukan Nama',
                                    labelText: 'Nama',
                                    suffixIcon: InkWell(
                                      onTap: () {},
                                      child: Icon(_isHidden
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined),
                                    )),
                              ),
                              SizedBox(height: 20),
                              // field email
                              TextFormField(
                                controller: _emailTextController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Email harus diisi';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: 'pesenmakan@gmail.com',
                                    labelText: 'Email',
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        // ketika ditekan
                                      },
                                      child: Icon(Icons.visibility),
                                    )),
                              ),
                              SizedBox(height: 20),
                              // field password
                              TextFormField(
                                controller: _passwordTextController,
                                validator: (value) {
                                  if (value!.length < 6) {
                                    return 'Password harus lebih dari 6 kata';
                                  }
                                  return null;
                                },
                                obscureText: _isHiddenPassword,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: 'Password',
                                    labelText: 'Password',
                                    suffixIcon: InkWell(
                                      onTap:
                                          // ketika ditekan
                                          _tootlePasswordView,
                                      child: Icon(_isHiddenPassword
                                          ? Icons.lock_clock_outlined
                                          : Icons.lock_clock_outlined),
                                    )),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              // field confirm
                              TextFormField(
                                controller: _confirmPwTextController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Konfirmasi password harus diisi';
                                  }
                                  if (value != _passwordTextController.text) {
                                    return 'Password tidak sesuai';
                                  }
                                  return null;
                                },
                                obscureText: _isHiddenConfirmPw,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: 'Confrim Password',
                                    labelText: 'Confirm Password',
                                    suffixIcon: InkWell(
                                      onTap:
                                          // ketika ditekan
                                          _tootleConfirmPwView,
                                      child: Icon(_isHidden
                                          ? Icons.lock_clock_outlined
                                          : Icons.lock_clock_outlined),
                                    )),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width -
                                    2 * defaultMargin,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      // Lakukan sesuatu jika formulir valid
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text(
                                              "Pesan Sukses",
                                              style: blackTextStyle,
                                            ),
                                            content: Text(
                                              "Registrasi berhasil.",
                                              style: blackTextStyle,
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    _emailTextController
                                                        .clear();
                                                    _passwordTextController
                                                        .clear();
                                                    _namaTextController.clear();
                                                    _confirmPwTextController
                                                        .clear();
                                                  },
                                                  child: Text(
                                                    "Tutup",
                                                    style:
                                                        blackTextStyle.copyWith(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Colors.white),
                                                  ),
                                                  style: ElevatedButton.styleFrom(
                                                      primary: Colors.orange,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15)))),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  },
                                  child: Text(
                                    'Registrasi',
                                    style: blackTextStyle.copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      primary: primaryColor,
                                      shape: RoundedRectangleBorder(
                                          side:
                                              BorderSide(color: Colors.black54),
                                          borderRadius:
                                              BorderRadius.circular(15))),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Sudah punya akun?',
                                    style: blackTextStyle.copyWith(
                                        color: blackColor, fontSize: 18),
                                  ),
                                  Center(
                                    child: InkWell(
                                      onTap: () {
                                        // Ketika kata login ditekan
                                        Navigator.pop(context);
                                        _modalLogin();
                                        _emailTextController.clear();
                                        _passwordTextController.clear();
                                        _namaTextController.clear();
                                        _confirmPwTextController.clear();
                                      },
                                      child: Text(
                                        'Login',
                                        style: blackTextStyle.copyWith(
                                            color: Color.fromARGB(
                                                255, 237, 124, 49),
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 25,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ));
          });
        });
  }

  void _modalLogin() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Form(
                key: _formKey,
                child: Wrap(
                  children: [
                    // bagian modal
                    Container(
                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                            color: modal,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40),
                                topLeft: Radius.circular(40))),
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: defaultMargin),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // jarak
                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Sikahkan',
                                        style: blackTextStyle.copyWith(
                                            fontSize: 20, color: blackColor),
                                      ),
                                      Text(
                                        'Login',
                                        style: blackTextStyle.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30,
                                            color: blackColor),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Center(
                                    child: InkWell(
                                      onTap: () {
                                        // Ketika icon close ditekan
                                        Navigator.pop(context);
                                        _emailTextController.clear();
                                        _passwordTextController.clear();
                                        _namaTextController.clear();
                                        _confirmPwTextController.clear();
                                      },
                                      child: Image.asset(
                                        'assets/images/close.png',
                                        height: 30,
                                        width: 30,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              // field nama

                              SizedBox(height: 20),
                              // field email
                              TextFormField(
                                controller: _emailTextController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Email harus diisi';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: 'pesenmakan@gmail.com',
                                    labelText: 'Email',
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        // ketika ditekan
                                      },
                                      child: Icon(Icons.visibility),
                                    )),
                              ),
                              SizedBox(height: 20),
                              // field password
                              TextFormField(
                                controller: _passwordTextController,
                                validator: (value) {
                                  if (value!.length < 6) {
                                    return 'Password harus diisi';
                                  }
                                  return null;
                                },
                                obscureText: _isHiddenPassword,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: 'Password',
                                    labelText: 'Password',
                                    suffixIcon: InkWell(
                                      onTap:
                                          // ketika ditekan
                                          _tootlePasswordView,
                                      child: Icon(_isHiddenPassword
                                          ? Icons.lock_clock_outlined
                                          : Icons.lock_clock_outlined),
                                    )),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              // field confirm

                              SizedBox(
                                height: 25,
                              ),
                              Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width -
                                    2 * defaultMargin,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      // Lakukan sesuatu jika formulir valid
                                      Navigator.of(context)
                                          .pop(); // Tutup modal login
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              HomePage(), //  Gantilah dengan nama kelas halaman utama Anda
                                        ),
                                      );
                                    }
                                  },
                                  child: Text(
                                    'Login',
                                    style: blackTextStyle.copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      primary: primaryColor,
                                      shape: RoundedRectangleBorder(
                                          side:
                                              BorderSide(color: Colors.black54),
                                          borderRadius:
                                              BorderRadius.circular(15))),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Belum punya akun?',
                                    style: blackTextStyle.copyWith(
                                        color: blackColor, fontSize: 18),
                                  ),
                                  Center(
                                    child: InkWell(
                                      onTap: () {
                                        // Ketika text register ditekan
                                        Navigator.pop(context);
                                        _modalRegister();
                                        _emailTextController.clear();
                                        _passwordTextController.clear();
                                        _namaTextController.clear();
                                        _confirmPwTextController.clear();
                                      },
                                      child: Text(
                                        'Registrasi',
                                        style: blackTextStyle.copyWith(
                                            color: Color.fromARGB(
                                                255, 237, 124, 49),
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 25,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ));
          });
        });
  }
}
