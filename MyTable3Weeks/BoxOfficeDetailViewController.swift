//
//  BoxOfficeDetailViewController.swift
//  MyTable3Weeks
//
//  Created by bro on 2022/05/04.
//

import UIKit

class BoxOfficeDetailViewController: UIViewController, UITextViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let pickerList: [String] = ["감자", "고구마", "파인애플", "자두", "감"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        titleTextField.text = pickerList[row]
        print(row)
    }
    

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var overViewTextVIew: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //TextField inputView
        let pickerView = UIPickerView()
        //pickerView.preferredDatePickerStyle = .wheels
        pickerView.delegate = self
        pickerView.dataSource = self
        
        titleTextField.inputView = pickerView
        
        overViewTextVIew.delegate = self
        //텍스트뷰 플레이스홀더 : 글자 , 색상 설정
        overViewTextVIew.text = "이 곳에 줄거리를 남겨보세요"
        overViewTextVIew.textColor = .lightGray
    }
    
    
    //커서 시작
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    //커서 끝
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "이 곳에 줄거리를 남겨보세요"
            textView.textColor = .lightGray
        }
    }
    
    

 
}
