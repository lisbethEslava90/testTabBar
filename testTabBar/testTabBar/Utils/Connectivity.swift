//
//  Connectivity.swift
//  testTabBar
//
//  Created by Lisbeth Eslava on 9/03/20.
//  Copyright © 2020 Lisbeth Eslava. All rights reserved.
//

import Foundation
import Alamofire

class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
