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
            image = nil
            if view.window != nil {
                
            }
            fetchImage()
        }
    }

    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.addSubview(imageView)
        }
    }
    
    private var imageView = UIImageView()
    
    private var image: UIImage? {
        get {
            imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView.contentSize = imageView.bounds.size
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if imageUrl == nil {
            imageUrl = DemoURLs.cassini
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageView.image == nil {
            fetchImage()
        }
    }
    
    func fetchImage() {
        if let url = imageUrl {
            let  urlContents = try? Data(contentsOf: url)
            if let imageData = urlContents {
                image = UIImage(data: imageData)
            }
        }
    }
}
