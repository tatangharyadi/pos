import 'package:flutter/material.dart';
import 'package:pos/components/member_dialog/member_dialog.dart';
import 'package:pos/consts/member_filter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MemberBar extends ConsumerWidget {
  const MemberBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<MemberFilter> memberFilters = MemberFilter.categoryFilters;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: memberFilters.length,
        itemBuilder: (context, index) {
          MemberFilter memberFilter = memberFilters[index];
          return GestureDetector(
            onTap: () {
              switch (memberFilter.filter) {
                case 'BARCODE':
                  showGeneralDialog(
                    context: context,
                    pageBuilder: (context, animation, secondaryAnimation) {
                          return const MemberDialog();
                    },
                  );
                  break;
                default:
              }
            },
            child: SizedBox(
              width: memberFilter.width,
              child: ListTile(
                leading: Icon(memberFilter.icon),
                title: Text(memberFilter.name),
                dense: true,
              ),
            ),
          );
        },
      ),
    );
  }
}
