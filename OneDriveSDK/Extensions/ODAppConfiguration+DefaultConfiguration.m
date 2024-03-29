//  Copyright 2015 Microsoft Corporation
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


#import "ODAppConfiguration+DefaultConfiguration.h"
#import "ODURLSessionManager.h"
#import "ODServiceInfoProvider.h"
#import "ODAccountStore.h"
#import "ODLogger.h"

#import "ODTVAuthProvider.h"

@implementation ODAppConfiguration (DefaultConfiguration)

+ (instancetype)defaultConfiguration
{
//    return [self defaultConfigurationTV];
    
    static ODAppConfiguration *sharedConfig = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // Default values for the shared configuration
        sharedConfig = [[ODAppConfiguration alloc] init];
        sharedConfig.httpProvider = [[ODURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        sharedConfig.serviceInfoProvider = [[ODServiceInfoProvider alloc] init];
        sharedConfig.logger = [[ODLogger alloc] initWithLogLevel:ODLogError];
        [ODAccountStore defaultAccountStore].logger = sharedConfig.logger;
        sharedConfig.accountStore = [ODAccountStore defaultAccountStore];
    });
    return sharedConfig;
}

+ (instancetype)defaultConfigurationTV
{
    static ODAppConfiguration *sharedConfig = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // Default values for the shared configuration
        sharedConfig = [[ODAppConfiguration alloc] init];
        sharedConfig.httpProvider = [[ODURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        sharedConfig.serviceInfoProvider = [[ODServiceInfoProvider alloc] init];
        sharedConfig.logger = [[ODLogger alloc] initWithLogLevel:ODLogError];
        sharedConfig.authProvider = [[ODTVAuthProvider alloc] init];
        
        [ODAccountStore defaultAccountStore].logger = sharedConfig.logger;
        sharedConfig.accountStore = [ODAccountStore defaultAccountStore];
    });
    return sharedConfig;
}
@end
