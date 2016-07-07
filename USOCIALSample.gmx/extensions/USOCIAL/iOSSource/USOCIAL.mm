#import "USOCIAL.h"

@implementation USOCIAL

const int EVENT_OTHER_SOCIAL = 70;
extern int CreateDsMap( int _num, ... );
extern void CreateAsynEventWithDSMap(int dsmapindex, int event_index);

- (BOOL) onOpenURL:(NSURL*)url sourceApplication:(NSString*)sourceApplication
{
    NSString * query = [url query];
    NSArray * queryComponents = [query componentsSeparatedByString:@"&"];
    
    NSString * token;
    NSString * verifier;
    
    for (NSString * parameterStr in queryComponents) {
        NSArray * parameter = [parameterStr componentsSeparatedByString:@"="];
        if ([[parameter objectAtIndex:0] isEqualToString:@"token"]) {
            token = [parameter objectAtIndex:1];
        } else if ([[parameter objectAtIndex:0] isEqualToString:@"verifier"]) {
            verifier = [parameter objectAtIndex:1];
        }
    }
    
    CreateAsynEventWithDSMap(CreateDsMap(3,
        "type", 0.0, "USOCIAL_LOGIN",
        "token", 0.0, [token UTF8String],
        "verifier", 0.0, [verifier UTF8String]
    ), EVENT_OTHER_SOCIAL);
    
    return YES;
}

@end