// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DKUser.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@class DKPost;

@interface DKUserID : NSManagedObjectID {}
@end

@interface _DKUser : NSManagedObject
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) DKUserID *objectID;

@property (nonatomic, strong, nullable) NSString* firstName;

@property (nonatomic, strong, nullable) NSNumber* identifier;

@property (atomic) int64_t identifierValue;
- (int64_t)identifierValue;
- (void)setIdentifierValue:(int64_t)value_;

@property (nonatomic, strong, nullable) NSString* image;

@property (nonatomic, strong, nullable) NSString* lastName;

@property (nonatomic, strong, nullable) NSSet<DKPost*> *post;
- (nullable NSMutableSet<DKPost*>*)postSet;

@end

@interface _DKUser (PostCoreDataGeneratedAccessors)
- (void)addPost:(NSSet<DKPost*>*)value_;
- (void)removePost:(NSSet<DKPost*>*)value_;
- (void)addPostObject:(DKPost*)value_;
- (void)removePostObject:(DKPost*)value_;

@end

@interface _DKUser (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveFirstName;
- (void)setPrimitiveFirstName:(NSString*)value;

- (NSNumber*)primitiveIdentifier;
- (void)setPrimitiveIdentifier:(NSNumber*)value;

- (int64_t)primitiveIdentifierValue;
- (void)setPrimitiveIdentifierValue:(int64_t)value_;

- (NSString*)primitiveImage;
- (void)setPrimitiveImage:(NSString*)value;

- (NSString*)primitiveLastName;
- (void)setPrimitiveLastName:(NSString*)value;

- (NSMutableSet<DKPost*>*)primitivePost;
- (void)setPrimitivePost:(NSMutableSet<DKPost*>*)value;

@end

@interface DKUserAttributes: NSObject 
+ (NSString *)firstName;
+ (NSString *)identifier;
+ (NSString *)image;
+ (NSString *)lastName;
@end

@interface DKUserRelationships: NSObject
+ (NSString *)post;
@end

NS_ASSUME_NONNULL_END
