//
//  LTTimer.h
//  Pods
//
//  Created by 冰凌天 on 2017/4/13.
//
//

#import <Foundation/Foundation.h>

@interface LTTimer : NSObject

+ (instancetype)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)yesOrNo;

- (void)invalidate;

@end
