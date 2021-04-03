//
//  ImageViewController.swift
//  Cassini
//
//  Created by bogdanov on 31.03.21.
//

import UIKit

class PictureViewController: UIViewController {
    
    private var imageUrl: URL? {
        didSet {
            ImageView.image = nil
            if view.window != nil {
                
            }
            fetchImage()
        }
    }

    @IBOutlet weak var ImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if imageUrl == nil {
            imageUrl = DemoURLs.cassini
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if ImageView.image == nil {
            fetchImage()
        }
    }
    
    func fetchImage() {
        if let url = imageUrl {
            let  urlContents = try? Data(contentsOf: url)
            if let imageData = urlContents {
                ImageView.image = UIImage(data: imageData)
            }
        }
    }
}
