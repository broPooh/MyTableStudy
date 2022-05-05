//
//  MemoTableViewController.swift
//  MyTable3Weeks
//
//  Created by bro on 2022/05/02.
//

import UIKit

class MemoTableViewController: UITableViewController {
    
    // [Memo(content: "안녕", category: .others), Memo(content: "안녕", category: .others)]
    var list: [Memo] = [] {
        didSet {
            //tableView.reloadData()
            saveData()
        }
    }
    
    
    @IBOutlet weak var categorySegmentedControl: UISegmentedControl!
    @IBOutlet weak var memoTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonClicked))
        
        loadData()
        //UITableView.automaticDimension
    }
    
    
    @objc func closeButtonClicked() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveBtnClicked(_ sender: UIButton) {
        //배열에 텍스트뷰의 텍스트 값 추가
        if let text = memoTextView.text {
            
            let segmentIndex = categorySegmentedControl.selectedSegmentIndex // 0, 1, 2
            
            let segmentCategory = MemoCategory(rawValue: segmentIndex) ?? .others
            
            let memo = Memo(content: text, category: segmentCategory)
            
            list.append(memo)
            //tableView.reloadData()
            print(list)
        } else {
            print("")
        }
    }
    
    func loadData() {
        let userDefaults = UserDefaults.standard
        
        // [Memo(content: "안녕", category: .others), Memo(content: "안녕", category: .others)]
        if let data = userDefaults.object(forKey: "memoList") as? [[String:Any]] {
            
            var memo = [Memo]()
            
            for datum in data {
                
                // Memo(content: "안녕", category: .others)를 변환 => ["content": "안녕", "category": 2]
                guard let category = datum["category"] as? Int else { return }
                guard let content = datum["content"] as? String else { return }
                
                
                let enumCategory = MemoCategory(rawValue: category) ?? .others
                
                memo.append(Memo(content: content, category: enumCategory))
            }
            
            self.list = memo
            
        }
            
    }
    
    func saveData() {
        var memo: [[String:Any]] = []
        
        for i in list {
            // 딕셔너리를 요소로 가지고 있는 배열 -> 이 배열을 담을 수 있는 배열을 구성해서 유저디폴트에 저장
            let data: [String:Any] = [
                "category": i.category.rawValue,
                "content": i.content
            ]
            
            // ["content": "안녕", "category": 2]
            memo.append(data)
        }
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(memo, forKey: "memoList")
        
        tableView.reloadData()
//        [
//            ["content": "asdasdsa", "category": 8],
//            ["content": "asdasdsa", "category": 8]
//        ]
    }
    
    // 옵션: 섹션의 수 : NunumberOfSections (default는 1)
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // 옵션 : 섹션의 타이틀 : titleForHeaderInSection
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "섹션 타이틀"
    }
    
    
    //1. 셀의 갯수 : numberOfRowsInSection
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        if section == 0 {
//            return 2
//        } else {
//            return 4
//        }
        return section == 0 ? 2 : list.count
    }
    
    //2. 셀의 디자인 및 데이터 처리 : cellForRowAt
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Early Exit
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell") else {
            return UITableViewCell()
        }
        
        if indexPath.section == 0 {
            cell.textLabel?.text = "첫번째 섹션입니다. - \(indexPath)"
            cell.textLabel?.textColor = .brown
            cell.textLabel?.font = .boldSystemFont(ofSize: 15)
            cell.imageView?.image = nil
            cell.detailTextLabel?.text = nil
        } else {
            
            let memo = list[indexPath.row]
            
            switch memo.category {
            case .business : cell.imageView?.image = UIImage(systemName: "building.2")
            case .personal : cell.imageView?.image = UIImage(systemName: "person")
            case .others : cell.imageView?.image = UIImage(systemName: "square.and.pencil")
            }
            
            cell.textLabel?.text = memo.content
            cell.detailTextLabel?.text = memo.category.description
            cell.textLabel?.textColor = .blue
            cell.textLabel?.font = .boldSystemFont(ofSize: 12)
            
            cell.imageView?.tintColor = .red
        }
        
        return cell
    }
    
    //(옵션) 셀을 클릭했을 때 기능
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row + 1)번째 셀 클릭")
    }
    
    //3. (옵션)셀의 높이 : heightForRowAt 디폴트는 44
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
            
        //return indexPath.row == 0 ? 44 : 88
        return UITableView.automaticDimension
    }

    
    //(옵션) 셀 편집상태  EditingStyle
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if indexPath.section == 1 {
            if editingStyle == .delete {
                list.remove(at: indexPath.row)
                //tableView.reloadData()
            }
        }
    }
    
    // (옵션) 셀 스와이프 On/Off 여부 : canEditRowAt
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section == 0 ? false : true
    }

}
