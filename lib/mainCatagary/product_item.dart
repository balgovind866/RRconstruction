
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Productitem extends StatelessWidget {
  final dynamic product;
  const Productitem( {Key? key, this.product }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              Container(
                constraints: BoxConstraints(
                  maxHeight: 225.h,
                  maxWidth: 325.w,
                ),
                child: Image(
                    image: NetworkImage(product
                    ['proimages'][0])),
              ),
              Text(
                product['prodesc'],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product['price']//product change in snapshot.data!.docs[index]
                        .toStringAsFixed(2) +
                        ('\₹'),
                    style: TextStyle(
                        color: Colors.red.shade600,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border_outlined,
                      size: 30,
                    ),
                    color: Colors.red,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}