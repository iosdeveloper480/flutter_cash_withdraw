import 'package:cash_withdraw/models/ServicesModel.dart';
import 'package:cash_withdraw/models/TransactionModel.dart';

final List<ServicesModel> services = [
  ServicesModel(id: "1", name: "Cash Withdraw", image: "icon_cash_withdraw"),
  ServicesModel(id: "2", name: "Onboarding", image: "icon_onboarding"),
  ServicesModel(
      id: "3", name: "Mobile recharge", image: "icon_mobile_recharge"),
  ServicesModel(
      id: "4", name: "Mobile postpaid", image: "icon_mobile_postpaid"),
  ServicesModel(id: "5", name: "NOL Card", image: "icon_nol_card"),
  ServicesModel(id: "6", name: "Salik", image: "icon_salik"),
  ServicesModel(id: "7", name: "Electricity", image: "icon_electricity"),
  ServicesModel(
    id: "8",
    name: "International bill payments",
    image: "icon_international_bill_payments",
  ),
  ServicesModel(
      id: "9", name: "Track Transaction", image: "icon_track_transaction"),
  ServicesModel(id: "10", name: "FX Card", image: "icon_fx_card"),
];

final List<TransactionModel> allTransactions = [
  TransactionModel(
    id: "0",
    name: "Mahaboob Ibrahim",
    image: "image",
    date: "Today",
    currentCurrency: "AED",
    currentAmount: "220.93",
    otherCurrency: "INR",
    otherAmount: "5000.00",
  ),
  TransactionModel(
    id: "2",
    name: "Multiplex Hypermarket",
    image: "image",
    date: "Today",
    currentCurrency: "AED",
    currentAmount: "185.87",
    otherCurrency: "",
    otherAmount: "",
  ),
  TransactionModel(
    id: "3",
    name: "Viva Pharmacy",
    image: "image",
    date: "Today",
    currentCurrency: "AED",
    currentAmount: "100",
    otherCurrency: "INR",
    otherAmount: "200",
  ),
  TransactionModel(
    id: "4",
    name: "Shazia Hussain",
    image: "image",
    date: "Yesterday",
    currentCurrency: "AED",
    currentAmount: "100",
    otherCurrency: "INR",
    otherAmount: "200",
  ),
  TransactionModel(
    id: "5",
    name: "Economic Homeo Store",
    image: "image",
    date: "Yesterday",
    currentCurrency: "AED",
    currentAmount: "100",
    otherCurrency: "INR",
    otherAmount: "200",
  ),
  TransactionModel(
    id: "6",
    name: "Economic Homeo Store",
    image: "image",
    date: "Yesterday",
    currentCurrency: "AED",
    currentAmount: "100",
    otherCurrency: "INR",
    otherAmount: "200",
  ),
  TransactionModel(
    id: "7",
    name: "Economic Homeo Store",
    image: "image",
    date: "Yesterday",
    currentCurrency: "AED",
    currentAmount: "100",
    otherCurrency: "INR",
    otherAmount: "200",
  ),
];
