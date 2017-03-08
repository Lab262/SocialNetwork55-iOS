//
//  CreateAccountViewController.swift
//  SocialNetwork55Lab
//
//  Created by Huallyd Smadi on 07/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var cpfField: AKMaskField!
    @IBOutlet weak var emailField: UITextField!
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let _ = segue.destination as? AuthenticationMainViewController {
            UIView.animate(withDuration: 0.5, animations: {
                self.view.alpha = 0
            })
        }
    }
    
    func setPlaceholderColorsInFields(){
        emailField.attributedPlaceholder = NSAttributedString(string: "Email",
                                                              attributes: [NSForegroundColorAttributeName: UIColor.white])
        
        passField.attributedPlaceholder = NSAttributedString(string: "Senha",
                                                             attributes: [NSForegroundColorAttributeName: UIColor.white])
        
        cpfField.attributedPlaceholder = NSAttributedString(string: "CPF",
                                                            attributes: [NSForegroundColorAttributeName: UIColor.white])
    }
    
    func setMaskInField(){
        cpfField.setMask(MaskField.cpf.rawValue, withMaskTemplate: "")
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: NotificationKeyNames.notificationChangeBackground), object: nil)
        _ = self.navigationController?.popViewController(animated: true)
    }

    
    @IBAction func forgetAction(_ sender: Any) {
        let alertController = UIAlertController(title: "Esqueci a Senha", message: "", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Enviar", style: .default, handler: {
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
        
        alertController.addAction(saveAction)
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
    
    @IBAction func enterApp(_ sender: Any) {
        if let error = verifyTextFields() {
            self.present(ViewUtil.alertControllerWithTitle(_title: "Atenção", _withMessage: error), animated: true, completion: nil)
            return
        }
        
        view.loadAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.present(self.alertControllerWithPopoverView(title: "Sucesso", message: "Conta criada com sucesso."), animated: true, completion: nil)
            self.view.unload()
        }        
    }
    
    func verifyTextFields() -> String? {
        let fields = [cpfField, emailField, passField]
    
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
    
    func alertControllerWithPopoverView(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default) {
            UIAlertAction in

        NotificationCenter.default.post(name: Notification.Name(rawValue: NotificationKeyNames.notificationChangeBackground), object: nil)
            _ = self.navigationController?.popViewController(animated: true)
        })
        
        return alert
    }
}
