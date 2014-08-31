//
//  JWMTAClient.h
//  Pods
//
//  Created by Jerry Wong on 8/30/14.
//
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef NS_OPTIONS(int, JWMTAClientFeed) {
    JWMTAClientFeedSubwaySchedule =         1 << 0,
    JWMTAClientFeedBusScheduleBronx =       1 << 1,
    JWMTAClientFeedBusScheduleBrooklyn =    1 << 2,
    JWMTAClientFeedBusScheduleManhattan =   1 << 3,
    JWMTAClientFeedBusScheduleQueens =      1 << 4,
    JWMTAClientFeedBusScheduleStatenIsland = 1 << 5,
    JWMTAClientFeedLIRRSchedule =           1 << 6,
    JWMTAClientFeedMetroNorthSchedule =     1 << 7,
    JWMTAClientFeedRealTimeBus =            1 << 8,
    JWMTAClientFeedRealTimeDivisionA =      1 << 9,
    JWMTAClientFeedRealTimeCanarsie =       1 << 10,
    JWMTAClientFeedRealTimeSIR =            1 << 11
};

@interface JWMTAClient : AFHTTPRequestOperationManager

- (id)initWithFeed:(JWMTAClientFeed)feed andKey:(NSString *)apiKey;

@end
