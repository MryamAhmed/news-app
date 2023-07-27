import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../modules/webview/webView.dart';

Widget builderArticleIteam(article,context) => InkWell(
  onTap: (){
    navigateTo(context, WebView_Screen(article['url']));
  },

  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children:
      [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10,),
              image:  DecorationImage(
                  image: NetworkImage('${article['urlToImage']}'),
                  fit: BoxFit.cover
              )
          ),
        ),
        SizedBox(
          width: 20,),
        Expanded(
          child: Container(
            height: 120,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children:  [
                Expanded(
                  child: Text('${article['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${article['publishedAt']}',
                  style: TextStyle(
                      color: Colors.grey
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);

Widget articleBuilder(list,context,{isSearch = false}) => ConditionalBuilder(
  condition: list.length > 0,
  builder:(context) => ListView.separated(
      physics: BouncingScrollPhysics(),  //السحبه وانا بسكرول
      itemBuilder: (context,index) =>builderArticleIteam(list[index],context),
      separatorBuilder: (context,index) => Container(
        height: 1,
        width: double.infinity,
        color: Colors.grey[300],
      ),
      itemCount: list.length
  ),
  fallback: (context) => isSearch ?Container(): Center(child: CircularProgressIndicator()),
);

void navigateTo(context, Widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => Widget,
  ),
);


Widget defultTextFeild ({
  @required TextEditingController controller,
  @required TextInputType  type,
  @required String label,
  IconData prefix,
  @required Function  validate,
  Function  onTap,
  Function  onChange,
  bool isPasswordd = false,     //for avscure
  IconData suffix,
  Function suffixPressed,

}) => TextFormField(

  controller: controller,
  keyboardType:type,
  obscureText: isPasswordd,
  decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: label,
      prefixIcon: Icon(
          prefix
      ),

      suffixIcon: suffix !=null ? IconButton(
        onPressed:suffixPressed,
        icon:Icon(
            suffix
        ),
      ) : null
  ),

  validator: validate,
  onTap: onTap ,
  onChanged: onChange,

);