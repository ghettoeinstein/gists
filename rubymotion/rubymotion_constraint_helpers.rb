#Ported from one of Erica Sadun's Books. Can't remember which one 

module ConstraintHelpers

  COOKBOOK_PURPLE_COLOR = UIColor.colorWithRed(0.20392, green:0.19607, blue:0.61176, alpha:1)
  

  #define BARBUTTON(TITLE, SELECTOR)    UIBarButtonItem.alloc.initWithTitle(TITLE, style:UIBarButtonItemStylePlain, target:self, action:SELECTOR)
  
  def bar_button(title, selector)
    UIBarButtonItem.alloc.initWithTitle(title, style:UIBarButtonItemStylePlain, target:self, action:selector)
  end

  def sysbar_button(item, selector)
    UIBarButtonItem.alloc.initWithBarButtonSystemItem(item,target:self, action:selector)
  end

  #define SYSBARBUTTON(ITEM, SELECTOR) UIBarButtonItem.alloc.initWithBarButtonSystemItem(ITEM, target:self, action:SELECTOR)

  #define IS_PORTRAIT UIDeviceOrientationIsPortrait(UIDevice.currentDevice.orientation) || UIDeviceOrientationIsPortrait(self.interfaceOrientation)
  #define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
  #define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)


  #define PREPCONSTRAINTS(VIEW) [VIEW setTranslatesAutoresizingMaskIntoConstraints:NO]
  def prep_constraints(view)
    view.setTranslatesAutoresizingMaskIntoConstraints(false)
  end

  #define CONSTRAIN(PARENT, VIEW, FORMAT) [PARENT addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:(FORMAT) options:0 metrics:nil views:NSDictionaryOfVariableBindings(VIEW)]]
  def constrain_views(parent,format,viewBindings)
    parent.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(format), options:0, metrics:nil, views:viewBindings)
  end

  #define CONSTRAIN_VIEWS(PARENT, FORMAT, VIEWBINDINGS) [PARENT addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:(FORMAT) options:0 metrics:nil views:VIEWBINDINGS]]
  def constrain(parent,view,format)
    parent.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(format, options:0, metrics:nil, views:view))
  end

    
  

  


  # Stretch across axis
  #define STRETCH_VIEW_H(PARENT, VIEW) CONSTRAIN(PARENT, VIEW, @"H:|["#VIEW"(>=0)]|")
  #define STRETCH_VIEW_V(PARENT, VIEW) CONSTRAIN(PARENT, VIEW, @"V:|["#VIEW"(>=0)]|")
  #define STRETCH_VIEW(PARENT, VIEW) {STRETCH_VIEW_H(PARENT, VIEW); STRETCH_VIEW_V(PARENT, VIEW);}

  def stretch_view_h(parent,view)
    constrain(parent,view,"H:|['#{view}'(>=0)]|")
  end

  def stretch_view_v(parent,view)
    constrain(parent,view,"V:|['#{view}'(>=0)]|")
  end

  def stretch_view(parent,view)
    stretch_view_h(parent,view)
    stretch_view_v(parent,view)
  end



  
  
  # Center along axis
  #define CENTER_VIEW_H(PARENT, VIEW) [PARENT addConstraint:[NSLayoutConstraint constraintWithItem:VIEW attribute: NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:PARENT attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f]]
  #define CENTER_VIEW_V(PARENT, VIEW) [PARENT addConstraint:[NSLayoutConstraint constraintWithItem:VIEW attribute: NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:PARENT attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f]]
  #define CENTER_VIEW(PARENT, VIEW) {CENTER_VIEW_H(PARENT, VIEW); CENTER_VIEW_V(PARENT, VIEW);}
  
  def center_view_h(parent,view)
    parent.addConstraint(NSLayoutConstraint.constraintWithItem(view, attribute: NSLayoutAttributeCenterX, relatedBy:NSLayoutRelationEqual, toItem:parent, attribute: NSLayoutAttributeCenterX, multiplier:1.0, constant:0))
  end 
  
  def center_view_v(parent,view)
    parent.addConstraint(NSLayoutConstraint.constraintWithItem(view, attribute: NSLayoutAttributeCenterY, relatedBy:NSLayoutRelationEqual, toItem:parent, attribute: NSLayoutAttributeCenterY, multiplier:1.0, constant:0))
  end
  
  def center_view(parent,view)
    center_view_h(parent,view)
    center_view_v(parent,view)
  end
  
  
  
  # Align to parent
  #define ALIGN_VIEW_LEFT(PARENT, VIEW) [PARENT addConstraint:[NSLayoutConstraint constraintWithItem:VIEW attribute: NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:PARENT attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0.0f]]
  def align_view_left(parent,view) 
    parent.addConstraint(NSLayoutConstraint.constraintWithItem(view, attribute: NSLayoutAttributeLeft, relatedBy:NSLayoutRelationEqual, toItem:parent, attribute:NSLayoutAttributeLeft, multiplier:1, constant:0.0))
  end
  
  #define ALIGN_VIEW_RIGHT(PARENT, VIEW) [PARENT addConstraint:[NSLayoutConstraint constraintWithItem:VIEW attribute: NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:PARENT attribute:NSLayoutAttributeRight multiplier:1.0f constant:0.0f]]
  def align_view_right(parent,view) 
    parent.addConstraint(NSLayoutConstraint.constraintWithItem(view, attribute: NSLayoutAttributeRight, relatedBy:NSLayoutRelationEqual, toItem:parent, attribute:NSLayoutAttributeRight, multiplier:1, constant:0.0))
  end
  
  #define ALIGN_VIEW_TOP(PARENT, VIEW) [PARENT addConstraint:[NSLayoutConstraint constraintWithItem:VIEW attribute: NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:PARENT attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0f]]
  def align_view_top(parent,view) 
    parent.addConstraint(NSLayoutConstraint.constraintWithItem(view, attribute: NSLayoutAttributeTop, relatedBy:NSLayoutRelationEqual, toItem:parent, attribute:NSLayoutAttributeTop, multiplier:1.0, constant:0.0))
  end
  
  #define ALIGN_VIEW_BOTTOM(PARENT, VIEW) [PARENT addConstraint:[NSLayoutConstraint constraintWithItem:VIEW attribute: NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:PARENT attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0f]]
  def align_view_bottom(parent,view) 
    parent.addConstraint(NSLayoutConstraint.constraintWithItem(view, attribute: NSLayoutAttributeBottom, relatedBy:NSLayoutRelationEqual, toItem:parent, attribute:NSLayoutAttributeBottom, multiplier:1.0, constant:0.0))
  end
  
  #define ALIGN_VIEW_LEFT_CONSTANT(PARENT, VIEW, CONSTANT) [PARENT addConstraint:[NSLayoutConstraint constraintWithItem:VIEW attribute: NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:PARENT attribute:NSLayoutAttributeLeft multiplier:1.0f constant:CONSTANT]]
  def align_view_left_constant(parent,view) 
    parent.addConstraint(NSLayoutConstraint.constraintWithItem(view, attribute: NSLayoutAttributeLeft, relatedBy:NSLayoutRelationEqual, toItem:parent, attribute:NSLayoutAttributeLeft, multiplier:1.0, constant:constant))
  end
  
  #define ALIGN_VIEW_RIGHT_CONSTANT(PARENT, VIEW, CONSTANT) [PARENT addConstraint:[NSLayoutConstraint constraintWithItem:VIEW attribute: NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:PARENT attribute:NSLayoutAttributeRight multiplier:1.0f constant:CONSTANT]]
  def align_view_right_constant(parent,view) 
    parent.addConstraint(NSLayoutConstraint.constraintWithItem(view, attribute: NSLayoutAttributeRight, relatedBy:NSLayoutRelationEqual, toItem:parent, attribute:NSLayoutAttributeRight, multiplier:1.0, constant:constant))
  end
  
  #define ALIGN_VIEW_TOP_CONSTANT(PARENT, VIEW, CONSTANT) [PARENT addConstraint:[NSLayoutConstraint constraintWithItem:VIEW attribute: NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:PARENT attribute:NSLayoutAttributeTop multiplier:1.0f constant:CONSTANT]]
  def align_view_top_constant(parent,view) 
    parent.addConstraint(NSLayoutConstraint.constraintWithItem(view, attribute: NSLayoutAttributeTop, relatedBy:NSLayoutRelationEqual, toItem:parent, attribute:NSLayoutAttributeTop, multiplier:1.0, constant:constant))
  end
  
  #define ALIGN_VIEW_TOP_CONSTANT(PARENT, VIEW, CONSTANT) [PARENT addConstraint:[NSLayoutConstraint constraintWithItem:VIEW attribute: NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:PARENT attribute:NSLayoutAttributeTop multiplier:1.0f constant:CONSTANT]]
  def align_view_bottom_constant(parent,view) 
    parent.addConstraint(NSLayoutConstraint.constraintWithItem(view, attribute: NSLayoutAttributeBottom, relatedBy:NSLayoutRelationEqual, toItem:parent, attribute:NSLayoutAttributeBottom, multiplier:1.0, constant:constant))
  end
  
  
  
  
 
  #define CONSTRAIN_WIDTH(VIEW, WIDTH) [VIEW addConstraint:[NSLayoutConstraint constraintWithItem:VIEW attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:WIDTH]];
  def constrain_width(view,width)
    view.addConstraint(NSLayoutConstraint.constraintWithItem(view, attribute:NSLayoutAttributeWidth, relatedBy:NSLayoutRelationEqual, toItem:nil, attribute:NSLayoutAttributeNotAnAttribute, multiplier:1, constant:width))
  end
  
  #define CONSTRAIN_HEIGHT(VIEW, HEIGHT) [VIEW addConstraint:[NSLayoutConstraint constraintWithItem:VIEW attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:HEIGHT]];
  def constrain_height(view,height)
    view.addConstraint(NSLayoutConstraint.constraintWithItem(view, attribute:NSLayoutAttributeHeight, relatedBy:NSLayoutRelationEqual, toItem:nil, attribute:NSLayoutAttributeNotAnAttribute, multiplier:1, constant:width))
  end
  
  #define CONSTRAIN_SIZE(VIEW, HEIGHT, WIDTH) {CONSTRAIN_WIDTH(VIEW, WIDTH); CONSTRAIN_HEIGHT(VIEW, HEIGHT);}
  def constrain_size(view,width,height)
    constrain_width(view,width)
    constrain_height(view, height)
  end
  
  # Set Aspect
  #define CONSTRAIN_ASPECT(VIEW, ASPECT) [VIEW addConstraint:[NSLayoutConstraint constraintWithItem:VIEW attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:VIEW attribute:NSLayoutAttributeHeight multiplier:(ASPECT) constant:0.0f]]
  def constrain_aspect(view,aspect)
    view.addConstraint(NSLayoutConstraint.constrainWithItem(view, attribute:NSLayoutAttributeWidth, relatedBy:NSLayoutRelationEqual, toItem:view, attribute:NSLayoutAttributeHeight, multiplier:aspect,constant:0))
  end



end
