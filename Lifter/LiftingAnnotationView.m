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
#import "LiftingAnnotationView.h"

@interface LiftingAnnotationView ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation LiftingAnnotationView

- (id)initWithAnnotation:(id <MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier image:(UIImage *)image {
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setDraggable:YES];
        [self setBackgroundColor:[UIColor redColor]];
        CGRect frame = CGRectMake(0, 0, image.size.width, image.size.height);
        [self setFrame:frame];
        [self setCenterOffset:CGPointMake(0, -CGRectGetHeight(frame) / 2)];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        [self setImageView:imageView];
        [self addSubview:imageView];
    }

    return self;
}

@end
