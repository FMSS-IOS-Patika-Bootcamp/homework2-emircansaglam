//
//  DetailViewController.swift
//  Emircan-Saglam-Odev-2
//
//  Created by Emircan saglam on 17.09.2022.
//

import UIKit

class DetailViewController: UIViewController{
    
    
    
   
    
    
    @IBOutlet weak var detailLongText: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    
    var image : String?
    var longText : String?
    var titleText : String?
    var url : String?
    var myController = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailImage.image = UIImage(named: image!)
        detailLongText.text = longText
        navigationItem.title = titleText
        
        detailLongText.numberOfLines = 0
        
        let vc = UIViewController()
        vc.view.backgroundColor = .red
        myController.append(vc)
       
        
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
//        guard let first = myController.first else {
//            return
//        }
//        let vc = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal)
//        vc.delegate = self
//        vc.dataSource = self
//        vc.setViewControllers([first], direction: .forward, animated: true)
//
//        present(vc, animated: true)
        if let url = URL(string: url!) {
            UIApplication.shared.open(url)
        }
        
    }
   
   
}
