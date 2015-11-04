//
//  Card.h
//  
//
//  Created by libandmooc on 15/9/22.
//
//
#import <Foundation/Foundation.h>


@interface Card : NSObject
@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;
- (int)match:(NSArray *)otherCards;

@end