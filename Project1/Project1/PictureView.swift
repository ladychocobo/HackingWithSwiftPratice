//
//  PictureView.swift
//  Project1
//
//  Created by Jamie Chen on 5/30/17.
//  Copyright © 2017 Jamie Chen. All rights reserved.
//

import UIKit

class PictureView: UIViewController {
    var imageName: String?
    var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.imageView = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)))
        if let image = imageName {
            self.imageView.image = UIImage(named: image)
        }
        self.view.addSubview(self.imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
