// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DKPost.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@class DKUser;

@interface DKPostID : NSManagedObjectID {}
@end

@interface _DKPost : NSManagedObject
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) DKPostID *objectID;

@property (nonatomic, strong, nullable) NSString* audioDescription;

@property (nonatomic, strong, nullable) NSString* audioName;

@property (nonatomic, strong, nullable) NSString* image;

@property (nonatomic, strong, nullable) NSNumber* likeCount;

@property (atomic) int32_t likeCountValue;
- (int32_t)likeCountValue;
- (void)setLikeCountValue:(int32_t)value_;

@property (nonatomic, strong, nullable) NSNumber* repostCount;

@property (atomic) int32_t repostCountValue;
- (int32_t)repostCountValue;
- (void)setRepostCountValue:(int32_t)value_;

@property (nonatomic, strong, nullable) NSString* text;

@property (nonatomic, strong, nullable) DKUser *owner;

@end

@interface _DKPost (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveAudioDescription;
- (void)setPrimitiveAudioDescription:(NSString*)value;

- (NSString*)primitiveAudioName;
- (void)setPrimitiveAudioName:(NSString*)value;

- (NSString*)primitiveImage;
- (void)setPrimitiveImage:(NSString*)value;

- (NSNumber*)primitiveLikeCount;
- (void)setPrimitiveLikeCount:(NSNumber*)value;

- (int32_t)primitiveLikeCountValue;
- (void)setPrimitiveLikeCountValue:(int32_t)value_;

- (NSNumber*)primitiveRepostCount;
- (void)setPrimitiveRepostCount:(NSNumber*)value;

- (int32_t)primitiveRepostCountValue;
- (void)setPrimitiveRepostCountValue:(int32_t)value_;

- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;

- (DKUser*)primitiveOwner;
- (void)setPrimitiveOwner:(DKUser*)value;

@end

@interface DKPostAttributes: NSObject 
+ (NSString *)audioDescription;
+ (NSString *)audioName;
+ (NSString *)image;
+ (NSString *)likeCount;
+ (NSString *)repostCount;
+ (NSString *)text;
@end

@interface DKPostRelationships: NSObject
+ (NSString *)owner;
@end

NS_ASSUME_NONNULL_END
