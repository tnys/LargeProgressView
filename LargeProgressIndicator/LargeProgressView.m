//
//  LargeProgressView.h
//  LargeProgressView
//
//  Created by Tom Nys on 14/02/13.
//  Copyright (c) 2013 Netwalk VOF. All rights reserved.
//

#import "LargeProgressView.h"

@interface LargeProgressView()
{
	UILabel* textLbl;
	UILabel* percentLbl;
}
@end

@implementation LargeProgressView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
				
		self.backgroundColor = [UIColor clearColor];
		textLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height - 10)];
		textLbl.font = [UIFont italicSystemFontOfSize:60];
		textLbl.backgroundColor = [UIColor clearColor];
		textLbl.shadowOffset = CGSizeMake(0, 2);
		textLbl.textColor = [UIColor whiteColor];
		textLbl.textAlignment = UITextAlignmentCenter;
		textLbl.text = @"0";
		[self addSubview:textLbl];
		
		percentLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height/3 * 2, frame.size.width, 16)];
		percentLbl.font = [UIFont italicSystemFontOfSize:14];
		percentLbl.backgroundColor = [UIColor clearColor];
		percentLbl.textColor = [UIColor grayColor];
		percentLbl.shadowOffset = CGSizeMake(0, 1);
		percentLbl.textAlignment = UITextAlignmentCenter;
		percentLbl.text = NSLocalizedString(@"% loaded", nil);
		[self addSubview:percentLbl];
		
		self.textColor = [UIColor whiteColor];
		self.inactiveColor = [UIColor colorWithWhite:.3 alpha:1.];
		self.shadowColor = [UIColor grayColor];
    }
	
    return self;
}

-(void)setProgress:(CGFloat)progress
{
	_progress = progress;
	textLbl.text = [NSString stringWithFormat:@"%.0f", _progress * 100.];
	[self setNeedsDisplay];
}

-(void)setShadowColor:(UIColor *)shadowColor
{
	_shadowColor = shadowColor;
	textLbl.shadowColor = shadowColor;
	percentLbl.shadowColor = shadowColor;
}

-(void)setTextColor:(UIColor *)textColor
{
	_textColor = textColor;
	textLbl.textColor = _textColor;
	percentLbl.textColor = _textColor;
}

-(void)setInactiveColor:(UIColor *)inactiveColor
{
	_inactiveColor = inactiveColor;
}

- (void)drawRect:(CGRect)rect
{
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	
	CGFloat lineWidth = 10.;
	CGFloat startAngle = - ((float)M_PI / 2); // 90 degrees
	CGPoint center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
	CGFloat radius = (self.bounds.size.width - lineWidth)/2;
	CGFloat endAngle = (self.progress * 2 * (float)M_PI) + startAngle;

	CGContextSaveGState(ctx);
	if (self.shadowColor)
	{
		CGContextSetShadowWithColor(ctx, CGSizeMake(0, 1), 1., self.shadowColor.CGColor);
	}
	
	UIBezierPath* outer = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(rect, lineWidth/2., lineWidth/2.)];
	[_inactiveColor setStroke];
	outer.lineWidth = lineWidth;
	outer.lineCapStyle = kCGLineCapRound;
	[outer stroke];
	CGContextRestoreGState(ctx);
	
	UIBezierPath *processPath = [UIBezierPath bezierPath];
	processPath.lineCapStyle = kCGLineCapButt;
	processPath.lineWidth = lineWidth;
	[processPath addArcWithCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
	[_textColor set];
	[processPath stroke];
}

@end
