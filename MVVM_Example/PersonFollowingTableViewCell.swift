//
//  PersonFollowingTableViewCell.swift
//  MVVM_Example
//
//  Created by Akanksha pakhale on 15/09/21.
//

import UIKit

//protocol PersonFollowingTableViewCellDelegate: AnyObject {
//
//    func personFollowingTableViewCell(_ cell: PersonFollowingTableViewCell, didTapWith viewModel: PersonFollowingTableViewCellViewModel)
//}

class PersonFollowingTableViewCell: UITableViewCell {
   // weak var delegate: PersonFollowingTableViewCellDelegate?
    private var viewModel: PersonFollowingTableViewCellViewModel?
  static let identifier = "PersonFollowingTableViewCell"
    
    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let usernamelabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        return label
    }()
    private let namelabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        return label
    }()
    private let button: UIButton = {
        let button = UIButton()
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(usernamelabel)
        contentView.addSubview(namelabel)
        contentView.addSubview(button)
        contentView.addSubview(userImageView)
        contentView.clipsToBounds = true
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    @objc private func didTapButton(){
        guard let viewModel = viewModel else {
            return
        }
        var newViewModel = viewModel
        newViewModel.currentlyFollowing = !viewModel.currentlyFollowing
        //delegate?.personFollowingTableViewCell(self, didTapWith: newViewModel)
        prepareForReuse()
        configure(with: newViewModel)
    }
    
    func configure(with viewModel: PersonFollowingTableViewCellViewModel){
        self.viewModel = viewModel
        namelabel.text = viewModel.name
        usernamelabel.text = viewModel.username
        userImageView.image = viewModel.image
        
        if viewModel.currentlyFollowing {
            button.setTitle("UnFollow", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
            
        } else {
            button.setTitle("Follow", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .link
        }
        
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageWidth = contentView.frame.size.height - 10
        userImageView.frame = CGRect(x: 5, y: 5, width: imageWidth, height: imageWidth)
        namelabel.frame = CGRect(x: imageWidth + 10, y: 0, width: contentView.frame.size.width - imageWidth, height: contentView.frame.size.height/2)
        usernamelabel.frame = CGRect(x: imageWidth + 10, y: contentView.frame.size.height/2, width: contentView.frame.size.width - imageWidth, height: contentView.frame.size.height/2)
        button.frame = CGRect(x: contentView.frame.size.width - 120, y: 10, width: 110, height: contentView.frame.size.height - 20)
     
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

}
