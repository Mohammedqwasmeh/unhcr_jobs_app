import 'package:unhcr_jobs_app/core/constant/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {
  static Future<void> showToast({
    required String msg,
  }) async {
    await Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: AppColors.turquoise[900],
    );
  }
}
