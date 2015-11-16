//
//  AislesPivotTable.h
//  iKea Shopping List
//
//  Created by Wael Showair on 2015-11-12.
//  Copyright © 2015 showair.wael@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AislesPivotTable : NSObject

-(instancetype) initWithItems: (ShoppingList *) items;

-(void) addNewAisleNumber: (NSUInteger) aisleNumber
      mappedToActualIndex: (NSUInteger) index;

- (void) removeAisleNumber: (NSUInteger) aisleNumber;

- (NSInteger) physicalSecIndexForSection: (NSUInteger) virtualSecNum;
- (NSInteger) virtualSectionForAisleNumber: (NSUInteger) aisleNum;

- (NSUInteger) aisleNumberAtVirtualIndex: (NSUInteger) sectionIndex;
- (NSUInteger) numberOfAisles;
@end