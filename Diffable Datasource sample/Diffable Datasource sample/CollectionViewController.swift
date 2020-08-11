//
//  CollectionViewController.swift
//  Diffable Datasource sample
//
//  Created by Shanmugapriya on 02/08/20.
//  Copyright © 2020 Mallow Technologies. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let reuseIdentifier = "CollectionViewCell"
    
    private var dataSource: UICollectionViewDiffableDataSource<ContactSection, Contact>?
    
    // MARK:- View life cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customiseCollectionview()
    }
    
    // MARK:- Custom methods
    
    /**Customise Collectionview*/
    func customiseCollectionview() {
        title = NSLocalizedString("Contact list", comment: "Contact list screen title")
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        createContactDataSource()
        updateCollectionViewModels()
    }
    
    /**Create mock data and update into Collectionview */
    func updateCollectionViewModels() {
        let model1 = Contact(id: 1, firstName: "Contact 1", lastName: "Contact 1", dateOfBirth: nil)
        let model2 = Contact(id: 2, firstName: "Contact 2", lastName: "Contact 2", dateOfBirth: nil)
        let model3 = Contact(id: 3, firstName: "Contact 3", lastName: "Contact 3", dateOfBirth: nil)
        let model4 = Contact(id: 4, firstName: "Contact 4", lastName: "Contact 4", dateOfBirth: nil)
        let model5 = Contact(id: 5, firstName: "Contact 5", lastName: "Contact 5", dateOfBirth: nil)
        let models =  [model1, model2, model3, model4, model5]
        update(models, animate: true)
    }
    
    /**Define diffable datasource for Collectionview with the help of cell provider and assign datasource to Collectionview */
    func createContactDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, contact in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier, for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
            cell.firstName.text = contact.firstName
            cell.lastName.text = contact.lastName
            return cell
        })
        collectionView.dataSource = dataSource
    }
    
    /**Create an empty new snapshot and add contact into that and apply updated snapshot into Collectionview's datasource */
    func add(_ contact: Contact, animate: Bool = true) {
        guard let dataSource = self.dataSource else { return }
        var snapshot = NSDiffableDataSourceSnapshot<ContactSection, Contact>()
        snapshot.appendSections([ContactSection.all])
        snapshot.appendItems([contact], toSection: ContactSection.all)
        dataSource.apply(snapshot, animatingDifferences: animate, completion: nil)
    }
    
    /**Update the contact list into current snapshot and apply updated snapshot into Collectionview's datasource */
    func update(_ contactList: [Contact], animate: Bool = true) {
        guard let dataSource = self.dataSource else { return }
        var snapshot = dataSource.snapshot()
        snapshot.appendSections([ContactSection.all])
        snapshot.appendItems(contactList, toSection: ContactSection.all)
        dataSource.apply(snapshot, animatingDifferences: animate, completion: nil)
    }
    
    /**Delete the contact from current snapshot and apply updated snapshot into Collectionview's datasource */
    func remove(_ contact: Contact, animate: Bool = true) {
        guard let dataSource = self.dataSource else { return }
        var snapshot = dataSource.snapshot()
        snapshot.deleteItems([contact])
        dataSource.apply(snapshot, animatingDifferences: animate, completion: nil)
    }   

}
