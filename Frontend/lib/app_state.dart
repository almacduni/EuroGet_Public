import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _userid = prefs.getString('ff_userid') ?? _userid;
    });
    _safeInit(() {
      _institutionid = prefs.getString('ff_institutionid') ?? _institutionid;
    });
    _safeInit(() {
      _supportEmail = prefs.getString('ff_supportEmail') ?? _supportEmail;
    });
    _safeInit(() {
      _sliderValue = prefs.getInt('ff_sliderValue') ?? _sliderValue;
    });
    _safeInit(() {
      _mandateID = prefs.getString('ff_mandateID') ?? _mandateID;
    });
    _safeInit(() {
      _installmentid = prefs.getString('ff_installmentid') ?? _installmentid;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _userid = '';
  String get userid => _userid;
  set userid(String _value) {
    _userid = _value;
    prefs.setString('ff_userid', _value);
  }

  String _institutionid = '';
  String get institutionid => _institutionid;
  set institutionid(String _value) {
    _institutionid = _value;
    prefs.setString('ff_institutionid', _value);
  }

  String _customerid = '';
  String get customerid => _customerid;
  set customerid(String _value) {
    _customerid = _value;
  }

  String _countryCode = '';
  String get countryCode => _countryCode;
  set countryCode(String _value) {
    _countryCode = _value;
  }

  String _supportEmail = '';
  String get supportEmail => _supportEmail;
  set supportEmail(String _value) {
    _supportEmail = _value;
    prefs.setString('ff_supportEmail', _value);
  }

  int _sliderValue = 0;
  int get sliderValue => _sliderValue;
  set sliderValue(int _value) {
    _sliderValue = _value;
    prefs.setInt('ff_sliderValue', _value);
  }

  String _mandateID = '';
  String get mandateID => _mandateID;
  set mandateID(String _value) {
    _mandateID = _value;
    prefs.setString('ff_mandateID', _value);
  }

  String _installmentid = '';
  String get installmentid => _installmentid;
  set installmentid(String _value) {
    _installmentid = _value;
    prefs.setString('ff_installmentid', _value);
  }

  String _firstName = '';
  String get firstName => _firstName;
  set firstName(String _value) {
    _firstName = _value;
  }

  String _lastName = '';
  String get lastName => _lastName;
  set lastName(String _value) {
    _lastName = _value;
  }

  bool _isReviewed = false;
  bool get isReviewed => _isReviewed;
  set isReviewed(bool _value) {
    _isReviewed = _value;
  }

  String _bankIban = '';
  String get bankIban => _bankIban;
  set bankIban(String _value) {
    _bankIban = _value;
  }

  String _bankLink = '';
  String get bankLink => _bankLink;
  set bankLink(String _value) {
    _bankLink = _value;
  }

  String _kycLink = '';
  String get kycLink => _kycLink;
  set kycLink(String _value) {
    _kycLink = _value;
  }

  String _agreementid = '';
  String get agreementid => _agreementid;
  set agreementid(String _value) {
    _agreementid = _value;
  }

  String _requisitionid = '';
  String get requisitionid => _requisitionid;
  set requisitionid(String _value) {
    _requisitionid = _value;
  }

  String _mediaUrl = '';
  String get mediaUrl => _mediaUrl;
  set mediaUrl(String _value) {
    _mediaUrl = _value;
  }

  int _nps = 0;
  int get nps => _nps;
  set nps(int _value) {
    _nps = _value;
  }

  int _overdraftimit = 0;
  int get overdraftimit => _overdraftimit;
  set overdraftimit(int _value) {
    _overdraftimit = _value;
  }

  String _loanType = '';
  String get loanType => _loanType;
  set loanType(String _value) {
    _loanType = _value;
  }

  String _loanChargeDate = '';
  String get loanChargeDate => _loanChargeDate;
  set loanChargeDate(String _value) {
    _loanChargeDate = _value;
  }

  String _paymentid = '';
  String get paymentid => _paymentid;
  set paymentid(String _value) {
    _paymentid = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
