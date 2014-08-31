//
//  JWMTAClient.m
//  Pods
//
//  Created by Jerry Wong on 8/30/14.
//
//

#import "JWMTAClient.h"

@interface JWMTAClient ()
@property (nonatomic, assign) JWMTAClientFeed feed;
@property (nonatomic, strong) NSString *apiKey;
@end

@implementation JWMTAClient

+ (NSURL *)baseURLForFeed:(JWMTAClientFeed)feed {
    switch (feed) {
        case JWMTAClientFeedRealTimeDivisionA:
        case JWMTAClientFeedRealTimeCanarsie:
        case JWMTAClientFeedRealTimeSIR:
            return [NSURL URLWithString:@"http://datamine.mta.info/"];
            break;
        default:
            return nil;
            break;
    }
}

+ (BOOL)feedRequiresAuth:(JWMTAClientFeed)feed {
    switch (feed) {
        case JWMTAClientFeedRealTimeDivisionA:
        case JWMTAClientFeedRealTimeCanarsie:
        case JWMTAClientFeedRealTimeSIR:
            return YES;
            break;
        default:
            return NO;
            break;
    }
}

- (id)initWithFeed:(JWMTAClientFeed)feed andKey:(NSString *)apiKey {
    NSURL *baseURL = [JWMTAClient baseURLForFeed:feed];
    if (self = [super initWithBaseURL:baseURL]) {
        self.feed = feed;
        self.apiKey = apiKey;
        if (!baseURL) {
            @throw [NSException exceptionWithName:@"InvalidFeedException" reason:@"That feed is not supported" userInfo:nil];
        }
        if (!apiKey && [JWMTAClient feedRequiresAuth:feed]) {
            @throw [NSException exceptionWithName:@"UnauthorizedException" reason:@"This feed requires a MTA API key" userInfo:nil];
        }
    }
}

@end
