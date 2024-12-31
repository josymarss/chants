//
//  TeamTableViewCell.swift
//  Football Chants
//
//  Created by Josymarss on 30/12/24.
//

import UIKit

protocol TeamTableViewCellProtocol: AnyObject {
    func didTapPlay(team: Team)
}

class TeamTableViewCell: UITableViewCell {
    static let cellId = "cell"
    
    private lazy var containerView: UIView = {
        let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        stackView.axis = .vertical
        
        return stackView
    }()
    
    private lazy var badge: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    private lazy var playbutton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        return button
    }()
    
    private lazy var nameLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.numberOfLines = 0
        lb.font = .systemFont(ofSize: 18, weight: .bold)
        lb.textColor = .white
        return lb
    }()
    
    private lazy var foundedLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.numberOfLines = 0
        lb.font = .systemFont(ofSize: 12, weight: .light)
        lb.textColor = .white
        return lb
    }()
   
    
    private lazy var jobLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.numberOfLines = 0
        lb.font = .systemFont(ofSize: 10, weight: .light)
        lb.textColor = .white
        return lb
    }()
    
    private lazy var infoLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.numberOfLines = 0
        lb.font = .systemFont(ofSize: 12, weight: .medium)
        lb.textColor = .white
        return lb
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.cornerRadius = 10
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        self.delegate = nil
        self.team = nil
        
        containerView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    private weak var delegate: TeamTableViewCellProtocol?
    private var team: Team?
    
    func configure(with team: Team, delegate: TeamTableViewCellProtocol) {
        self.delegate = delegate
        self.team = team
        
        playbutton.addTarget(self, action: #selector(didTapPlay), for: .touchUpInside)
        
        containerView.backgroundColor = team.id.background
        
        badge.image = team.id.badge
        playbutton.setImage(team.isPlaying ? Assets.pause : Assets.play, for: .normal)
        nameLabel.text = team.name
        foundedLabel.text = team.founded
        jobLabel.text = "Current \(team.manager.job.rawValue): \(team.manager.name)"
        infoLabel.text = team.info
        
        self.contentView.addSubview(containerView)
        containerView.addSubview(contentStackView)
        containerView.addSubview(badge)
        containerView.addSubview(playbutton)
        
        contentStackView.addArrangedSubview(nameLabel)
        contentStackView.addArrangedSubview(foundedLabel)
        contentStackView.addArrangedSubview(jobLabel)
        contentStackView.addArrangedSubview(infoLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
            containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            
            badge.heightAnchor.constraint(equalToConstant: 50),
            badge.widthAnchor.constraint(equalToConstant: 50),
            badge.topAnchor.constraint(equalTo: contentStackView.topAnchor),
            badge.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            
            contentStackView.topAnchor.constraint(equalTo:containerView.topAnchor, constant: 16),
            contentStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            contentStackView.leadingAnchor.constraint(equalTo: badge.trailingAnchor, constant: 8),
            contentStackView.trailingAnchor.constraint(equalTo: playbutton.leadingAnchor, constant: -8),
            
            playbutton.heightAnchor.constraint(equalToConstant: 44),
            playbutton.widthAnchor.constraint(equalToConstant: 44),
            playbutton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            playbutton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8)
        ])

    }
    
    @objc
    func didTapPlay() {
        if let team = team {
            delegate?.didTapPlay(team: team)
        }
    }
}
