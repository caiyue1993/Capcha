//
//  Photographer.swift
//  Capcha
//
//  Created by 蔡越 on 17/1/1.
//  Copyright © 2017年 Nanjing University. All rights reserved.
//

import LeanCloud

class Photographer: LCObject {
    
    dynamic var name: LCString?
    dynamic var city: LCString?
    
    /* Swift SDK 文档尚未支持 LCFile，因此搁置 */
//    dynamic var moment: LCFile?
}
