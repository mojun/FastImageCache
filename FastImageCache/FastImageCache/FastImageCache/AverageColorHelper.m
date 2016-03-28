//
//  AverageColorHelper.m
//  PlayZer
//
//  Created by mo jun on 3/24/16.
//  Copyright © 2016 kimoworks. All rights reserved.
//

#import "AverageColorHelper.h"
#import "MOFileUtils.h"
#import "UIColor+AverageColorConverter.h"
#import "NSString+FileMD5.h"

#define COLOR_CACHE_PATH @"COLOR_CACHE_PATH"

@implementation AverageColorHelper

+ (void)saveImageAverageColor:(UIImage *)image path:(NSString *)path {
    NSString *colorString = [UIColor averageColorStringFromImage:image];
    UIColor *color = [UIColor colorFromString:colorString];
    BOOL isDarkColor = [self isDarkColor:color];
    
    if (colorString == nil) {
        colorString = @"";
    }
    
    NSDictionary *colorInfoDictionary = @{
                                          COLOR_STRING_KEY: colorString,
                                          IS_DARK_COLOR_KEY: @(isDarkColor)
                                          };
    path = [self imagePathFromPathPath:path];
    [colorInfoDictionary writeToFile:path atomically:YES];
}

+ (NSDictionary *)averageColorInfoFromPath:(NSString *)path {
    path = [self imagePathFromPathPath:path];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:path];
    NSString *colorString = [dictionary objectForKey:COLOR_STRING_KEY];
    UIColor *color = [UIColor colorFromString:colorString];
    if (color && dictionary[IS_DARK_COLOR_KEY]) {
        return @{
                 COLOR_STRING_KEY: colorString,
                 IS_DARK_COLOR_KEY: dictionary[IS_DARK_COLOR_KEY]
                 };
    }
    
    return nil;
}

#pragma mark - private methods
+ (NSString *)imagePathFromPathPath:(NSString *)path {
    NSString *md5 = [path md5];
    return [NSString stringWithFormat:@"%@/%@", [MOFileUtils getLocalFilePath:COLOR_CACHE_PATH], md5];
}

+(BOOL)isDarkColor:(UIColor *)newColor{
    
    if (newColor) {
        const CGFloat *componentColors = CGColorGetComponents(newColor.CGColor);
        CGFloat colorBrightness = ((componentColors[0] * 299) + (componentColors[1] * 587) + (componentColors[2] * 114)) / 1000;
        if (colorBrightness < 0.5){
            return YES;
        }
        else{
            return NO;
        }
    }else{
        return NO;
    }
}

@end
