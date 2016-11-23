//
//  Utililty.swift
//  Ultimate_Ipl
//
//  Created by BridgeLabz on 22/11/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit
class Utility {
    
    class func encodeImageBase64(image : UIImage) -> String
    {
        let imageData:NSData = UIImagePNGRepresentation(image)! as NSData
        let strBase64:String = imageData.base64EncodedString(options:.lineLength64Characters)
        return strBase64
    }
    
    class func decodeImagefromBase64(strBase64 : String)->UIImage
    {
        
        let dataDecoded:NSData = NSData(base64Encoded: strBase64, options: NSData.Base64DecodingOptions.ignoreUnknownCharacters)!
        
        let decodedimage:UIImage = UIImage(data: dataDecoded as Data)!
        return decodedimage
    }
}
