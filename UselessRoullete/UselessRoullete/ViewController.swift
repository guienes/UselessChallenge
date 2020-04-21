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
    
    let kacaImage = UIImage(named: "kaca")
    let eloImage = UIImage(named: "eloisa")
    let fabricioImage = UIImage(named: "fabricio")
    let joaoImage = UIImage(named: "joao")
    let enesImage = UIImage(named: "enes")
    let luizImage = UIImage(named: "luiz" )
    let gabrielImage = UIImage(named: "gabriel")
    let leoImage = UIImage(named: "leo")
    
    lazy var roulleteImageView = UIImageView(image: beginImage)
    
    var textField = UILabel()
    
    
    
    var roulleteImages: [UIImage] = []
    var roulleteResultImages: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Posiciona o texto
        
        textField.frame = CGRect(x: self.view.frame.width/10, y: self.view.frame.height*0.24, width: 500, height: 100)
        
        textField.font = UIFont(name: "Helvetica", size: 20)
        
        textField.textColor = .black
        textField.text = "Gire a roleta e encontre pessoas lindas"
        self.view.addSubview(textField)
        
        //posiciona a roleta
        
        roulleteImageView.frame = CGRect(x: self.view.frame.width/10, y: self.view.frame.height/3, width: 340  , height: 340)
        roulleteImageView.contentMode = .scaleToFill
        self.view.addSubview(roulleteImageView)
        
        roulleteImages = createImageArray(total: 8, imagePrefix: "Roleta")
        roulleteResultImages = createImageArray(total: 7, imagePrefix: "resultado")
        
        //posiciona o botão
        
        rollButton.setTitle("Gire", for: .normal)
        rollButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        rollButton.layer.cornerRadius = 5
        rollButton.backgroundColor = .black
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
                imageView.image = self.roulleteResultImages.randomElement()
                if imageView.image == self.roulleteResultImages[0]{
                    self.createAlert(titulo: "Você encontrou o Kaça", imagem: self.kacaImage!)
                } else if imageView.image == self.roulleteResultImages[1]{
                    self.createAlert(titulo: "Você encontrou a Elo", imagem: self.eloImage!)
                } else if imageView.image == self.roulleteResultImages[2]{
                    self.createAlert(titulo: "Você encontrou o Fabricio", imagem: self.fabricioImage!)
                } else if imageView.image == self.roulleteResultImages[3]{
                    self.createAlert(titulo: "Você encontrou o Joao", imagem: self.joaoImage!)
                } else if imageView.image == self.roulleteResultImages[4]{
                    self.createAlert(titulo: "Você encontrou o Enao", imagem: self.enesImage!)
                } else if imageView.image == self.roulleteResultImages[5]{
                    self.createAlert(titulo: "Você encontrou o luiz", imagem: self.luizImage!)
                } else if imageView.image == self.roulleteResultImages[6]{
                    self.createAlert(titulo: "Você encontrou o leo", imagem: self.leoImage!)
                } else {
                    self.createAlert(titulo: "Você encontrou o gabriel", imagem: self.gabrielImage!)
                }
            }
        }
        
    }
    
    
    func createAlert (titulo: String, imagem: UIImage){
        let showAlert = UIAlertController(title: titulo, message: nil, preferredStyle: .alert)
        let imageView = UIImageView(frame: CGRect(x: 10, y: 50, width: 250, height: 230))
        imageView.image = imagem // Your image here...
        showAlert.view.addSubview(imageView)
        let height = NSLayoutConstraint(item: showAlert.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 320)
        let width = NSLayoutConstraint(item: showAlert.view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
        showAlert.view.addConstraint(height)
        showAlert.view.addConstraint(width)
        showAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            // your actions here...
        }))
        
        self.present(showAlert, animated: true, completion: nil)
        
    }
    
    @objc func rollButtonFunc(sender: UIButton) {
        
        animate(imageView: roulleteImageView, images: roulleteImages)
        
    }
    
    
}

