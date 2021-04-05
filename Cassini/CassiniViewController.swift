//
//  ImageViewController.swift
//  Cassini
//
//  Created by bogdanov on 05.04.21.
//

import UIKit

class CassiniViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if let url = DemoURLs.NASA[identifier] {
                var destination = segue.destination
                
                if let navcon = destination as? UINavigationController {
                    destination = navcon.visibleViewController ?? navcon
                }
                if let imageVC = destination as? ImageViewController {
                    imageVC.imageUrl = url
                    imageVC.title = (sender as? UIButton)?.currentTitle
                }
            }
        }
    }
}
