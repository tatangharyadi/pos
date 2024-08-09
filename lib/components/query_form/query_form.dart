import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

FormBuilder queryForm(BuildContext context, GlobalKey<FormBuilderState> formKey, Function onPressed) {
  return FormBuilder(
    key: formKey,
    child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: FormBuilderTextField(
                name: 'query',
                decoration: const InputDecoration(
                  hintText: 'Query',
                ),
                onSubmitted: (value) => onPressed(value)
              ),
            ),
            IconButton.filledTonal(
              icon: const Icon(Icons.search),
              onPressed: (){
                FocusScope.of(context).unfocus();
                onPressed(formKey.currentState!.fields['query']!.value.toString());
              },
            )
          ],
        ),
      ],
    ),
  );
}