import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SkuPanel extends ConsumerStatefulWidget {
  
  const SkuPanel({super.key});

  @override
  ConsumerState<SkuPanel> createState() => _SkuPanelState();
}

class _SkuPanelState extends ConsumerState<SkuPanel> {
  final _formKey = GlobalKey<FormBuilderState>();  
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          FormBuilder(
            key: _formKey,
            child: Expanded(
              child: Column (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormBuilderTextField(
                    name: 'barcode',
                    decoration: const InputDecoration(
                      hintText: 'Type or scan barcode',
                    ),
                    initialValue: '',
                    onSubmitted: (value) {
                      print('OnSubmitted: $value');
                      _formKey.currentState?.reset();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
