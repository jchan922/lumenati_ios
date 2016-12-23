//
//  LoginViewControllerDelegate.swift
//  lumenati
//
//  Created by Justin Chan on 12/21/16.
//  Copyright © 2016 Justin Chan. All rights reserved.
//

import Foundation

protocol MapViewControllerDelegate: class {
    func mapViewController(controller: MapViewController, loginAttempt user: AnyObject)
}
