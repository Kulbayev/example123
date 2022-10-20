import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List products = [
    'Сегодня президент Касым-Жомарт Токаев прибыл с рабочей поездкой в Жетысускую область, где провел встречу с общественностью региона. Слова из выступления президента опубликовал официальный Telegram-канал пресс-службы Акорды.',
    'Курс евро резко упал',
    'Разработчикам раздают Macbook'];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text('${products[index]}'),
              trailing: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 44,
                    minHeight: 44,
                    maxWidth: 64,
                    maxHeight: 64,
                  ),
                child: LikeButton(
                  size: 20,
                  circleColor: const CircleColor(
                      start: Colors.redAccent, end: Colors.red),
                  bubblesColor: const BubblesColor(
                      dotPrimaryColor: Colors.redAccent,
                      dotSecondaryColor: Colors.deepOrange),
                  likeBuilder: (bool isLiked){
                    return Icon(
                      Icons.favorite,
                      color: isLiked ? Colors.red : Colors.grey,
                      size: 20,
                    );
                  },
                  likeCount: 0,
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
