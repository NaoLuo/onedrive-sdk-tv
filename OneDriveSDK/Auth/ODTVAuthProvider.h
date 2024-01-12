//
//  ODTVAuthProvider.h
//  Pods
//
//  Created by user1 on 2017/7/24.
//
//

#import "ODBaseAuthProvider.h"
#import "ODPersonalAuthProvider.h"

@interface ODTVAuthProvider : ODPersonalAuthProvider


- (void)authSucess:(NSDictionary *)responseDictionary;


@end
