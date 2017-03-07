//
//  CreateAccountViewController.swift
//  SocialNetwork55Lab
//
//  Created by Huallyd Smadi on 07/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var forgetButton: UIButton!
    @IBOutlet weak var backButtonView: UIView!
    
    @IBOutlet weak var cpfField: AKMaskField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var cpfFieldSupportView: UIView!
    
    
    @IBOutlet weak var passFieldSupportView: UIView!
    @IBOutlet weak var emailFieldSupportView: UIView!
    
    @IBOutlet weak var passField: UITextField!
    
    @IBOutlet weak var enterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailField.attributedPlaceholder = NSAttributedString(string: "Email",
                                                             attributes: [NSForegroundColorAttributeName: UIColor.white])
        
        passField.attributedPlaceholder = NSAttributedString(string: "Senha",
                                                             attributes: [NSForegroundColorAttributeName: UIColor.white])

        cpfField.attributedPlaceholder = NSAttributedString(string: "CPF",
                                                             attributes: [NSForegroundColorAttributeName: UIColor.white])
        
         self.cpfField.setMask("{ddd}.{ddd}.{ddd}-{dd}", withMaskTemplate: "")
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backButtonAction(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: keyNotificationChangeBackground), object: nil)
        _ = self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func forgetAction(_ sender: Any) {
        let alertController = UIAlertController(title: "Esqueci a Senha", message: "", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Enviar", style: .default, handler: {
            alert -> Void in
            
            if alertController.textFields![0].text! != "" {
                
                
                self.present(ViewUtil.alertControllerWithTitle(_title: "Sucesso!", _withMessage: "Um email de recuperação foi enviado para seu email."), animated: true, completion: nil)
                
                
            }else {
                
                self.present(ViewUtil.alertControllerWithTitle(_title: "Erro", _withMessage: "Email inválido."), animated: true, completion: nil)
                
            }
        })
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            
            textField.placeholder = "E-mail para recuperar conta."
            textField.keyboardType = .emailAddress
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func enterApp(_ sender: Any) {

        if cpfField.maskStatus == .incomplete || cpfField.maskStatus == .clear {
            self.present(ViewUtil.alertControllerWithTitle(_title: "Atenção", _withMessage: "CPF inválido."), animated: true, completion: nil)
            return
        }
        
        if emailField.text == "" {
            self.present(ViewUtil.alertControllerWithTitle(_title: "Atenção", _withMessage: "Email inválido."), animated: true, completion: nil)
            return
        }
        
        if passField.text == ""{
            self.present(ViewUtil.alertControllerWithTitle(_title: "Atenção", _withMessage: "Senha inválida."), animated: true, completion: nil)
            return
        }
        
        
        view.loadAnimation()
        
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.present(self.alertControllerWithPopoverView(title: "Sucesso", message: "Conta criada com sucesso."), animated: true, completion: nil)
            self.view.unload()
        }
        
    }
    
    func alertControllerWithPopoverView(title: String, message: String) -> UIAlertController {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default) {
            UIAlertAction in
            
        NotificationCenter.default.post(name: Notification.Name(rawValue: keyNotificationChangeBackground), object: nil)
            _ = self.navigationController?.popViewController(animated: true)
        })
        
        return alert
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 0.5, animations: {
            self.view.alpha = 1
        })
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        

        if let _ = segue.destination as? AuthenticationMainViewController {
            UIView.animate(withDuration: 0.5, animations: {
                self.view.alpha = 0
            })
        }
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
