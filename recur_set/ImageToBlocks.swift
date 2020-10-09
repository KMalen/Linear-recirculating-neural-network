//
//  ImageToBlocks.swift
//  recur_set
//
//  Created by Kiril Malenchik on 10/6/20.
//

import Foundation
import SwiftImage
import LASwift

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

class ImageToBlocs {
    
    var nSize: Int = 0
    var mSize: Int = 0
    
    struct point {
        var x = Int()
        var y = Int()
    }
    
    var imageOne = Image<RGBA<UInt8>>(contentsOfFile: "/Users/kirilmalenchik/Develop_iOS/recur_set/recur_set/images/1.png")
    var imageTwo = Image<RGBA<UInt8>>(contentsOfFile: "/Users/kirilmalenchik/Develop_iOS/recur_set/recur_set/images/2.png")
    var imageThree = Image<RGBA<UInt8>>(contentsOfFile: "/Users/kirilmalenchik/Develop_iOS/recur_set/recur_set/images/3.png")
    
    var pixelMatrix = [[RGBA<UInt8>]]()
    
    
    
    func imgToBlocks(img: Image<RGBA<UInt8>>, nSize: Int, mSize: Int){
        
        var nClearStep = 0
        var mClearStep = 0
        
        if (img.width % nSize == 0){
            nClearStep = img.width / nSize
        } else {
            nClearStep = img.width / nSize + 1
        }
        
        if (img.height % mSize == 0){
            mClearStep = img.height / mSize
        } else {
            mClearStep = img.height / mSize + 1
        }
        
        var regions = [(beginPoint: point, endPoint:point)]()
        var index = 0
        
        var tex = regions[0].beginPoint.x
        
        for i in 0..<mClearStep {
            
            for j in 0..<nClearStep {
                
                if ((j + 1) * nSize <= img.width && (i + 1) * mSize <= img.height) {
                    
                    regions[index].beginPoint = point(x: j * nSize, y: i * mSize)
                    regions[index].endPoint = point(x: (j + 1) * nSize, y: (i + 1) * mSize)
                    
                    index += 1
                    continue
                }
                
                if ((j + 1) * nSize > img.width && (i + 1) * mSize > img.height) {
                    
                    regions[index].beginPoint = point(x: img.width - nSize, y: img.height - mSize)
                    regions[index].endPoint = point(x: img.width, y: img.height)
                    
                    index += 1
                    continue
                    
                }
                
                if ((j + 1) * nSize <= img.width && (i + 1) * mSize > img.height) {
                    
                    regions[index].beginPoint = point(x: j * nSize, y: img.height - mSize)
                    regions[index].endPoint = point(x: (j + 1) * nSize, y: img.height)
                    
                    index += 1
                    continue
                }
                
                if ((j + 1) * nSize > img.width && (i + 1) * mSize <= img.height) {
                    
                    regions[index].beginPoint = point(x: img.width - nSize, y: i * mSize)
                    regions[index].endPoint = point(x: img.width, y: (i + 1) * mSize)
                    
                    index += 1
                }
                
            }
            
        }
        
    }
    
    class Block {
        
        var redPixel = UInt8()
        var greenPixel = UInt8()
        var bluePixel = UInt8()
        
    }
    
    
    
//    func testImage(img:Image<RGBA<UInt8>>){
//        print("hello")
//        self.imageOne = img.yReversed()
//
//        if let image = imageOne {
//            if let data = image.pngData() {
//                let filename = getDocumentsDirectory().appendingPathComponent("copy.png")
//                try? data.write(to: filename)
//            }
//        }
//
//    }
    
}
