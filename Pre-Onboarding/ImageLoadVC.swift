//
//  ImageLoadVC.swift
//  Pre-Onboarding
//
//  Created by 김효석 on 2023/03/04.
//

import Foundation
import UIKit

// 
class ImageLoadVC: UIViewController {
    let urlString = [
        "https://cdn.pixabay.com/photo/2022/12/29/20/07/winter-7685665__480.jpg",
        "https://cdn.pixabay.com/photo/2016/11/29/12/13/fence-1869401__480.jpg",
        "https://cdn.pixabay.com/photo/2015/01/12/17/40/padlock-597495__480.jpg",
        "https://cdn.pixabay.com/photo/2020/06/30/21/53/walking-5357721__480.jpg",
        "https://cdn.pixabay.com/photo/2016/04/15/22/08/town-hall-1332069__480.jpg"
    ]
    
    @IBOutlet var imgViews: [UIImageView]!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var allLoadButton: UIButton!
    
    @IBAction func allLoadButton(_ sender: UIButton) {
        for i in 0..<urlString.count {
            loadImage(urlString: urlString[i], imgView: imgViews[i])
        }
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        if let index = buttons.firstIndex(of: sender) {
            loadImage(urlString: urlString[index], imgView: imgViews[index])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for button in buttons {
            button.layer.cornerRadius = button.frame.size.height / 5
        }
        allLoadButton.layer.cornerRadius = allLoadButton.frame.size.height / 5
    }
}

extension ImageLoadVC {
    func loadImage(urlString: String, imgView: UIImageView) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            guard let image = UIImage(data: data) else {
                return
            }
            
            DispatchQueue.main.async {
                imgView.image = UIImage(systemName: "sun.max")
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                imgView.image = image
            }
        }
        task.resume()
    }
}
