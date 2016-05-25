//
//  CubeView.h
//  Cubenado
//
//  Created by Conor Sweeney on 5/24/16.
//  Copyright © 2016 Conor Sweeney. All rights reserved.
//

//creates a custom class for cube views that can be reused so that multiple cubes can be created

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#include <OpenGLES/ES2/gl.h>
#include <OpenGLES/ES2/glext.h>
#import "CC3GLMatrix.h"


@interface CubeView : UIView{
    CAEAGLLayer* _eaglLayer;
    EAGLContext* _context;
    GLuint _colorRenderBuffer;
    GLuint _positionSlot;
    GLuint _colorSlot;
    GLuint _projectionUniform;
    GLuint _modelViewUniform;
    float _currentRotation;
    GLuint _depthRenderBuffer;
}



@end
