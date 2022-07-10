//
//  ListViewController.swift
//  HelloDuna
//
//  Created by yeongwoocho on 2022/07/10.
//

import UIKit

class ListViewController: UIViewController {

    private lazy var itemView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.darkGray.cgColor
        view.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(itemViewTapHandler))
        view.addGestureRecognizer(tapGesture)
        return view
    }()
    @objc private func itemViewTapHandler(_ sender: Any) {
        let mainVC = MainViewController()
        mainVC.modalPresentationStyle = .fullScreen
        present(mainVC, animated: true)
    }
    
    private lazy var profileImageView: UIImageView = {
        let image = UIImage(named: ImageLiteral.profileImage)
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "듀나"
        return label
    }()
    
    override func loadView() {
        self.view = UIView()
        
        configureView()
        configureAddSubViews()
        configureConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func configureView() {
        guard let view = self.view else { return }
        
        view.backgroundColor = .systemBackground
    }
    
    private func configureAddSubViews() {
        guard let view = self.view else { return }
        
        view.addSubview(itemView)
        itemView.addSubview(profileImageView)
        itemView.addSubview(nameLabel)
    }
    
    private func configureConstraints() {
        guard let view = self.view else { return }
        
        itemView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            itemView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            itemView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            itemView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            itemView.heightAnchor.constraint(equalToConstant: 75)
        ])
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: itemView.topAnchor, constant: 10),
            profileImageView.centerYAnchor.constraint(equalTo: itemView.centerYAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: itemView.leadingAnchor, constant: 10),
            profileImageView.widthAnchor.constraint(equalTo: profileImageView.heightAnchor)
        ])
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 20)
        ])
    }
    
}
