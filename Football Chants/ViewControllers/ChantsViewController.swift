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
    
    // MARK: Lifecycle
    override func loadView() {
        super.loadView()
        setUp()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBlue
        // Do any additional setup after loading the view.
    }
    

}

private extension ChantsViewController {
    func setUp() {
        
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

extension ChantsViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        switch indexPath.row {
            case 0 :
                cell.backgroundColor = .systemRed
            case 1:
                cell.backgroundColor = .systemCyan
            case 3:
                cell.backgroundColor = .systemPink
            default :
                break
        }
        
        return cell
    }
}
