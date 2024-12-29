//
//  ChantsViewController.swift
//  Football Chants
//
//  Created by Josymarss on 29/12/24.
//

import UIKit

class ChantsViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.rowHeight = UITableView.automaticDimension
        tv.estimatedRowHeight = 44
        tv.backgroundColor = .clear
        tv.separatorStyle = .none
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBlue
        // Do any additional setup after loading the view.
    }
    

}
