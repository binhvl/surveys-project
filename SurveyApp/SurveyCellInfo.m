#import "SurveyCellInfo.h"
#import "UIImageView+AFNetworking.h"
#define FULL_IMAGE 1
@implementation SurveyCellInfo

-(id)initCellFromNib{
    self = [super init];
    if(self){
        self = [[[NSBundle mainBundle] loadNibNamed:@"SurveyCellInfo"
                                              owner:self
                                            options:nil]firstObject];
    }
    [self setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height -(44+20))];
    self.imvHotel.contentMode = UIViewContentModeCenter;
    return self;
}

/**
 *  Set data fro table view cell
 *
 *  @param hotelInfo hotelInfo
 */
-(void)setDataForCell:(SAHotelInfo *)hotelInfo{
    
    // Init data is empty
    self.lblName.text       = @"";
    self.tvDescription.text = @"";
    
    // Check null object
    if(hotelInfo){
        if(self.lblName){
            self.lblName.text       = hotelInfo.title;
        }
        if(hotelInfo.descriptionInfo){
            self.tvDescription.text = hotelInfo.descriptionInfo;
        }
        if(hotelInfo.cover_image_url){
            NSString *urlImageCover = hotelInfo.cover_image_url;
            if(FULL_IMAGE){
                urlImageCover = [NSString stringWithFormat:@"%@%@",urlImageCover,@"l"];
            }
            [self.imvHotel setImageWithURL:[NSURL URLWithString:urlImageCover] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        }
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization codes
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
