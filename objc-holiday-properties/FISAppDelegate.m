//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //self.database;
    return YES;
}

- (NSArray *)holidaysInSeason:(NSString *)season
{
    NSArray *holidays = [self.database[season] allKeys];
    return holidays;
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season
{
    NSMutableArray *supplies = self.database[season][holiday];
    return supplies;
}

- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season
{
    if ([self.database[season] objectForKey: holiday])
    {
        return true;
    }
    else
    {
        return false;
    }
    
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season
{
    if ([self.database[season][holiday] containsObject:supply])
    {
        return true;
    }
    else
    {
        return false;
    }
    
}

- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season
{
    [self.database[season] setValue:@"" forKey:holiday];
    // no return
}

- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season
{
    [self.database[season] setValue:supply forKey:holiday];
    // no return
}

@end
