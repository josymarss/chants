//
//  ChantsViewController.swift
//  Football Chants
//
//  Created by Josymarss on 29/12/24.
//

import UIKit

class ChantsViewController: UIViewController {
    private lazy var vm = TeamsViewModel()
    private lazy var audioManager = AudioManagerViewModel()
    
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.rowHeight = UITableView.automaticDimension
        tv.estimatedRowHeight = 44
        tv.backgroundColor = .clear
        tv.separatorStyle = .none
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "celli")
        tv.register(TeamTableViewCell.self, forCellReuseIdentifier: TeamTableViewCell.cellId)
        return tv
    }()
    
    // MARK: Lifecycle
    override func loadView() {
        super.loadView()
        setUp()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        // Do any additional setup after loading the view.
    }
    

}

private extension ChantsViewController {
    func setUp() {
        self.navigationController?.navigationBar.topItem?.title = "Fooball Chants"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
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
//        vm.teams.count
        vm.teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let team = vm.teams[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: TeamTableViewCell.cellId, for: indexPath) as! TeamTableViewCell
        
        cell.configure(with: team, delegate: self)
        
        return cell
    }
}

extension ChantsViewController: TeamTableViewCellProtocol {
    func didTapPlay(team: Team) {
        audioManager.playback(team)
        vm.playBackToggle(team: team)
        tableView.reloadData()
    }
}
