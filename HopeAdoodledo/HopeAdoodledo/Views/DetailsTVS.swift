//
//  Untitled.swift
//  HopeAdoodledo
//
//  Created by Shubhransh Gupta on 15/01/25.
//
import UIKit

final class DetailsTVS: UITableViewCell, ViewDecoratorDelegate {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 6
        return stackView
    }()
    
    private var title: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    private var subtitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)  {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(subtitle)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        
    }
    
    private func configCell(title: String, subtitle: String) {
        DispatchQueue.main.async { [weak self] in
            self?.subtitle.text = subtitle
            self?.title.text = title
        }
    }
    
    func didUpdateCellContent(for driver: Driver) {
        configCell(title: String(driver.id ?? 0), subtitle: driver.title ?? "")
    }
    
    func didUpdateCellContent(for user: User) {
        configCell(title: String(user.id ?? 0), subtitle: user.title ?? "")
    }

}
