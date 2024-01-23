




import 'package:bloct_training/constants/my_colors.dart';
import 'package:bloct_training/data/models/model.dart';
import 'package:flutter/material.dart';

class FilmItem extends StatelessWidget {
  const FilmItem({super.key, required this.films});
  final Results films;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColors.myGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        footer: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text(films.name.toString(),
          style: const TextStyle(
            fontSize: 16,
            color: MyColors.myWhite,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,
          ),
        ),
        child:Container(
          color: MyColors.myGrey,
          child: films.image!.isNotEmpty?
          FadeInImage.assetNetwork(
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            placeholder: 'assets/image/loading.gif', 
            image: films.image!) 
            : Image.asset('assets/image/empty.png') ,
        ) ,
        ),
    );
  }
}