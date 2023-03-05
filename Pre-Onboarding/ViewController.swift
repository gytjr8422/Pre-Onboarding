//
//  ViewController.swift
//  Pre-Onboarding
//
//  Created by 김효석 on 2023/03/04.
//

import UIKit

class ViewController: UIViewController {
    let urlString1 = "https://cdn.pixabay.com/photo/2022/12/29/20/07/winter-7685665__480.jpg"
    let urlString2 = "https://cdn.pixabay.com/photo/2016/11/29/12/13/fence-1869401__480.jpg"
    let urlString3 = "https://cdn.pixabay.com/photo/2015/01/12/17/40/padlock-597495__480.jpg"
    let urlString4 = "https://cdn.pixabay.com/photo/2020/06/30/21/53/walking-5357721__480.jpg"
    let urlString5 = "https://cdn.pixabay.com/photo/2016/04/15/22/08/town-hall-1332069__480.jpg"

    @IBOutlet weak var imgView1: UIImageView!
    @IBOutlet weak var imgView2: UIImageView!
    @IBOutlet weak var imgView3: UIImageView!
    @IBOutlet weak var imgView4: UIImageView!
    @IBOutlet weak var imgView5: UIImageView!

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var allButton: UIButton!
    
    
    
    @IBAction func allButton(_ sender: UIButton) {
        loadImage(urlString: urlString1, imgView: imgView1)
        loadImage(urlString: urlString2, imgView: imgView2)
        loadImage(urlString: urlString3, imgView: imgView3)
        loadImage(urlString: urlString4, imgView: imgView4)
        loadImage(urlString: urlString5, imgView: imgView5)
    }
    
    @IBAction func button1(_ sender: UIButton) {
        loadImage(urlString: urlString1, imgView: imgView1)
    }
    @IBAction func button2(_ sender: UIButton) {
        loadImage(urlString: urlString2, imgView: imgView2)
    }
    @IBAction func button3(_ sender: UIButton) {
        loadImage(urlString: urlString3, imgView: imgView3)
    }
    @IBAction func button4(_ sender: UIButton) {
        loadImage(urlString: urlString4, imgView: imgView4)
    }
    @IBAction func button5(_ sender: UIButton) {
        loadImage(urlString: urlString5, imgView: imgView5)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.cornerRadius = button1.frame.size.height / 5
        button2.layer.cornerRadius = button2.frame.size.height / 5
        button3.layer.cornerRadius = button3.frame.size.height / 5
        button4.layer.cornerRadius = button4.frame.size.height / 5
        button5.layer.cornerRadius = button5.frame.size.height / 5
        allButton.layer.cornerRadius = allButton.frame.size.height / 5
    }

}

extension ViewController {
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
