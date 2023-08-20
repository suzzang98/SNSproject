//
//  GenderVC.swift
//  SNSproject
//
//  Created by Woojun Lee on 2023/08/19.
//

import UIKit

class GenderVC: UIViewController {
    //MARK: - Properties
    
    
    enum Gender: String {
        case male, female, preferNotTosay
        case custom
        
    }
    
    let padding: CGFloat = 12
    
    let spacer: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        
        return view
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "This won't be part of your public profile"
        label.textColor = CustomColor.gray
        
        return label
        
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.register(GenderCell.self, forCellReuseIdentifier: GenderCell.identifier)
        tableView.contentInset = UIEdgeInsets(top: 0, left: padding, bottom: 0, right: 0)
        tableView.allowsMultipleSelection = false
        return tableView
    }()
    
    var dataSource: UITableViewDiffableDataSource<Int, Gender>?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
        configureDataSource()
        applySnapshot()
        
    }
    //MARK: - Actions
    
    @objc private func doneButtonTapped() {
        let gender = findGender()
        UserInfoRepository.shared.gender = gender.rawValue
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Helpers
    
    private func configureDataSource() {
        dataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier in
            let cell = GenderCell()
            if indexPath.row == 0 {
                tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
            }
            
            cell.label.text = itemIdentifier.rawValue
            return cell
        })
    }
    
    private func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, Gender>()
        snapshot.appendSections([1])
        snapshot.appendItems([.male, .female, .custom, .preferNotTosay])
        dataSource?.apply(snapshot)
    }
    
    //MARK: - UI
    
    private func configureUI() {
        configureSpacer()
        configureLabel()
        configureDoneButton()
        configureTableView()
    }
    
    private func configureSpacer() {
        view.addSubview(spacer)
        spacer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            spacer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            spacer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            spacer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            spacer.heightAnchor.constraint(equalToConstant: 0.5)
        ])
        
    }
    
    private func configureLabel() {
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            label.widthAnchor.constraint(equalToConstant: 300),
            label.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    
    private func configureDoneButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func findGender() -> Gender {
        if let index = tableView.indexPathForSelectedRow {
            let oldsnapshot = dataSource?.snapshot()
            let gender = oldsnapshot!.itemIdentifiers[index.row]
            return gender
            
        }
        
        return Gender.preferNotTosay
    }
}

extension GenderVC: UITableViewDelegate {
    
}
