//
//  MarkerInfoViewControllerDelegate.swift
//  lumenati
//
//  Created by Justin Chan on 12/22/16.
//  Copyright © 2016 Justin Chan. All rights reserved.
//

import Foundation

protocol MarkerInfoViewControllerDelegate {
    func passingData(controller: MarkerInfoViewController, data: Marker)
}
