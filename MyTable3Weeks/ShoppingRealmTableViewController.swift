//
//  ShoppingRealmTableViewController.swift
//  MyTable3Weeks
//
//  Created by bro on 2022/05/16.
//

import UIKit
import RealmSwift

class ShoppingRealmTableViewController: UITableViewController {

    
    @IBOutlet weak var headerViewBackground: UIView!
    @IBOutlet weak var addTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    let localRealm = try! Realm()
    let userDefaults = UserDefaults.standard
    
    
    var shoppingItems: Results<Shopping>! {
        didSet {
            tableView.reloadData()
        }
    }
    
    func loadRealmData(){
        shoppingItems = localRealm.objects(Shopping.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewConfig()
                        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadRealmData()
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
            return shoppingItems.count
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        if indexPath.section == 0 {
            //Early Exit
            guard let purchaseCell = tableView.dequeueReusableCell(withIdentifier: "PurchaseTableViewCell", for: indexPath) as? PurchaseTableViewCell else { return UITableViewCell() }
            return purchaseCell
        }else {
            guard let shoppingCell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as? ShoppingTableViewCell else { return UITableViewCell() }
            shoppingCell.shoppingLabel.text = shoppingItems[indexPath.row].title
            return shoppingCell
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    @IBAction func saveButtonClicked(_ sender: UIButton) {
        
        guard let text = addTextField.text else {
            showAlert()
            return
        }
        
        let item = Shopping(title: text)
        
        try! localRealm.write {
            localRealm.add(item)
        }
        
        loadRealmData()
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
            
            let deleteItem = shoppingItems[indexPath.row]
            try! localRealm.write {
                localRealm.delete(deleteItem)
                loadRealmData()
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
