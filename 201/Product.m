//
//  Product.m
//  201
//
//  Created by SDT-1 on 2014. 1. 7..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "Product.h"

@implementation Product

//팩토리 메소드
+(id)Product:(NSString *)name price:(NSString *)price imageName:(NSString *)image
{
    Product *item = [[Product alloc]init];
    item.name = name;
    item.price = price;
    item.imageName = image;
    return item;
}

@end
