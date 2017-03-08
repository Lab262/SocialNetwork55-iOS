//
//  LoginViewController.swift
//  SocialNetwork55Lab
//
//  Created by Huallyd Smadi on 07/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    

    @IBOutlet weak var cpfField: AKMaskField!
  
    @IBOutlet weak var passField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 0.5, animations: {
            self.view.alpha = 1
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPlaceholderColorsInFields()
        setMaskInField()
    }
    
    func setPlaceholderColorsInFields(){
        cpfField.attributedPlaceholder = NSAttributedString(string: "CPF",
                                                            attributes: [NSForegroundColorAttributeName: UIColor.white])
        
        passField.attributedPlaceholder = NSAttributedString(string: "Senha",
                                                             attributes: [NSForegroundColorAttributeName: UIColor.white])
    }
    
    func setMaskInField(){
        cpfField.setMask(MaskField.cpf.rawValue, withMaskTemplate: "")
    }
    
    @IBAction func forgetPass(_ sender: Any) {
       showAlertControllerWithField()
    }
    
    func showAlertControllerWithField(){
        let alertController = UIAlertController(title: "Esqueci a Senha", message: "", preferredStyle: .alert)
        
        let sendAction = UIAlertAction(title: "Enviar", style: .default, handler: {
            alert -> Void in
            
            if alertController.textFields![0].text! != "" {
                self.sendEmail()
            }else {
                self.present(ViewUtil.alertControllerWithTitle(_title: "Erro", _withMessage: "Email inválido."), animated: true, completion: nil)
                
            }
        })
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "E-mail para recuperar conta."
            textField.keyboardType = .emailAddress
        }
        
        alertController.addAction(sendAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func sendEmail(){
        self.view.loadAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.present(ViewUtil.alertControllerWithTitle(_title: "Sucesso!", _withMessage: "Um email de recuperação foi enviado para seu email."), animated: true, completion: nil)
            self.view.unload()
        }
    }

    @IBAction func backButtonAction(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: NotificationKeyNames.notificationChangeBackground), object: nil)
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let _ = segue.destination as? AuthenticationMainViewController {
            UIView.animate(withDuration: 0.5, animations: {
                self.view.alpha = 0
            })
        }
    }
}
