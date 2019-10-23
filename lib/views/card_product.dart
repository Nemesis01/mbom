/*
 * Copyright (c) 2019. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

import 'package:flutter/material.dart';
import 'package:mbom/models/product.dart';

class ProductCard extends StatelessWidget {
  //region Field(s)
  final Product product;
  //endregion

  //region Constructor(s)
  ProductCard({this.product});
  //endregion

  //region UI
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: SizedBox(
              height: 140.0,
              width: 150.0,
              child: Image.asset(
                this.product.pictures[0],
                //color: Colors.white,
                //scale: .5,
                //height: 200.0,
              ),
            ),
          ),
          Text(
            this.product.name,
            style: TextStyle(fontSize: 20.0),
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '${this.product.price} FCFA',
            style: TextStyle(fontSize: 16.0),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
  //endregion
}
