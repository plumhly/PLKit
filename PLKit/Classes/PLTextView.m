//
//  PLTextView.m
//  TextView_placeholder
//
//  Created by plum on 2019/7/17.
//  Copyright © 2019 plum. All rights reserved.
//

#import "PLTextView.h"
@interface PLTextView()

@property (nonatomic, assign) BOOL isNeedShowPlacehoder;
@end

@implementation PLTextView

- (void)initialize {
    self.isNeedShowPlacehoder = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(editBeginning) name:UITextViewTextDidBeginEditingNotification object:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(editEnd) name:UITextViewTextDidEndEditingNotification object:self];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initialize];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self initialize];
    }
    return self;
}

- (void)editBeginning {
    self.isNeedShowPlacehoder = NO;
    [self setNeedsDisplay];
}

- (void)editEnd {
    self.isNeedShowPlacehoder = self.text.length == 0;
    [self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    if (!self.isNeedShowPlacehoder) {
        return;
    }
    if (self.placeholderAttributedString) {
        NSRange range = NSMakeRange(0, self.placeholderAttributedString.string.length);
        [self.placeholderAttributedString.string drawAtPoint:CGPointMake(12, 9) withAttributes:[self.placeholderAttributedString attributesAtIndex:0 effectiveRange: &range]];
        return;
    }
    
    [self.placeholder drawAtPoint:CGPointMake(12, 9) withAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor], NSFontAttributeName: [UIFont systemFontOfSize:12]}];

}



@end
