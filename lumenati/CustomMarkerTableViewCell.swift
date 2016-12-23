//
//  CustomMarkerTableViewCell.swift
//  lumenati
//
//  Created by Justin Chan on 12/22/16.
//  Copyright © 2016 Justin Chan. All rights reserved.
//

import UIKit

class CustomMarkerTableViewCell: UITableViewCell {
    private var _model: Marker?
    
    public internal(set) var model: Marker {
        get {
            return self._model!
        }
        set {
            self._model = newValue
            self.textLabel?.text = self._model?.title
        }
    }
}
