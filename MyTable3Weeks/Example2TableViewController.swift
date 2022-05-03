//
//  Example2TableViewController.swift
//  MyTable3Weeks
//
//  Created by bro on 2022/05/02.
//

import UIKit

class Example2TableViewController: UITableViewController {
    
    let firstSectionList : [String] = ["공지사항", "실험실", "버전 정보"]
    let secondSectionList : [String] = ["개인/보안", "알림", "채팅", "멀티프로필"]
    let thirdEectionList : [String] = ["고객센터/도움말"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return firstSectionList.count
        } else if section == 1 {
            return secondSectionList.count
        } else {
            return thirdEectionList.count
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "전체 설정"
        } else if section == 1 {
            return "개인 설정"
        } else {
            return "기타"
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Early Exit
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "exampleCell") else {
            return UITableViewCell()
        }
        
        if indexPath.section == 0 {
            cell.textLabel?.text = firstSectionList[indexPath.row]
        } else if indexPath.section == 1 {
            cell.textLabel?.text = secondSectionList[indexPath.row]
        } else {
            cell.textLabel?.text = thirdEectionList[indexPath.row]
        }
        
        return cell
    }
}
