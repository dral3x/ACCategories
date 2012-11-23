//
//  UIDevice+ACDeviceRecognition.h
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

@interface UIDevice (ACDeviceRecognition)

- (NSString *)platform;
- (NSString *)platformDescription;

- (BOOL)isIPad;
- (BOOL)isIPhone;
- (BOOL)isIPod;
- (BOOL)isSimulator;

- (CGFloat)iOSversion;

@end




@interface UIDevice (ACFeatureDetection)

- (BOOL)hasRetinaDisplay;
- (BOOL)hasMultitasking;

- (BOOL)isAACHardwareEncoderAvailable;

- (BOOL)hasARMv6;
- (BOOL)hasARMv7;
- (BOOL)hasARMv7s;

@end



// macros for quick access on UIDevice properties
#define DEVICE_IS_IPHONE    ([[UIDevice currentDevice] isIPhone])
#define DEVICE_IS_IPOD      ([[UIDevice currentDevice] isIPod])
#define DEVICE_IS_IPAD      ([[UIDevice currentDevice] isIPad])
#define DEVICE_IS_SIMULATOR ([[UIDevice currentDevice] isSimulator])

#define DEVICE_WITH_IOS_6_0_OR_GREATER  ([[UIDevice currentDevice] iOSversion] >= 6.0f)
#define DEVICE_WITH_IOS_LESS_THAN_6_0   ([[UIDevice currentDevice] iOSversion] < 6.0f)

#define DEVICE_WITH_IOS_5_1_OR_GREATER  ([[UIDevice currentDevice] iOSversion] >= 5.1f)
#define DEVICE_WITH_IOS_5_0_OR_GREATER  ([[UIDevice currentDevice] iOSversion] >= 5.0f)
#define DEVICE_WITH_IOS_LESS_THAN_5_0   ([[UIDevice currentDevice] iOSversion] < 5.0f)

#define DEVICE_WITH_ARMv6   ([[UIDevice currentDevice] hasARMv6])
#define DEVICE_WITH_ARMv7   ([[UIDevice currentDevice] hasARMv7])
#define DEVICE_WITH_ARMv7s  ([[UIDevice currentDevice] hasARMv7s])




