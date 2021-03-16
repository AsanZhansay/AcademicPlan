//
//  AcademicTableView.swift
//  AcademicPlan
//
//  Created by Asanali Zhansay on 16.03.2021.
//

import UIKit

class AcademicTableView: UICollectionView {
    
    private var layout: StickyGridCollectionViewLayout!
    private var lessonItems: [LessonItem] = [
        LessonItem(type: .lecture, name: "Лекция"),
        LessonItem(type: .seminar, name: "Семинар"),
        LessonItem(type: .laboratory, name: "Лаборат.")
    ]
    
    var disciplines: [Discipline]? {
        didSet {
            reloadData()
        }
    }
    
    init(frame: CGRect = .zero, collectionViewLayout layout: StickyGridCollectionViewLayout = StickyGridCollectionViewLayout()) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.layout = layout
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .lightGray
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        bounces = false
        dataSource = self
        delegate = self
        registerCell(СolumnTitleCell.self)
        registerCell(RowTitleCell.self)
        registerCell(RowValueCell.self)
    }
}

// MARK: - Collection view data source
extension AcademicTableView: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let count = disciplines?.count else { return 0 }
        
        return count + 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return LessonType.allCases.count + 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if self.layout.isItemCrossStickies(at: indexPath) {
            let cell = collectionView.dequeueCell(RowTitleCell.self, indexPath: indexPath)
            cell.titleColor = .lightBlue
            cell.title = "Наименование дисциплины"
            
            return cell
        } else if self.layout.isColumnItemSticky(at: indexPath) {
            let cell = collectionView.dequeueCell(RowTitleCell.self, indexPath: indexPath)
            let discipline = disciplines?[indexPath.section-1]
            cell.title = discipline?.disciplineName?.nameRu

            return cell
        } else if self.layout.isRowItemSticky(at: indexPath) {
            let cell = collectionView.dequeueCell(СolumnTitleCell.self, indexPath: indexPath)
            let lessonItem = lessonItems[indexPath.row-1]
            cell.title = lessonItem.name

            return cell
        } else {
            let cell = collectionView.dequeueCell(RowValueCell.self, indexPath: indexPath)
            let discipline = disciplines?[indexPath.section-1]
            let lessonItem = lessonItems[indexPath.row-1]
            
            let lesson = discipline?.lessons?.filter({ $0.lessonTypeID == lessonItem.type.rawValue}).first
            cell.lesson = lesson
            
            return cell
        }
    }
}

// MARK: - Collection view delegate flow layout
extension AcademicTableView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if self.layout.isColumnItemSticky(at: indexPath) {
            return CGSize(width: UIScreen.main.bounds.width*0.45, height: 60)
        } else if self.layout.isRowItemSticky(at: indexPath) {
            return CGSize(width: 110, height: 60)
        } else {
            return CGSize(width: 110, height: 60)
        }
    }
}
