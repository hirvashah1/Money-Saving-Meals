
@class Recipe;

@interface Ingredient : NSManagedObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *amount;
@property (nonatomic, strong) Recipe *recipe;
@property (nonatomic, strong) NSNumber *displayOrder;
@property (nonatomic, strong) NSNumber *tempRecipe;


@end



