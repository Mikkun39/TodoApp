//
//  AddToDoViewController.swift
//  TodoApp
//
//  Created by 高山瑞基 on 2020/09/21.
//  Copyright © 2020 Takayama Mizuki. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var contentTextField: UITextField!
    var saveData: UserDefaults = UserDefaults()
    
    var contentNumber: Int = 0
    
    //メモを入れるための配列
    var toDoMemoArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        contentTextField.delegate = self
        
        contentNumber = saveData.object(forKey: "number") as? Int ?? 0
        
    }
    
    @IBAction func save() {
        //配列に追加
        toDoMemoArray.append(contentTextField.text!)
        
        //UserDefalutsに追加
        UserDefaults.standard.set(toDoMemoArray,forKey: "\(contentNumber)")
        print(contentNumber)
    
        //コンテンツナンバーをプラスして値を保存
        contentNumber += 1
        
        UserDefaults.standard.set(contentNumber, forKey: "number")
        
        //テキストを空に
        contentTextField.text = ""

        self.dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
