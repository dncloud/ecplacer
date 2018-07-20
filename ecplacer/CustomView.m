//
//  CustomView.m
//  ecplacer
//
//  Created by Oliver Cermann on 13.07.18.
//  Copyright © 2018 Oliver Cermann. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    CGContextRef context = [[NSGraphicsContext currentContext] graphicsPort];
    
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 0.5);
    CGContextSetLineWidth(context, 40);
    CGContextMoveToPoint(context, 0, 20);
    CGContextAddLineToPoint(context, 5000, 20);
    
    CGContextDrawPath(context, kCGPathStroke);
    
    float offset_x = 2;
    float offset_y = 27;
    
    float left_x = self.left_point.x - offset_x;
    float left_y = self.left_point.y - offset_y;
    
    float right_x = self.right_point.x - offset_x;
    float right_y = self.right_point.y - offset_y;
    
    float bga_x = self.bga_point.x - offset_x;
    float bga_y = self.bga_point.y - offset_y;
    
    if (left_x <= 10000 && left_y <= 40) {
        left_x = -10;
        left_y = -10;
    }
    
    if (right_x <= 10000 && right_y <= 40) {
        right_x = -10;
        right_y = -10;
    }
    
    if (bga_x <= 0) {
        bga_x = -10000;
    }
    
    if (bga_y <= 0) {
        bga_y = -10000;
    }
    
    if (bga_x <= 10000 && bga_y <= 40) {
        bga_x = -10000;
        bga_y = -10000;
    }
    
    float crosshair_weight = 2;
    float crosshair_width = 80;
    float crosshair_spacer = 4;
    float bga_width = 5000;
    
    CGContextSetStrokeColorWithColor(context, [[NSColor yellowColor] CGColor]);
    CGContextSetLineWidth(context, crosshair_weight);
    CGContextMoveToPoint(context, left_x + crosshair_spacer, left_y);
    CGContextAddLineToPoint(context, left_x + crosshair_width, left_y);
    
    CGContextSetLineWidth(context, crosshair_weight);
    CGContextMoveToPoint(context, left_x - crosshair_spacer, left_y);
    CGContextAddLineToPoint(context, left_x - crosshair_width, left_y);
    
    CGContextSetLineWidth(context, crosshair_weight);
    CGContextMoveToPoint(context, left_x, left_y + crosshair_spacer);
    CGContextAddLineToPoint(context, left_x, left_y + crosshair_width);
    
    CGContextSetLineWidth(context, crosshair_weight);
    CGContextMoveToPoint(context, left_x, left_y - crosshair_spacer);
    CGContextAddLineToPoint(context, left_x, left_y - crosshair_width);
    
    CGContextDrawPath(context, kCGPathStroke);
    
    CGContextSetStrokeColorWithColor(context, [[NSColor redColor] CGColor]);
    CGContextSetLineWidth(context, crosshair_weight);
    CGContextMoveToPoint(context, right_x + crosshair_spacer, right_y);
    CGContextAddLineToPoint(context, right_x + crosshair_width, right_y);
    
    CGContextSetLineWidth(context, crosshair_weight);
    CGContextMoveToPoint(context, right_x - crosshair_spacer, right_y);
    CGContextAddLineToPoint(context, right_x - crosshair_width, right_y);
    
    CGContextSetLineWidth(context, crosshair_weight);
    CGContextMoveToPoint(context, right_x, right_y + crosshair_spacer);
    CGContextAddLineToPoint(context, right_x, right_y + crosshair_width);
    
    CGContextSetLineWidth(context, crosshair_weight);
    CGContextMoveToPoint(context, right_x, right_y - crosshair_spacer);
    CGContextAddLineToPoint(context, right_x, right_y - crosshair_width);
    
    CGContextDrawPath(context, kCGPathStroke);
    
    CGContextSetStrokeColorWithColor(context, [[NSColor blueColor] CGColor]);
    CGContextSetLineWidth(context, crosshair_weight);
    CGContextMoveToPoint(context, bga_x + crosshair_spacer, bga_y + crosshair_spacer);
    CGContextAddLineToPoint(context, bga_x + bga_width, bga_y + bga_width);
    
    CGContextSetLineWidth(context, crosshair_weight);
    CGContextMoveToPoint(context, bga_x - crosshair_spacer, bga_y - crosshair_spacer);
    CGContextAddLineToPoint(context, bga_x - bga_width, bga_y - bga_width);
    
    CGContextSetStrokeColorWithColor(context, [[NSColor blueColor] CGColor]);
    CGContextSetLineWidth(context, crosshair_weight);
    CGContextMoveToPoint(context, bga_x - crosshair_spacer, bga_y + crosshair_spacer);
    CGContextAddLineToPoint(context, bga_x - bga_width, bga_y + bga_width);
    
    CGContextSetLineWidth(context, crosshair_weight);
    CGContextMoveToPoint(context, bga_x + crosshair_spacer, bga_y - crosshair_spacer);
    CGContextAddLineToPoint(context, bga_x + bga_width, bga_y - bga_width);
    
    CGContextDrawPath(context, kCGPathStroke);
}

- (void) mouseDown:(NSEvent*)event {
    self.left_point = [event locationInWindow];
    [self setNeedsDisplay:YES];
}

- (void) rightMouseDown:(NSEvent *)event {
    self.right_point = [event locationInWindow];
    [self setNeedsDisplay:YES];
}

- (void)otherMouseDown:(NSEvent *)event {
    self.bga_point = [event locationInWindow];
    [self setNeedsDisplay:YES];
}

@end
