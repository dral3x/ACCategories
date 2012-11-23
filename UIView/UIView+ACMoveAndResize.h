//
//  UIView+ACMoveAndResize.h
//
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

#import <UIKit/UIKit.h>

@interface UIView (ACMove)

/**
 * Move the view
 */
- (void)moveDown:(CGFloat)move;
- (void)moveUp:(CGFloat)move;
- (void)moveLeft:(CGFloat)move;
- (void)moveRight:(CGFloat)move;
- (void)moveToY:(CGFloat)y_position;
- (void)moveToX:(CGFloat)x_position;

@end


@interface UIView (ACResize)

/**
 * Resize the view
 */
- (void)resizeWidth:(CGFloat)newWidth;
- (void)resizeHeight:(CGFloat)newHeight;
- (void)resizeToWidth:(CGFloat)newWidth;
- (void)resizeToHeight:(CGFloat)newHeight;

@end
