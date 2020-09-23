//
//  ViewController.swift
//  TodoApp
//
//  Created by 高山瑞基 on 2020/09/21.
//  Copyright © 2020 Takayama Mizuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //ストーリーボード上で扱うTableViewを宣言
    @IBOutlet var table: UITableView!
    
    var toDoArray = [String]()
    
    var contentNumber: Int = 0
    
    var saveData: UserDefaults = UserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.dataSource = self
        table.delegate = self
        toDoArray = ["テスト", "勉強", "部活"]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        table.reloadData()
        
        loadNumber()
        
        loadMemo()

        print(toDoArray)
        
        print(contentNumber)
       }
    
    
    //セルの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoArray.count
    }

    //セルを取得して、セル付属のtextに表示する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = toDoArray[indexPath.row]
        
        return cell
    }
    
    @IBAction func AddMemo() {
        
    }
    
    func loadMemo() -> [String] {
        
        toDoArray = saveData.stringArray(forKey: "\(contentNumber ?? 0)") ?? [String]()
        
        return toDoArray
    }
    
    func loadNumber() -> Int {
        contentNumber = saveData.object(forKey: "number") as? Int ?? 0
        
        return contentNumber
    }
    
    //セルの編集許可
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }

    //スワイプしたセルを削除　※arrayNameは変数名に変更してください
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            toDoArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
            UserDefaults.standard.removeObject(forKey: "\(contentNumber)")
        }
    }

}

