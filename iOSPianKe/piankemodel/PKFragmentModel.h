#import <UIKit/UIKit.h>

//请求成功后的第一层数据
@interface PKFragmentData : NSObject

@property (nonatomic, strong) NSArray * list;
@property (nonatomic, strong) NSObject * tagOffical;
@property (nonatomic, assign) NSInteger total;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end





//成功后返回的数据
@interface PKFragmentModel : NSObject

@property (nonatomic, strong) PKFragmentData * data;
@property (nonatomic, assign) NSInteger result;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end




//收藏数与喜欢数
@interface PKFragmentCounterList : NSObject

@property (nonatomic, assign) NSInteger comment;
@property (nonatomic, assign) NSInteger like;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end





@interface PKFragmentTagInfo : NSObject

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) BOOL offical;
@property (nonatomic, strong) NSString * tag;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end




//发布碎片的用户id，名字，图标
@interface PKFragmentUserinfo : NSObject

@property (nonatomic, strong) NSString * icon;
@property (nonatomic, assign) NSInteger uid;
@property (nonatomic, strong) NSString * uname;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end





//碎片描述信息，如图片大小
@interface PKFragmentList : NSObject

@property (nonatomic, assign) NSInteger addtime;
@property (nonatomic, strong) NSString * addtimeF;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) NSString * contentid;
@property (nonatomic, strong) PKFragmentCounterList * counterList;
@property (nonatomic, strong) NSString * coverimg;//图片路径
@property (nonatomic, strong) NSString * coverimgWh;//图片尺寸
@property (nonatomic, assign) BOOL islike;//是否喜欢
@property (nonatomic, strong) NSString * songid;
@property (nonatomic, strong) PKFragmentTagInfo * tagInfo;
@property (nonatomic, strong) PKFragmentUserinfo * userinfo;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end