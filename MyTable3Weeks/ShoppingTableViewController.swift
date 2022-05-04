//
//  ShoppingTableViewController.swift
//  MyTable3Weeks
//
//  Created by bro on 2022/05/03.
//

import UIKit

class ShoppingTableViewController: UITableViewController {
    
    
    @IBOutlet weak var headerViewBackground: UIView!
    @IBOutlet weak var addTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    let userDefaults = UserDefaults.standard
    
//    var shoppinglist: [String] = ["그립톡 구매", "사이다 구매", "아이패드 케이스", "양말"] {
//        didSet {
//            tableView.reloadData()
//        }
//    }
    
    var shoppinglist: [ShoppingMemo] = [] {
        didSet {
            saveData()
            tableView.reloadData()
        }
    }
    
    func loadData() {
        if let data = userDefaults.object(forKey: "shoppingList") as? [[String:String]] {
            
            var shoppingItems = [ShoppingMemo]()
            
            for datum in data {
                guard let item = datum["shoppingItem"] else {
                    return
                }
                
                shoppingItems.append(ShoppingMemo(shoppingItem: item))
            }
            
            self.shoppinglist = shoppingItems
        }
    }
    
    func saveData() {
        var shoppingMemoList: [[String:String]] = []
        
        for i in shoppinglist {
            let data : [String:String] = [
                "shoppingItem": i.shoppingItem
            ]
            
            shoppingMemoList.append(data)
        }
        
        userDefaults.set(shoppingMemoList, forKey: "shoppingList")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewConfig()
        loadData()
                
    }
    
    func setViewConfig() {
        headerViewBackground.backgroundColor = .systemGray2
        headerViewBackground.layer.cornerRadius = 10
    }
    

    // MARK: - Table view data source
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return shoppinglist.count
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        if indexPath.section == 0 {
            //Early Exit
            guard let purchaseCell = tableView.dequeueReusableCell(withIdentifier: "PurchaseTableViewCell", for: indexPath) as? PurchaseTableViewCell else { return UITableViewCell() }
            return purchaseCell
        }else {
            guard let shoppingCell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as? ShoppingTableViewCell else { return UITableViewCell() }
            shoppingCell.shoppingLabel.text = shoppinglist[indexPath.row].shoppingItem
            return shoppingCell
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.section == 0 {
//            return 60
//        } else {
//            return 80
//        }
        return UITableView.automaticDimension
        //return 80
    }

    @IBAction func saveButtonClicked(_ sender: UIButton) {
        
        guard let text = addTextField.text else {
            showAlert()
            return
        }
        
        shoppinglist.append(ShoppingMemo(shoppingItem: text))
        view.endEditing(true)
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "에러!", message: "구매항목을 입력해주세요!", preferredStyle: .alert)
        let ok = UIAlertAction(title: "예", style: .default, handler: nil)
        alert.addAction(ok)
        
        present(alert, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            shoppinglist.remove(at: indexPath.row)
        }
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
