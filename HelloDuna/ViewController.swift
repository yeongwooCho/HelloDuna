//
//  ViewController.swift
//  HelloDuna
//
//  Created by yeongwoocho on 2022/07/08.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var closedButton: UIButton = {
        let button = UIButton()
        let buttonImage = UIImage(named: ImageLiteral.profileCloseImage)
        button.setImage(buttonImage, for: .normal)
        return button
    }()
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: ImageLiteral.profileImage)
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "듀나"
        label.textColor = ColorStyle.textColor.color
        label.font = UIFont.systemFont(ofSize: 22.0, weight: .medium)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "⛴포항항"
        label.textColor = ColorStyle.textColor.color
        label.font = UIFont.systemFont(ofSize: 15.0, weight: .medium)
        return label
    }()
    
    private lazy var dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorStyle.dividerColor.color
        return view
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [chatView, editView, storyView])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        return stack
    }()
    
    private lazy var chatView: UIView = {
        let view = UIView()
        return view
    }()
    private lazy var chatButton: UIButton = {
        let button = UIButton()
        let buttonImage = UIImage(named: ImageLiteral.profileTalkImage)
        button.setImage(buttonImage, for: .normal)
        return button
    }()
    private lazy var chatLabel: UILabel = {
        let label = UILabel()
        label.text = "나와의 채팅"
        label.textColor = ColorStyle.textColor.color
        label.font = UIFont.systemFont(ofSize: 0, weight: .medium)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private lazy var editView: UIView = {
        let view = UIView()
        return view
    }()
    private lazy var editButton: UIButton = {
        let button = UIButton()
        let buttonImage = UIImage(named: ImageLiteral.profileEditImage)
        button.setImage(buttonImage, for: .normal)
        return button
    }()
    private lazy var editLabel: UILabel = {
        let label = UILabel()
        label.text = "프로필 편집"
        label.textColor = ColorStyle.textColor.color
        label.font = UIFont.systemFont(ofSize: 0, weight: .medium)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private lazy var storyView: UIView = {
        let view = UIView()
        return view
    }()
    private lazy var storyButton: UIButton = {
        let button = UIButton()
        let buttonImage = UIImage(named: ImageLiteral.profileStoryImage)
        button.setImage(buttonImage, for: .normal)
        return button
    }()
    private lazy var storyLabel: UILabel = {
        let label = UILabel()
        label.text = "카카오스토리"
        label.textColor = ColorStyle.textColor.color
        label.font = UIFont.systemFont(ofSize: 0, weight: .medium)
        label.adjustsFontSizeToFitWidth = true
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
        
        view.backgroundColor = ColorStyle.backgroundColor.color
    }
    
    private func configureAddSubViews() {
        guard let view = self.view else { return }
        
        view.addSubview(closedButton)
        view.addSubview(profileImageView)
        view.addSubview(nameLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(dividerView)
        
        view.addSubview(contentStackView)
        chatView.addSubview(chatButton)
        chatView.addSubview(chatLabel)
        editView.addSubview(editButton)
        editView.addSubview(editLabel)
        storyView.addSubview(storyButton)
        storyView.addSubview(storyLabel)
    }
    
    private func configureConstraints() {
        guard let view = self.view else { return }
        
        closedButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closedButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            closedButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
        ])
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 9),
            nameLabel.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor)
        ])
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 7),
            descriptionLabel.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor)
        ])
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dividerView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 27),
            dividerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: dividerView.bottomAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            contentStackView.heightAnchor.constraint(equalToConstant: 108)
        ])
        
        chatView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chatView.widthAnchor.constraint(equalToConstant: 44),
            chatView.heightAnchor.constraint(equalToConstant: 44)
        ])
        chatButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chatButton.centerXAnchor.constraint(equalTo: chatView.centerXAnchor),
            chatButton.centerYAnchor.constraint(equalTo: chatView.centerYAnchor, constant: -10),
            chatButton.widthAnchor.constraint(equalToConstant: 44),
            chatButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        chatLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chatLabel.topAnchor.constraint(equalTo: chatButton.bottomAnchor),
            chatLabel.leadingAnchor.constraint(equalTo: chatButton.leadingAnchor),
            chatLabel.trailingAnchor
                .constraint(equalTo: chatButton.trailingAnchor)
        ])
        
        editView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            editView.widthAnchor.constraint(equalToConstant: 44),
            editView.heightAnchor.constraint(equalToConstant: 44)
        ])
        editButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            editButton.centerXAnchor.constraint(equalTo: editView.centerXAnchor),
            editButton.centerYAnchor.constraint(equalTo: editView.centerYAnchor, constant: -12),
            editButton.widthAnchor.constraint(equalToConstant: 44),
            editButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        editLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            editLabel.topAnchor.constraint(equalTo: editButton.bottomAnchor),
            editLabel.leadingAnchor.constraint(equalTo: editButton.leadingAnchor),
            editLabel.trailingAnchor
                .constraint(equalTo: editButton.trailingAnchor)
        ])
        
        storyView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            storyView.widthAnchor.constraint(equalToConstant: 44),
            storyView.heightAnchor.constraint(equalToConstant: 44)
        ])
        storyButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            storyButton.centerXAnchor.constraint(equalTo: storyView.centerXAnchor),
            storyButton.centerYAnchor.constraint(equalTo: storyView.centerYAnchor, constant: -12),
            storyButton.widthAnchor.constraint(equalToConstant: 44),
            storyButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        storyLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            storyLabel.topAnchor.constraint(equalTo: storyButton.bottomAnchor),
            storyLabel.leadingAnchor.constraint(equalTo: storyButton.leadingAnchor),
            storyLabel.trailingAnchor
                .constraint(equalTo: storyButton.trailingAnchor)
        ])
    }
    
}
