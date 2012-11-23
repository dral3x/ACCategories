//
//  UIView+ACMoveAndResize.m
///
//  Created by Alessandro Calzavara on 23/11/12.
//
//  Copyright (c) 2012, Alessandro Calzavara
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "UIView+ACMoveAndResize.h"

@implementation UIView (ACMove)

- (void)moveDown:(CGFloat)moveDown andRight:(CGFloat)moveRight
{
    CGRect f = [self frame];
    f.origin.y += moveDown;
    f.origin.x += moveRight;
    self.frame = f;
}

- (void)moveDown:(CGFloat)move
{
    [self moveDown:move andRight:0.0];
}

- (void)moveUp:(CGFloat)move
{
    [self moveDown:-move andRight:0.0];
}

- (void)moveLeft:(CGFloat)move
{
    [self moveDown:0.0 andRight:-move];
}

- (void)moveRight:(CGFloat)move
{
    [self moveDown:0.0 andRight:move];
}

- (void)moveToY:(CGFloat)y_position
{
    CGRect f = [self frame];
    f.origin.y = y_position;
    self.frame = f;
}

- (void)moveToX:(CGFloat)x_position
{
    CGRect f = [self frame];
    f.origin.x = x_position;
    self.frame = f;
}

@end

@implementation UIView (ACResize)

- (void)resizeByWidth:(CGFloat)widthDiff andHeight:(CGFloat)heightDiff
{
    CGRect f = [self frame];
    f.size.width += widthDiff;
    f.size.height += heightDiff;
    self.frame = f;
}

- (void)resizeWidth:(CGFloat)newWidth
{
    [self resizeByWidth:newWidth andHeight:0.0];
}

- (void)resizeHeight:(CGFloat)newHeight
{
    [self resizeByWidth:0.0 andHeight:newHeight];
}

- (void)resizeToWidth:(CGFloat)newWidth
{
    CGRect f = [self frame];
    f.size.width = newWidth;
    self.frame = f;
}

- (void)resizeToHeight:(CGFloat)newHeight
{
    CGRect f = [self frame];
    f.size.height = newHeight;
    self.frame = f;
}

@end
