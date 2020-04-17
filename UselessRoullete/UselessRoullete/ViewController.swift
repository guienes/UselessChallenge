//
//  ViewController.swift
//  UselessRoullete
//
//  Created by Guilherme Enes on 17/04/20.
//  Copyright © 2020 Guilherme Enes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let rollButton = UIButton()
    let beginImage = UIImage(named: "Roleta-0")
    lazy var roulleteImageView = UIImageView(image: beginImage)
    
    var numberOfTries: Int = 0
    
    
    var textField = UILabel()
    
    var roulleteImages: [UIImage] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Posiciona o texto
        
        textField.frame = CGRect(x: self.view.frame.width/10, y: self.view.frame.height*0.24, width: 500, height: 100)
        
        textField.font = UIFont(name: "Helvetica", size: 20)
        
        textField.textColor = .black
        textField.text = "Rode e veja sua sorte.."
        self.view.addSubview(textField)
        
        //posiciona a roleta
        
        roulleteImageView.frame = CGRect(x: self.view.frame.width/10, y: self.view.frame.height/3, width: 340  , height: 340)
        roulleteImageView.contentMode = .scaleToFill
        self.view.addSubview(roulleteImageView)
        
        roulleteImages = createImageArray(total: 8, imagePrefix: "Roleta")
        
        //posiciona o botão
        
        rollButton.setTitle("Gire", for: .normal)
        rollButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        rollButton.layer.cornerRadius = 5
        rollButton.backgroundColor = .orange
        rollButton.addTarget(self, action: #selector(rollButtonFunc), for: .touchUpInside)
        
        rollButton.frame = CGRect(x: self.view.frame.width/2.5, y: self.view.frame.height/1.3, width: 100, height: 70)
        
        self.view.addSubview(rollButton)
        
    }
    
    func createImageArray(total: Int, imagePrefix: String) -> [UIImage]{
        
        var imageArray: [UIImage] = []
        
        for imageCount in 0..<total {
            let imageName = "\(imagePrefix)-\(imageCount).png"
            let image = UIImage(named: imageName)!
            imageArray.append(image)
        }
        
        return imageArray
    }
    
    func animate(imageView: UIImageView, images: [UIImage]){
        
        imageView.animationImages = images
        imageView.animationRepeatCount = 5
        imageView.animationDuration = 1.0
        
        UIView.animate(withDuration: imageView.animationDuration, animations: {
            
            imageView.startAnimating()
            
        }) { (finished) in
            let seconds = 4.97
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                imageView.image = images.randomElement()
                if self.numberOfTries == 0 {
                    self.textField.text = "Você ganhou um grande nada!"
                    self.numberOfTries += 1
                } else {
                    self.textField.text = "Não vai desistir?"

                }
                
                
                
            }
        }

    }
    
    @objc func rollButtonFunc(sender: UIButton) {
        
        animate(imageView: roulleteImageView, images: roulleteImages)
        
    }


}

