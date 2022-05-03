//
//  BoxOfficeTableViewController.swift
//  MyTable3Weeks
//
//  Created by bro on 2022/05/03.
//

import UIKit

class BoxOfficeTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //타입 캐스팅
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BoxOfficeTableViewCell", for: indexPath) as? BoxOfficeTableViewCell else { return UITableViewCell()}
        
        cell.posterImageView.backgroundColor  = .blue
        cell.titleLabel.text = "7번방의 선물"
        cell.releaseDateLabel.text = "2020.02.02"
        cell.overviewLabel.text = "영화 줄거리가 보이는 곳입니다. 영화 줄거리가 보이는 곳입니다. 영화 줄거리가 보이는 곳입니다. 영화 줄거리가 보이는 곳입니다. 영화 줄거리가 보이는 곳입니다. 영화 줄거리가 보이는 곳입니다. 영화 줄거리가 보이는 곳입니다. 영화 줄거리가 보이는 곳입니다. 영화 줄거리가 보이는 곳입니다. 영화 줄거리가 보이는 곳입니다. 영화 줄거리가 보이는 곳입니다. 영화 줄거리가 보이는 곳입니다. 영화 줄거리가 보이는 곳입니다."
        cell.overviewLabel.numberOfLines = 0
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 6
    }

}
