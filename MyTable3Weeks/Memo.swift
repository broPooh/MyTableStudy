//
//  Memo.swift
//  MyTable3Weeks
//
//  Created by bro on 2022/05/03.
//

import Foundation


enum MemoCategory: Int {
    case business, personal, others
    
    //자동완성 기능은 xCode 13부터 추가 된 것으로 알고있다
    var description: String {
        switch self {
        case .business:
            return "업무"
        case .personal:
            return "개인"
        case .others:
            return "기타"
        }
    }
}

struct Memo {
    var content: String
    var category: MemoCategory
}


