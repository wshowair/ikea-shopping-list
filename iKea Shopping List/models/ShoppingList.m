/*
 *
 *  @file ShoppingList.m
 *  implementation file that provides all the needed operations for an iKea 
 *  shopping list.
 *
 *  @author Wael Showair (showair.wael\@gmail.com)
 *  @version 0.0.1
 *  @copyright 2015. Wael Showair. All rights reserved.
 */

#import <UIKit/UIKit.h>
#import "ShoppingItem.h"
#import "ShoppingList.h"

@interface ShoppingList()

/*
 *  @property allItems
 *  @abstract private property that represents a collection of items that forms 
 *  the shopping list.
 */
@property  NSMutableArray* aisleNumbers;
@end

@implementation ShoppingList

- (instancetype)init
{
    return [self initWithTitle:@""];
}

- (instancetype)initWithTitle: (NSString*) title
{
    NSDecimalNumber* price = [NSDecimalNumber decimalNumberWithString:@"0"];
    self = [self initWithTitle:title total:price];
    return self;
}

- (instancetype)initWithTitle: (NSString*) title
                        total:(NSDecimalNumber*)total
{
    self = [super init];
    
    if (self) {
        /* initialize the title of the list. */
        self.title = title;
        
        /* Initialize the pointer to NSMutable array object. */
        self.aisleNumbers = [[NSMutableArray alloc] init];
        
        /* Initialize the total price*/
        self.totalPrice = total;
    }
    return self;
}

- (void) addNewItem: (ShoppingItem*) item
       AtAisleIndex: (NSUInteger) index
{
    NSMutableArray* array;
    if((self.aisleNumbers.count !=0 ) && (index< self.aisleNumbers.count)){
       array = self.aisleNumbers[index];
    }
    else{
        array = [[NSMutableArray alloc] init];
        [self.aisleNumbers addObject:array];
    }
        
        
    [array insertObject:item atIndex:0];
    self.totalPrice = [self.totalPrice decimalNumberByAdding:item.price];
}

- (void)removeItemAtIndex:(NSUInteger)index
{
    ShoppingItem* item = [self.aisleNumbers objectAtIndex:index];
    self.totalPrice = [self.totalPrice decimalNumberBySubtracting:item.price];
    [self.aisleNumbers removeObjectAtIndex:index];
    
}

-(ShoppingItem *)itemAtAisleIndexPath: (NSIndexPath*) indexPath{
    @try{
        return self.aisleNumbers[indexPath.section][indexPath.row];
    }
    @catch(NSException* exception){
        NSLog( @"NSException caught" );
        NSLog( @"Name: %@", exception.name);
        NSLog( @"Reason: %@", exception.reason );
        return nil;
    }
}

-(NSUInteger)numberOfAisles{
    return self.aisleNumbers.count;
}

- (NSUInteger)numberOfItemsAtAisleIndex:(NSUInteger)index{
    NSMutableArray* array =  self.aisleNumbers[index];
    return array.count;
}

- (id) getAislesCollection{
    return self.aisleNumbers;
}

@end
