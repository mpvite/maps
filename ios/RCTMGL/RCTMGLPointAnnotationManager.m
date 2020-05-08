//
//  RCTMGLPointAnnotationManager.m
//  RCTMGL
//
//  Created by Nick Italiano on 10/12/17.
//  Copyright © 2017 Mapbox Inc. All rights reserved.
//
#import <React/RCTUIManager.h>

#import "RCTMGLPointAnnotationManager.h"
#import "RCTMGLPointAnnotation.h"

@implementation RCTMGLPointAnnotationManager

RCT_EXPORT_MODULE()

RCT_EXPORT_VIEW_PROPERTY(id, NSString)
RCT_EXPORT_VIEW_PROPERTY(anchor, NSDictionary)

RCT_REMAP_VIEW_PROPERTY(selected, reactSelected, BOOL)
RCT_REMAP_VIEW_PROPERTY(title, reactTitle, NSString)
RCT_REMAP_VIEW_PROPERTY(snippet, reactSnippet, NSString)
RCT_REMAP_VIEW_PROPERTY(coordinate, reactCoordinate, NSString)
RCT_REMAP_VIEW_PROPERTY(draggable, reactDraggable, BOOL)

RCT_REMAP_VIEW_PROPERTY(onMapboxPointAnnotationSelected, onSelected, RCTBubblingEventBlock)
RCT_REMAP_VIEW_PROPERTY(onMapboxPointAnnotationDeselected, onDeselected, RCTBubblingEventBlock)
RCT_REMAP_VIEW_PROPERTY(onMapboxPointAnnotationDragStart, onDragStart, RCTBubblingEventBlock)
RCT_REMAP_VIEW_PROPERTY(onMapboxPointAnnotationDragEnd, onDragEnd, RCTBubblingEventBlock)

RCT_EXPORT_METHOD(bringToFront:(nonnull NSNumber *)reactTag) {
  dispatch_async(dispatch_get_main_queue(), ^{
    RCTMGLPointAnnotation *component = (RCTMGLPointAnnotation *)[self.bridge.uiManager viewForReactTag:reactTag];
    [component bringToFront];
  });
}

- (UIView *)view
{
    return [[RCTMGLPointAnnotation alloc] init];
}

@end
