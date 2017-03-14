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
                self.sendEmail(email: alertController.textFields![0].text!)
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
    
    func sendEmail(email: String){
        self.view.loadAnimation()
        
        UserRequest.forgotPass(email: email) { (success, msg) in
            if success{
               self.present(ViewUtil.alertControllerWithTitle(_title: "Sucesso!", _withMessage: "Um email de recuperação foi enviado para seu email."), animated: true, completion: nil)
                self.view.unload()
            } else {
                self.present(ViewUtil.alertControllerWithTitle(_title: "Erro", _withMessage: msg), animated: true, completion: nil)
                self.view.unload()
            }
        }
    }

    @IBAction func backButtonAction(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: NotificationKeyNames.notificationChangeBackground), object: nil)
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        if let error = verifyTextFields() {
            present(ViewUtil.alertControllerWithTitle(_title: "Error", _withMessage: error), animated: true, completion: nil)
            return
        }
        
        let cpf = cpfField.text?.replacingOccurrences(of: "[|.-]", with: "", options: [.regularExpression])
        
        view.loadAnimation()
        UserRequest.loginUser(email: cpf!, pass: passField.text!) { (success, msg) in
            if success{
                self.view.unload()
                self.present(ViewUtil.viewControllerFromStoryboardWithIdentifier("Main")!, animated: true, completion: nil)
            } else {
                self.view.unload()
                self.present(ViewUtil.alertControllerWithTitle(_title: "Error", _withMessage: msg), animated: true, completion: nil)
            }
        }
    }
    
    func verifyTextFields() -> String? {
        let fields = [cpfField, passField]
        
        for field in fields {
            if field!.isKind(of: AKMaskField.self) {
                if let msgError = self.verifyMaskField(field: field as! AKMaskField) {
                    return msgError
                }
            } else {
                if field?.text == ""{
                    return field!.placeholder!.lowercased() + " inválido."
                }
            }
        }
        return nil
    }
    
    func verifyMaskField(field: AKMaskField) -> String? {
        switch field.maskStatus {
        case .clear, .incomplete:
            return field.placeholder!.lowercased() + " inválido."
        default:
            return nil
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let _ = segue.destination as? AuthenticationMainViewController {
            UIView.animate(withDuration: 0.5, animations: {
                self.view.alpha = 0
            })
        }
    }
}
