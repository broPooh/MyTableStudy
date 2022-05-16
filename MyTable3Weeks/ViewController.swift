//
//  ViewController.swift
//  MyTable3Weeks
//
//  Created by bro on 2022/05/04.
//

import UIKit

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func memoButtonClicked(_ sender: UIButton) {
        //1. 스토리보드 특정
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        //2. 스토리보드 내 많은 뷰 컨트롤러 중, 전환하고자 하는 뷰 컨트롤러 가져오기
        let vc = storyboard.instantiateViewController(withIdentifier: "MemoTableViewController") as! MemoTableViewController
        
        
        //2-1 네비게이션 컨트롤러 임베드
        let nav = UINavigationController(rootViewController:  vc)
        
        
        //(옵션)
        //vc.modalTransitionStyle = .coverVertical //디폴트
        //vc.modalTransitionStyle = .flipHorizontal
        //vc.modalTransitionStyle = .crossDissolve
        //nav.modalTransitionStyle = .partialCurl // 풀 스크린인 경우에만 사용할 수 있따.
        
        nav.modalPresentationStyle = .fullScreen
        
        //3. Present
        self.present(nav, animated: true, completion: nil)
    }
    

    //push - pop
    @IBAction func boxOfficeButtonClicked(_ sender: Any) {
        //1. 스토리보드 특정
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        //2. 스토리보드 내 많은 뷰 컨트롤러 중, 전환하고자 하는 뷰 컨트롤러 가져오기
        let vc = storyboard.instantiateViewController(withIdentifier: "BoxOfficeTableViewController") as! BoxOfficeTableViewController
        
        //Pass Data3
        vc.titleSpace = "박스오피스"
        
        //3. Push : 스토리보드에서 네비게이션 컨트롤러가 임베드 되어있는지 확인하기.!
        // 메인에 네비게이션 컨트롤러가 없기 때문에 코드로 이동하라고 해도 절대 이동이 불가능핟.!
        // 스토리보드와 코드의 화면전환은 동일하게 연결되어야 한다.
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
