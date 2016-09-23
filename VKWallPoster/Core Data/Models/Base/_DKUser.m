// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DKUser.m instead.

#import "_DKUser.h"

@implementation DKUserID
@end

@implementation _DKUser

+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"DKUser" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"DKUser";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"DKUser" inManagedObjectContext:moc_];
}

- (DKUserID*)objectID {
	return (DKUserID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"identifierValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"identifier"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic firstName;

@dynamic identifier;

- (int64_t)identifierValue {
	NSNumber *result = [self identifier];
	return [result longLongValue];
}

- (void)setIdentifierValue:(int64_t)value_ {
	[self setIdentifier:@(value_)];
}

- (int64_t)primitiveIdentifierValue {
	NSNumber *result = [self primitiveIdentifier];
	return [result longLongValue];
}

- (void)setPrimitiveIdentifierValue:(int64_t)value_ {
	[self setPrimitiveIdentifier:@(value_)];
}

@dynamic image;

@dynamic lastName;

@dynamic post;

- (NSMutableSet<DKPost*>*)postSet {
	[self willAccessValueForKey:@"post"];

	NSMutableSet<DKPost*> *result = (NSMutableSet<DKPost*>*)[self mutableSetValueForKey:@"post"];

	[self didAccessValueForKey:@"post"];
	return result;
}

@end

@implementation DKUserAttributes 
+ (NSString *)firstName {
	return @"firstName";
}
+ (NSString *)identifier {
	return @"identifier";
}
+ (NSString *)image {
	return @"image";
}
+ (NSString *)lastName {
	return @"lastName";
}
@end

@implementation DKUserRelationships 
+ (NSString *)post {
	return @"post";
}
@end

