import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/cubit/news/news_cubit.dart';

import '../widgets/builder_ui.dart';

class BusinessPage extends StatelessWidget {
  const BusinessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
  builder: (context, state) {
    return ListView.separated(
        separatorBuilder: (context, index)=>SizedBox(height: 10,),
        itemCount: NewsCubit.get(context).businessList.length,

      itemBuilder: (context, index)=> BuilderUi(articles:
      NewsCubit.get(context).businessList[index] ,),
    );
  },
);
  }
}
