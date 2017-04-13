//
//  LTTimer.m
//  Pods
//
//  Created by 冰凌天 on 2017/4/13.
//
//

#import "LTTimer.h"

@interface LTTimer ()

/** 定时器 */
@property (nonatomic, strong) NSTimer *timer;

/** 方法 */
@property (nonatomic, assign) SEL aSelector;

/** 对象 */
@property (nonatomic, weak) id aTarget;

@end

@implementation LTTimer

+ (instancetype)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)yesOrNo
{
    LTTimer *timer = [self new];
    timer.aSelector = aSelector;
    timer.aTarget = aTarget;
    
    timer.timer = [NSTimer scheduledTimerWithTimeInterval:ti target:timer selector:@selector(timerEvent:) userInfo:userInfo repeats:yesOrNo];
    [[NSRunLoop currentRunLoop] addTimer:timer.timer forMode:NSRunLoopCommonModes];
    return timer;
}

- (void)timerEvent:(NSTimer *)timer
{
    if (_aSelector && _aTarget) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [_aTarget performSelector:_aSelector withObject:timer];
#pragma clang diagnostic pop
    }else {
        [_timer invalidate];
    }
}

- (void)invalidate
{
    [_timer invalidate];
    _timer = nil;
}


@end















