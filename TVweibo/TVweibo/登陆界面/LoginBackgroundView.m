//
//  LoginBackgroundView.m
//  TVweibo
//
//  Created by Admin on 2022/5/13.
//

#import "LoginBackgroundView.h"
#define mianBodyColor(r, g, b) [UIColor colorWithRed:r/ 255.0f green:g/ 255.0f blue:b/ 255.0f alpha: 1 ]

@implementation LoginBackgroundView

-( void )drawRect:( CGRect )rect{
    CGContextRef context = UIGraphicsGetCurrentContext ();
    CGContextSetLineWidth (context, 0.7 );
    CGContextBeginPath (context);
    CGContextMoveToPoint (context, 0 , 40 );
    CGContextAddLineToPoint (context, self . frame . size . width , 40 );
    CGContextClosePath (context);
    [ mianBodyColor ( 207 , 207 , 207 ) setStroke ];
    CGContextStrokePath (context);
}

@end
