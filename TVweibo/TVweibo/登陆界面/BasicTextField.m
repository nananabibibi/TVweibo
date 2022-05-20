//
//  BasicTextField.m
//  TVweibo
//
//  Created by Admin on 2022/5/13.
//

#import "BasicTextField.h"

@implementation BasicTextField

//  重写 leftView 的 X 值
- ( CGRect )leftViewRectForBounds:( CGRect )bounds{
    CGRect iconRect = [ super leftViewRectForBounds :bounds];
    iconRect. origin . x += 10 ;
    return iconRect;
}

//  重写占位符的 x 值
- ( CGRect )placeholderRectForBounds:( CGRect )bounds{
    CGRect placeholderRect = [ super placeholderRectForBounds :bounds];
    placeholderRect. origin . x += 1 ;
    return placeholderRect;
}

//  重写文字输入时的 x 值
- ( CGRect )editingRectForBounds:( CGRect )bounds{
    CGRect editingRect = [ super editingRectForBounds :bounds];
    editingRect. origin . x += 20 ;
    return editingRect;
}

//  重写文字显示时的 x 值
- ( CGRect )textRectForBounds:( CGRect )bounds{
    CGRect textRect = [ super editingRectForBounds :bounds];
    textRect.origin.x += 20;
    return textRect;
}


@end
