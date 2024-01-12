//
//  ODTVAuthProvider.m
//  Pods
//
//  Created by user1 on 2017/7/24.
//
//

#import "ODTVAuthProvider.h"

#import "ODAuthProvider+Protected.h"
#import "ODAuthHelper.h"
#import "ODAccountSession.h"

@implementation ODTVAuthProvider

- (void) authenticateWithViewController:(UIViewController *)viewController completion:(void (^)(NSError *error))completionHandler;
{
    // Get the view controller on the top of the stack
    UIViewController *presentingViewController = [[viewController childViewControllers] firstObject];
    // if the view controller's child is an ODAuthenticationViewController we just want to redirect to a new URL
    // not push another view controller
    
    completionHandler(nil);
    
    return;
}

- (void)authSucess:(NSDictionary *)responseDictionary {
    

        self.accountSession = [ODAuthHelper accountSessionWithResponse:responseDictionary serviceInfo:self.serviceInfo];
        
//        self.accountSession = [self accountSessionWithData:data response:response error:&errorTmp];
        if (self.accountSession.refreshToken){
            [self.accountStore storeCurrentAccount:self.accountSession];
        }

}
@end
