//
//  StatusModel.swift
//  FinalSuperpoderesIOS
//
//  Created by Aitor Iglesias Pubill on 10/12/22.
//

import Foundation

enum Status {
    case login, loading, loaded, error(error: String)
}
