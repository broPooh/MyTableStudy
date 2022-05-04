
//
//  BoxOfficeTableViewController.swift
//  MyTable3Weeks
//
//  Created by bro on 2022/05/03.
//

import UIKit

class BoxOfficeTableViewController: UITableViewController {
    
    let movieInformation = MovieInformation()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "닫기", style: .plain, target: self, action: #selector(closeButtonClicked))
    }
    
    @objc func closeButtonClicked() {
        //push - pop
        //push하고 Dissmiss로 하면 닫히지 않는다.
        self.navigationController?.popViewController(animated: true)
        
        //self.dismiss(animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movieInformation.movie.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //타입 캐스팅
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BoxOfficeTableViewCell.identifier, for: indexPath) as? BoxOfficeTableViewCell else { return UITableViewCell()}
        
        
        //백틱 키를 활용해서 예약어, keyword도 변수명으로 사용이 가능하다.
        let `switch` = "asd"
        
        let row = movieInformation.movie[indexPath.row]
        
        cell.posterImageView.backgroundColor  = .blue
        cell.titleLabel.text = row.title
        cell.releaseDateLabel.text = row.releaseDate
        cell.overviewLabel.text = row.overview
        cell.posterImageView.image = UIImage(named: row.title)
        cell.overviewLabel.numberOfLines = 0
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //return UIScreen.main.bounds.height / 6
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let sb = UIStoryboard(name: "Movie", bundle: nil)
        
        guard let vc = sb.instantiateViewController(withIdentifier: "BoxOfficeDetailViewController") as? BoxOfficeDetailViewController else {
            print("Error") // 에러 문구 혹은 얼럿으로 처리
            return
        }
        
//        let vc = sb.instantiateViewController(withIdentifier: "BoxOfficeDetailViewController") as! BoxOfficeDetailViewController
        
        self.navigationController?.pushViewController(vc, animated: true )
        
        
    }

}
