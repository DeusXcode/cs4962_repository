//
//  AppDelegate.swift
//  Project0
//
//  Created by Daniel Cushing on 1/25/15.
//  Copyright (c) 2015 Daniel Cushing. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var _XSlider: UISlider?
    var _YSlider: UISlider?
    
    var _XLabel: UILabel?
    var _YLabel: UILabel?
    
    var _XplusYLabel: UILabel?
    var _XminusYLabel: UILabel?
    var _XtimesYLabel: UILabel?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // Initialize Window
        window = UIWindow(frame: UIScreen.mainScreen().bounds);
        window!.makeKeyAndVisible();
        
        // Get height and width of window
        let windowHeight = window?.bounds.height;
        let windowWidth = window?.bounds.width;
        
        // Set Background Color
        window!.backgroundColor = UIColor.lightGrayColor();
        
        // Create X Slider
        var sliderXWidth: CGFloat = 240;
        var sliderXHeight: CGFloat = 20;
        _XSlider = UISlider(frame: CGRectMake(windowWidth! / 2 - sliderXWidth / 2, windowHeight! / 2 - 80, sliderXWidth, sliderXHeight));
        _XSlider!.minimumValue = 0;
        _XSlider!.maximumValue = 1;
        _XSlider!.addTarget(self, action: "sliderXChanged", forControlEvents: UIControlEvents.ValueChanged)
        window!.addSubview(_XSlider!);
        
        // Create Y Slider
        var sliderYWidth: CGFloat = 240;
        var sliderYHeight: CGFloat = 20;
        _YSlider = UISlider(frame: CGRectMake(windowWidth! / 2 - sliderYWidth / 2, windowHeight! / 2 - 20, sliderYWidth, sliderYHeight));
        _YSlider!.minimumValue = 0;
        _YSlider!.maximumValue = 1;
        _YSlider!.addTarget(self, action: "sliderYChanged", forControlEvents: UIControlEvents.ValueChanged)
        window!.addSubview(_YSlider!);
        
        // Static "X" and "Y" Labels
        var staticLabelX = UILabel(frame: CGRectMake(windowWidth! / 2 - sliderXWidth / 2 - 20, windowHeight! / 2 - 80, 20, 20))
        var staticLabelY = UILabel(frame: CGRectMake(windowWidth! / 2 - sliderYWidth / 2 - 20, windowHeight! / 2 - 20, 20, 20))
        staticLabelX.text = "X"
        staticLabelY.text = "Y"
        window!.addSubview(staticLabelX)
        window!.addSubview(staticLabelY)
        
        // Dynamic X and Y slider value labels
        _XLabel = UILabel(frame: CGRectMake(windowWidth! / 2 + sliderYWidth / 2 + 10, windowHeight! / 2 - 80, 50, 20))
        _YLabel = UILabel(frame: CGRectMake(windowWidth! / 2 + sliderYWidth / 2 + 10, windowHeight! / 2 - 20, 50, 20))
        _XLabel!.text = "0.000"
        _YLabel!.text = "0.000"
        window!.addSubview(_XLabel!)
        window!.addSubview(_YLabel!)
        
        // Dynamic X and Y operation labels 
        var labelWidth = 120
        _XplusYLabel = UILabel(frame: CGRectMake(windowWidth! / 2 - 55, windowHeight! / 2 + 10, 120, 20))
        _XminusYLabel = UILabel(frame: CGRectMake(windowWidth! / 2 - 55, windowHeight! / 2 + 40, 120, 20))
        _XtimesYLabel = UILabel(frame: CGRectMake(windowWidth! / 2 - 55, windowHeight! / 2 + 70, 120, 20))
        
        _XplusYLabel!.text = "X + Y = 0.0000"
        _XminusYLabel!.text = "X - Y = 0.0000"
        _XtimesYLabel!.text = "X * Y = 0.0000"
        
        window!.addSubview(_XplusYLabel!)
        window!.addSubview(_XminusYLabel!)
        window!.addSubview(_XtimesYLabel!)
        
        return true
    }
    
    func sliderXChanged()
    {
        _XLabel!.text = NSString(format: "%.3f", _XSlider!.value)
        _XplusYLabel!.text = "X + Y = " + NSString(format: "%.4f", _XSlider!.value + _YSlider!.value)
        _XminusYLabel!.text = "X - Y = " + NSString(format: "%.4f", _XSlider!.value - _YSlider!.value)
        _XtimesYLabel!.text = "X * Y = " + NSString(format: "%.4f", _XSlider!.value * _YSlider!.value)
        
    }
    
    func sliderYChanged()
    {
        _YLabel!.text = NSString(format: "%.3f", _YSlider!.value)
        _XplusYLabel!.text = "X + Y = " + NSString(format: "%.4f", _XSlider!.value + _YSlider!.value)
        _XminusYLabel!.text = "X - Y = " + NSString(format: "%.4f", _XSlider!.value - _YSlider!.value)
        _XtimesYLabel!.text = "X * Y = " + NSString(format: "%.4f", _XSlider!.value * _YSlider!.value)
        
    }

}

