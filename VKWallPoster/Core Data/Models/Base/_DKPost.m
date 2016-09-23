// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DKPost.m instead.

#import "_DKPost.h"

@implementation DKPostID
@end

@implementation _DKPost

+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"DKPost" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"DKPost";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"DKPost" inManagedObjectContext:moc_];
}

- (DKPostID*)objectID {
	return (DKPostID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"likeCountValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"likeCount"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"repostCountValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"repostCount"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic audioDescription;

@dynamic audioName;

@dynamic image;

@dynamic likeCount;

- (int32_t)likeCountValue {
	NSNumber *result = [self likeCount];
	return [result intValue];
}

- (void)setLikeCountValue:(int32_t)value_ {
	[self setLikeCount:@(value_)];
}

- (int32_t)primitiveLikeCountValue {
	NSNumber *result = [self primitiveLikeCount];
	return [result intValue];
}

- (void)setPrimitiveLikeCountValue:(int32_t)value_ {
	[self setPrimitiveLikeCount:@(value_)];
}

@dynamic repostCount;

- (int32_t)repostCountValue {
	NSNumber *result = [self repostCount];
	return [result intValue];
}

- (void)setRepostCountValue:(int32_t)value_ {
	[self setRepostCount:@(value_)];
}

- (int32_t)primitiveRepostCountValue {
	NSNumber *result = [self primitiveRepostCount];
	return [result intValue];
}

- (void)setPrimitiveRepostCountValue:(int32_t)value_ {
	[self setPrimitiveRepostCount:@(value_)];
}

@dynamic text;

@dynamic owner;

@end

@implementation DKPostAttributes 
+ (NSString *)audioDescription {
	return @"audioDescription";
}
+ (NSString *)audioName {
	return @"audioName";
}
+ (NSString *)image {
	return @"image";
}
+ (NSString *)likeCount {
	return @"likeCount";
}
+ (NSString *)repostCount {
	return @"repostCount";
}
+ (NSString *)text {
	return @"text";
}
@end

@implementation DKPostRelationships 
+ (NSString *)owner {
	return @"owner";
}
@end

