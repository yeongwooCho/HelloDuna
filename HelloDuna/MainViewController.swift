//
//  MainViewController.swift
//  HelloDuna
//
//  Created by yeongwoocho on 2022/07/08.
//

import UIKit

class MainViewController: UIViewController {
    
    enum TextLabel {
        case name
        case description
        case chat
        case edit
        case story

        func text() -> String {
            switch self {
            case .name:
                return "듀나"
            case .description:
                return "⛴포항항"
            case .chat:
                return "나와의 채팅"
            case .edit:
                return "프로필 편집"
            case .story:
                return "카카오스토리"
            }
        }
    }
    
    let maxDimmedAlpha: CGFloat = 0.6
    
    // Constants
    let defaultHeight: CGFloat = UIScreen.main.bounds.height
    let dismissibleHeight: CGFloat = UIScreen.main.bounds.height / 2
    var currentContainerHeight: CGFloat = UIScreen.main.bounds.height
    
    // Dynamic container constraint
    var containerViewHeightConstraint: NSLayoutConstraint?
    var containerViewBottomConstraint: NSLayoutConstraint?
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorStyle.backgroundColor.color
        return view
    }()
    
    lazy var dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var closedButton: UIButton = {
        let button = UIButton()
        let buttonImage = UIImage(named: ImageLiteral.profileCloseImage)
        button.setImage(buttonImage, for: .normal)
        button.addTarget(self, action: #selector(closedButtonTapHandler), for: .touchUpInside)
        return button
    }()
    @objc private func closedButtonTapHandler(sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: ImageLiteral.profileImage)
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = TextLabel.name.text()
        label.textColor = ColorStyle.textColor.color
        label.font = UIFont.systemFont(ofSize: 22.0, weight: .medium)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = TextLabel.description.text()
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
        label.text = TextLabel.chat.text()
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
        label.text = TextLabel.edit.text()
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
        label.text = TextLabel.story.text()
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
        
        self.setupPanGesture()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.animatePresentContainer()
    }
    
    private func configureView() {
        guard let view = self.view else { return }
        
        view.backgroundColor = .clear
    }
    
    private func configureAddSubViews() {
        guard let view = self.view else { return }
        
        view.addSubview(dimmedView)
        view.addSubview(containerView)
        
        containerView.addSubview(closedButton)
        containerView.addSubview(profileImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(dividerView)
        containerView.addSubview(contentStackView)
        
        chatView.addSubview(chatButton)
        chatView.addSubview(chatLabel)
        editView.addSubview(editButton)
        editView.addSubview(editLabel)
        storyView.addSubview(storyButton)
        storyView.addSubview(storyLabel)
    }
    
    private func configureConstraints() {
        guard let view = self.view else { return }
        
        dimmedView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dimmedView.topAnchor.constraint(equalTo: view.topAnchor),
            dimmedView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            dimmedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dimmedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        containerViewHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: defaultHeight)
        containerViewBottomConstraint = containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: defaultHeight)
        containerViewHeightConstraint?.isActive = true
        containerViewBottomConstraint?.isActive = true
        
        closedButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closedButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 44),
            closedButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            closedButton.widthAnchor.constraint(equalToConstant: 44),
            closedButton.heightAnchor.constraint(equalToConstant: 44),
        ])
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 483),
            profileImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
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
            dividerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: dividerView.bottomAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            contentStackView.heightAnchor.constraint(equalToConstant: 142)
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

// MARK: Gesture & Animate
extension MainViewController {
    
    private func setupPanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture(gesture:)))
        panGesture.delaysTouchesBegan = false
        panGesture.delaysTouchesEnded = false
        view.addGestureRecognizer(panGesture)
    }
    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        
        let isDraggingDown = translation.y > 0
        
        let newHeight = currentContainerHeight - translation.y
        
        switch gesture.state {
        case .changed:
            containerViewHeightConstraint?.constant = newHeight
            view.layoutIfNeeded()
            
        case .ended:
            if newHeight < dismissibleHeight {
                self.animateDismissView()
            }
            else if newHeight < defaultHeight {
                self.animateContainerHeight(defaultHeight)
            }
            else if newHeight > defaultHeight && !isDraggingDown {
                self.animateContainerHeight(defaultHeight)
            }
        default:
            break
        }
    }
    
    private func animateContainerHeight(_ height: CGFloat) {
        UIView.animate(withDuration: 0.4) {
            self.containerViewHeightConstraint?.constant = height
            self.view.layoutIfNeeded()
        }
        currentContainerHeight = height
    }
    
    // MARK: Present and dismiss animation
    private func animatePresentContainer() {
        UIView.animate(withDuration: 0.3) {
            self.containerViewBottomConstraint?.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    private func animateDismissView() {
        dimmedView.alpha = maxDimmedAlpha
        UIView.animate(withDuration: 0.4) {
            self.dimmedView.alpha = 0
        } completion: { _ in
            self.dismiss(animated: false)
        }

        UIView.animate(withDuration: 0.3) {
            self.containerViewBottomConstraint?.constant = self.defaultHeight
            self.view.layoutIfNeeded()
        }
    }
    
}
