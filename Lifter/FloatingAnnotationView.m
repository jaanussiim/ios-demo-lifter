/*
 * Copyright 2014 JaanusSiim
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import <MapKit/MapKit.h>
#import "FloatingAnnotationView.h"

@interface FloatingAnnotationView ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation FloatingAnnotationView

- (id)initWithAnnotation:(id <MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier image:(UIImage *)image {
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setDraggable:YES];
        [self setBackgroundColor:[UIColor clearColor]];
        CGRect frame = CGRectMake(0, 0, image.size.width, image.size.height * 2);
        [self setFrame:frame];
        [self setCenterOffset:CGPointMake(0, -CGRectGetHeight(frame) / 2)];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        [self setImageView:imageView];
        [self addSubview:imageView];

        CGRect imageFrame = imageView.frame;
        imageFrame.origin.x = (CGRectGetWidth(frame) - CGRectGetWidth(imageFrame)) / 2;
        imageFrame.origin.y = CGRectGetHeight(frame) - CGRectGetHeight(imageFrame);
        [imageView setFrame:imageFrame];
    }

    return self;
}

- (void)setDragState:(MKAnnotationViewDragState)newDragState animated:(BOOL)animated {
    [super setDragState:newDragState animated:animated];

    if (newDragState == MKAnnotationViewDragStateStarting) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect imageFrame = self.imageView.frame;
            imageFrame.origin.y = 0;
            [self.imageView setFrame:imageFrame];
        }];
    } else if (newDragState == MKAnnotationViewDragStateNone) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect imageFrame = self.imageView.frame;
            imageFrame.origin.y = CGRectGetHeight(self.frame) - CGRectGetHeight(imageFrame);
            [self.imageView setFrame:imageFrame];
        }];
    }
}

@end
