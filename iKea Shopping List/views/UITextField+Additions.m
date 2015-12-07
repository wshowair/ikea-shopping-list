//
//  UITextField+Additions.m
//  iKea Shopping List
//
//  Created by Wael Showair on 2015-12-06.
//  Copyright © 2015 showair.wael@gmail.com. All rights reserved.
//

#import "UITextField+Additions.h"

@implementation UITextField (Additions)

#define BACKGROUND_ERR_COLOR_R  1.0f
#define BACKGROUND_ERR_COLOR_G  0.84f /* 215/255 */
#define BACKGROUND_ERR_COLOR_B  0.84f /* 215/255 */
#define BACKGROUND_ERR_COLOR_A  0.3f

#define BACKGROUND_VALID_COLOR_R  0.84f /* 215/255 */
#define BACKGROUND_VALID_COLOR_G  1.0f
#define BACKGROUND_VALID_COLOR_B  0.84f /* 215/255 */
#define BACKGROUND_VALID_COLOR_A  0.3f

#define BORDER_WIDTH          1.0f
#define BORDER_CORNER_RADIUS  5.0f



-(void) displayErrorIndicators{
    self.layer.borderWidth = BORDER_WIDTH;
    self.layer.borderColor = [[UIColor redColor] CGColor];
    self.layer.cornerRadius = BORDER_CORNER_RADIUS;

    [self setBackgroundColor:[UIColor colorWithRed:BACKGROUND_ERR_COLOR_R
                                                  green:BACKGROUND_ERR_COLOR_G
                                                   blue:BACKGROUND_ERR_COLOR_B
                                                  alpha:BACKGROUND_ERR_COLOR_A]];
}
-(void) removeErrorIndicators{
    self.layer.borderWidth = 0;
    self.layer.borderColor = [[UIColor blackColor] CGColor];
    self.layer.cornerRadius = 0;
    self.backgroundColor = nil;
}

-(void) displayErrorMessage: (NSString*) message{
    
    UITextField* textField = self;
    NSString* constraintExpression, *leadingConstraintsExpression;
    NSDictionary* viewsDictionary;
    NSArray* verticalConstraints, *leadingConstraints;
    
    UILabel* errorMsgLabel = [[UILabel alloc] init];
    errorMsgLabel.text = message;
    errorMsgLabel.textColor = [UIColor redColor];
    errorMsgLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
    
    errorMsgLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    viewsDictionary  = NSDictionaryOfVariableBindings(textField,errorMsgLabel);
    
    constraintExpression = @"V:[textField]-8-[errorMsgLabel]";
    verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:constraintExpression options:0 metrics:nil views:viewsDictionary];
    
    leadingConstraintsExpression = @"V:[textField][errorMsgLabel]";
    
    leadingConstraints = [NSLayoutConstraint constraintsWithVisualFormat:leadingConstraintsExpression options:NSLayoutFormatAlignAllLeading metrics:nil views:viewsDictionary];
    
    /* Add the UILabel view to the root view. */
    [textField.superview addSubview:errorMsgLabel];
    
    /* Add the constraints. */
    [self.superview addConstraints:verticalConstraints];
    [self.superview addConstraints:leadingConstraints];
    
}

-(void) removeErrorMessage{
    
}

@end