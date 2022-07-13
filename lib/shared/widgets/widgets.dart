import 'package:flutter/material.dart';

import '../components/components.dart';

/*
*
*
*
* */

class RebiLoadingWidget extends StatelessWidget {
  const RebiLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class RebiEmptyWidget extends StatelessWidget {
  const RebiEmptyWidget({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(title ?? 'لا يوجد عناصر حالياً'));
  }
}

class RebiErrorWidget extends StatelessWidget {
  const RebiErrorWidget({Key? key, this.onTap, this.errorText})
      : super(key: key);
  final VoidCallback? onTap;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'عذراً, حدث خطأ',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 10.0,
            ),
            if (errorText != null)
              Text(
                errorText!,
                textAlign: TextAlign.center,
              ),
            const SizedBox(
              height: 60.0,
            ),
            if (onTap != null)
              rebiButton(onPressed: onTap!, text: 'إعادة المحاولة'),
          ],
        ),
      ),
    );
  }
}

/**
 *
 *
 *
 * */
