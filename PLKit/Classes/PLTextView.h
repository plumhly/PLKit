//
//  PLTextView.h
//  TextView_placeholder
//
//  Created by plum on 2019/7/17.
//  Copyright © 2019 plum. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PLTextView : UITextView

@property (nonatomic, copy) NSString *placeholder;
@property (nonatomic, copy) NSAttributedString *placeholderAttributedString;

@end

NS_ASSUME_NONNULL_END
