//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by Paola Di Marcello on 06/04/15.
//  Copyright (c) 2015 GE. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject{
    var filePathUrl: NSURL!
    var title: String!
    
    init(filePathUrl: NSURL, title: String) {
        self.filePathUrl = filePathUrl
        self.title = title
    }
    
}