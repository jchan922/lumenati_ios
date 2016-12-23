//
//  MarkerInfoViewController.swift
//  lumenati
//
//  Created by Justin Chan on 12/22/16.
//  Copyright © 2016 Justin Chan. All rights reserved.
//

import UIKit

class MarkerInfoViewController: UIViewController {

    //////////////////////////////////////////////////
    // MARK: - VARIABLES
    //////////////////////////////////////////////////
    var data: Marker?
    weak var cancelButtonDelegate: CancelButtonDelegate?

    
    
    //////////////////////////////////////////////////
    // MARK: - OUTLETS
    //////////////////////////////////////////////////
    @IBOutlet weak var navBarItem: UINavigationItem!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBAction func cancelBarButtonPRessed(_ sender: UIBarButtonItem) {
        cancelButtonDelegate?.cancelButtonPressedFrom(controller: self)
    }
    
    
    //////////////////////////////////////////////////
    // MARK: - UI LIFE CYCLE
    //////////////////////////////////////////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (data != nil) {
            print(data!)
            titleLabel.text = data?.title
            categoryLabel.text = data?.category
            addressLabel.text = data?.address
            descriptionLabel.text = data?.description
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
