//
//  AcademicPlanVC.swift
//  AcademicPlan
//
//  Created by Asanali Zhansay on 15.03.2021.
//

import UIKit

class AcademicPlanVC: UIViewController {
    
    // MARK: Properties
    
    private var viewModel = AcademicPlanViewModel()
    
    // MARK: UI Components
    
    private lazy var academicYearLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var semesterControl: UISegmentedControl = {
        let control = UISegmentedControl()
        control.backgroundColor = UIColor.lightGray
        
        if #available(iOS 13.0, *) {
            control.selectedSegmentTintColor = UIColor.yellow
        } else {
            control.tintColor = UIColor.yellow
        }
        
        control.setTitleTextAttributes([ NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),
                                         NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        control.setTitleTextAttributes([ NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14),
                                         NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        
        control.addTarget(self, action: #selector(semesterChanged(control:)), for: .valueChanged)
        
        return control
    }()
    
    private lazy var tableView = AcademicTableView()
    
    // MARK: - Overridden: ParentClass
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        makeConstraints()
    }
}

// MARK: Methods
extension AcademicPlanVC {
    private func setData() {
        guard let object = viewModel.object else { return }
        
        // MARK: - Set title
        title = "Индивидуальный учебный план"
        
        // MARK: - Set academic year
        academicYearLabel.text = object.academicYear
        
        // MARK: - Setup semester control
        if let semesters = object.semesters, !semesters.isEmpty {
            for (index, semester) in semesters.enumerated() {
                let title = "Семестр \(semester.number ?? "")"
                semesterControl.insertSegment(withTitle: title, at: index, animated: false)
            }
            
            semesterControl.selectedSegmentIndex = 0
            updateTableData(index: 0)
        }
    }
    
    @objc
    private func semesterChanged(control: UISegmentedControl) {
        let index = control.selectedSegmentIndex
        updateTableData(index: index)
    }
    
    private func updateTableData(index: Int) {
        let disciplines = viewModel.object?.semesters?[index].disciplines
        tableView.disciplines = disciplines
    }
}

// MARK: UI Configuration
extension AcademicPlanVC {
    private func setupViews() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:
            UIColor.white]
        navigationController?.navigationBar.setGradientBackground(colors: [UIColor.darkOrange.cgColor, UIColor.orange.cgColor, UIColor.yellow.cgColor])
        
        view.backgroundColor = .white
        view.addSubview(academicYearLabel)
        view.addSubview(semesterControl)
        view.addSubview(tableView)
    }
    
    private func makeConstraints() {
        academicYearLabel.snp.makeConstraints { (m) in
            m.top.equalTo(20)
            m.left.equalTo(40)
            m.right.equalTo(-40)
        }
        
        semesterControl.snp.makeConstraints { (m) in
            m.top.equalTo(academicYearLabel.snp.bottom).offset(50)
            m.left.equalTo(10)
            m.right.equalTo(-10)
            m.height.equalTo(40)
        }
        
        tableView.snp.makeConstraints { (m) in
            m.top.equalTo(semesterControl.snp.bottom).offset(20)
            m.left.right.bottom.equalToSuperview()
        }
    }
}
