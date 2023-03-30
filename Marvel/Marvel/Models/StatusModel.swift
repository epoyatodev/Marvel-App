//
//  StatusModel.swift
//  Marvel
//
//  Created by Enrique Poyato Ortiz on 27/3/23.
//

import Foundation

enum Status {
    case none, loading, loaded, error(error: String)
}
