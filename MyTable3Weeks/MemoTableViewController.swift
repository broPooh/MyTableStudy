//
//  MemoTableViewController.swift
//  MyTable3Weeks
//
//  Created by bro on 2022/05/02.
//

import UIKit

class MemoTableViewController: UITableViewController {
    
    var list: [String] = ["장 보기", "메모", "영화 보러가기", "WWDC 시청"] {
        didSet {
            tableView.reloadData()
        }
    }

    @IBOutlet weak var memoTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func saveBtnClicked(_ sender: UIButton) {
        //배열에 텍스트뷰의 텍스트 값 추가
        if let text = memoTextView.text {
            list.append(text)
            //tableView.reloadData()
            print(list)
        } else {
            print("")
        }
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
        } else {
            cell.textLabel?.text = list[indexPath.row]
            cell.textLabel?.textColor = .blue
            cell.textLabel?.font = .boldSystemFont(ofSize: 12)
        }
        
        return cell
    }
    
    //(옵션) 셀을 클릭했을 때 기능
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row + 1)번째 셀 클릭")
    }
    
    //3. (옵션)셀의 높이 : heightForRowAt 디폴트는 44
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
        //return indexPath.section == 0 ? 44 : 80
        
        return indexPath.row == 0 ? 44 : 88
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
