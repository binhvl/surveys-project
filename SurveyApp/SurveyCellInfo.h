#import <UIKit/UIKit.h>
#import "SAHotelInfo.h"
@interface SurveyCellInfo : UITableViewCell

-(id)initCellFromNib;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UITextView *tvDescription;
@property (weak, nonatomic) IBOutlet UIImageView *imvHotel;
/**
 *  Set data for cell
 *
 *  @param hotelInfo hotelInfo
 */
-(void)setDataForCell:(SAHotelInfo *)hotelInfo;
@end
