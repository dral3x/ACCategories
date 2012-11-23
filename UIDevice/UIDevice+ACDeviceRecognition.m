//
//  UIDevice+ACDeviceRecognition.m
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

#import "UIDevice+ACDeviceRecognition.h"

#include <sys/types.h>
#include <sys/sysctl.h>

@implementation UIDevice (ACDeviceRecognition)

- (NSString *)platform
{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    free(machine);
    return platform;
}

- (NSString *)platformDescription
{
    NSString *platform = [self platform];
    
    // iPhone
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"])    return @"iPhone 4 (CDMA)";
    
    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4s";
    
    if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (CDMA)";
    
    // iPod touch
    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod 1G";
    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod 2G";
    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod 3G";
    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod 4G";
    if ([platform isEqualToString:@"iPod5,1"])      return @"iPod 5G";
    
    // iPad
    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad 1";
    
    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2 (3G)";
    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([platform isEqualToString:@"iPad2,4"])      return @"iPad 2 (WiFi 2nd)";
    
    if ([platform isEqualToString:@"iPad2,5"])      return @"iPad mini (WiFi)";
    if ([platform isEqualToString:@"iPad2,6"])      return @"iPad mini (4G)";
    
    if ([platform isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([platform isEqualToString:@"iPad3,2"])      return @"iPad 3 (CDMA)";
    if ([platform isEqualToString:@"iPad3,3"])      return @"iPad 3 (4G)";
    
    if ([platform isEqualToString:@"iPad3,4"])      return @"iPad Retina (WiFi)";
    //if ([platform isEqualToString:@"iPad3,5"])      return @"iPad Retina (CDMA)";
    //if ([platform isEqualToString:@"iPad3,6"])      return @"iPad Retina (4G)";
    
    // simulator
    if ([platform isEqualToString:@"i386"])         return @"Simulator";
    if ([platform isEqualToString:@"x86_64"])       return @"Simulator";
    
    return platform;
}

- (BOOL)isIPad
{
    return ([[self model] hasPrefix:@"iPad"]);
}

- (BOOL)isIPhone
{
    return ([[self model] hasPrefix:@"iPhone"]);
}

- (BOOL)isIPod
{
    return ([[self model] hasPrefix:@"iPod"]);
}

- (BOOL)isSimulator
{
    return ([[self model] hasSuffix:@"Simulator"]);
}

- (CGFloat)iOSversion
{
    return [[self systemVersion] floatValue];
}

@end


#import <AudioToolbox/AudioToolbox.h>

@implementation UIDevice (ACFeatureDetection)

- (BOOL)hasMultitasking
{
    if ([self respondsToSelector:@selector(isMultitaskingSupported)])
    {
        return [self isMultitaskingSupported];
    }
    return NO;
}

- (BOOL)hasARMv6
{
    NSString *platform = [self platform];
    
    // iPhone
    if ([platform hasPrefix:@"iPhone1"])    return YES; // iPhone (original) & iPhone 3G
    
    // iPod
    if ([platform hasPrefix:@"iPod1"])      return YES;
    if ([platform hasPrefix:@"iPod2"])      return YES;
    
    return NO;
}

- (BOOL)hasARMv7
{
    NSString *platform = [self platform];
    
    // iPhone
    if ([platform hasPrefix:@"iPhone2"])    return YES; // iPhone 3Gs
    if ([platform hasPrefix:@"iPhone3"])    return YES; // iPhone 4
    if ([platform hasPrefix:@"iPhone4"])    return YES; // iPhone 4s
    
    // iPod
    if ([platform hasPrefix:@"iPod3"])      return YES;
    if ([platform hasPrefix:@"iPod4"])      return YES;
    
    // iPad
    if ([platform hasPrefix:@"iPad1"])      return YES;
    if ([platform hasPrefix:@"iPad2"])      return YES; // iPad 2 (WiFi, 3G, CDMA), iPad mini
    if ([platform hasPrefix:@"iPad3,1"])    return YES; // iPad 3 (WiFi)
    if ([platform hasPrefix:@"iPad3,2"])    return YES; // iPad 3 (CDMA)
    if ([platform hasPrefix:@"iPad3,3"])    return YES; // iPad 3 (4G)
    
    return NO;
}

- (BOOL)hasARMv7s
{
    NSString *platform = [self platform];
    
    // iPhone
    if ([platform hasPrefix:@"iPhone5"])    return YES; // iPhone 5

    // iPod
    if ([platform hasPrefix:@"iPod5"])      return YES;
    
    // iPad
    if ([platform hasPrefix:@"iPad3,4"])    return YES; // iPad 4 (Retina)
    
    return NO;
}

- (BOOL)hasRetinaDisplay
{
    NSString *platform = [self platform];
    
    // iPhone
    if ([platform hasPrefix:@"iPhone1"])    return NO; // iPhone (original) & iPhone 3G
    if ([platform hasPrefix:@"iPhone2"])    return NO; // iPhone 3Gs
    
    // iPod touch
    if ([platform hasPrefix:@"iPod1"])      return NO; // iPod 1G
    if ([platform hasPrefix:@"iPod2"])      return NO; // iPod 2G
    if ([platform hasPrefix:@"iPod3"])      return NO; // iPod 3G
    
    // iPad
    if ([platform hasPrefix:@"iPad1"])      return NO; // iPad 1
    if ([platform hasPrefix:@"iPad2"])      return NO; // iPad 2 (WiFi, 3G, CDMA), iPad mini
    
    return YES;
}

- (BOOL)isAACHardwareEncoderAvailable
{
    
    // AAC (MPEG-4 Advanced Audio Coding) hardware-assisted encoding is supported
    // starting in iOS 3.1 for iPhone 3GS and iPod touch (2nd generation)
    // starting in iOS 3.2 for iPad
    // http://developer.apple.com/library/ios/#documentation/AudioVideo/Conceptual/MultimediaPG/UsingAudio/UsingAudio.html
    
    Boolean isAvailable = false;
    
    // get an array of AudioClassDescriptions for all installed encoders for the given format
    // the specifier is the format that we are interested in - this is 'aac ' in our case
    UInt32 encoderSpecifier = kAudioFormatMPEG4AAC;
    UInt32 size;
    
    OSStatus result = AudioFormatGetPropertyInfo(kAudioFormatProperty_Encoders, sizeof(encoderSpecifier), &encoderSpecifier, &size);
    if (result) { printf("AudioFormatGetPropertyInfo kAudioFormatProperty_Encoders result %lu %4.4s\n", result, (char*)&result); return false; }
    
    UInt32 numEncoders = size / sizeof(AudioClassDescription);
    AudioClassDescription encoderDescriptions[numEncoders];
    
    result = AudioFormatGetProperty(kAudioFormatProperty_Encoders, sizeof(encoderSpecifier), &encoderSpecifier, &size, encoderDescriptions);
    if (result) { printf("AudioFormatGetProperty kAudioFormatProperty_Encoders result %lu %4.4s\n", result, (char*)&result); return false; }
    
    for (UInt32 i=0; i < numEncoders; ++i)
    {
        if (encoderDescriptions[i].mSubType == kAudioFormatMPEG4AAC &&
            encoderDescriptions[i].mManufacturer == kAppleHardwareAudioCodecManufacturer)
            isAvailable = true;
    }
    
    return isAvailable;
}

@end
