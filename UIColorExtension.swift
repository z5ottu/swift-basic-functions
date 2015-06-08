//
//  UIColorExtension.swift
//
//  Created by Szloboda Zsolt on 29/01/15.
//
import UIKit

extension UIColor
{
    // UIColor from int example:  UIColor(red: 12, green: 53, blue: 12)
    convenience init(red: Int, green: Int, blue: Int)
    {
        let newRed   = CGFloat(Double(red) / 255.0)
        let newGreen = CGFloat(Double(green) / 255.0)
        let newBlue  = CGFloat(Double(blue) / 255.0)
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: CGFloat(1.0))
    }
    // UIColor from hex integer  example: UIColor(netHex: 0xFFEEDD)
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
    // UIColor from hex string example: UIColor(hex: "#FF12AD")
    convenience init(hex: String)
    {
        // default is black
        var newRed   = CGFloat(0 / 255.0)
        var newGreen = CGFloat(0 / 255.0)
        var newBlue  = CGFloat(0 / 255.0)
        
        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet() as NSCharacterSet).uppercaseString
        
        if (cString.hasPrefix("#")) {
            cString = cString.substringFromIndex(advance(cString.startIndex, 1))
        }
        
        var rgbValue:UInt32 = 0
        NSScanner(string: cString).scanHexInt(&rgbValue)
        
        if count(hex) > 5 && count(hex) < 8 {
            newRed = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
            newGreen = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
            newBlue = CGFloat(rgbValue & 0x0000FF) / 255.0
        }
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: CGFloat(1.0))
    }
}