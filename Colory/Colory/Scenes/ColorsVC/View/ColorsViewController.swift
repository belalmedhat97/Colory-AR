//
//  ColorsViewController.swift
//  Colory
//
//  Created by belal medhat on 31/01/2023.
//

import UIKit
import Combine
class ColorsViewController: UIViewController {
    private var cancellableBag = Set<AnyCancellable>()
    var vm:ColorsVCModel?
    private var colorsDataSource:[ColorsModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        vm = ColorsVCModel(reader: ColorsManager())
        vm?.getColors()
        bindDataSource()
        // Do any additional setup after loading the view.
    }
    func bindDataSource(){
        vm?.$colorsData.sink(receiveValue: { [weak self] data in
            print(data[0].name ?? "")
            self?.colorsDataSource = data
            self?.colorsCollection.reloadData()
        }).store(in: &cancellableBag)
    }
    @IBOutlet weak var colorsCollection: UICollectionView! {
        didSet {
            colorsCollection.delegate = self
            colorsCollection.dataSource = self
            colorsCollection.register(UINib(nibName: "ColorsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ColorsCollectionViewCell")
        }

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ColorsViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        colorsDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = colorsCollection.dequeueReusableCell(withReuseIdentifier: "ColorsCollectionViewCell", for: indexPath) as! ColorsCollectionViewCell
        cell.setCellData(bgColor: colorsDataSource[indexPath.item].hex ?? "", name: colorsDataSource[indexPath.item].name ?? "", hex: colorsDataSource[indexPath.item].hex ?? "")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width/3, height: self.view.frame.height/4)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return  20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
}

