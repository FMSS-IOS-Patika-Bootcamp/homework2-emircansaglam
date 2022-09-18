//
//  ViewController.swift
//  Emircan-Saglam-Odev-2
//
//  Created by Emircan saglam on 15.09.2022.
//

import UIKit




class ViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    
    let newsTitleText = ["Ataşehir'de Silahlı Saldırı","Hemşireden İtiraf","Bilim İnsanları Açıkladı"]
    let image = ["silah.jpeg","hemsire.jpeg","bilim.jpeg"]
    let longText = ["Ataşehir'de bir kafede silahlı saldırıya uğrayan bir kişi yaralandı. Saldırganlar geldikleri araçla olay yerinden kaçarken, ağır yaralı Emre D. hastaneye kaldırıldı.","Çalıştığı hastanede ölüm döşeğindeki bir hastaya bakan hemşirenin işlediği akılalmaz suç İngiltere'de gündeme bomba gibi düştü. Zavallı adamın kredi kartını çalan hemşire pervasızca alışveriş yaparken yakayı ele verdi...","Bilim insanları, iktidarın 'inadına yapacağız' dediği tartışmalı Kanal İstanbul projesinin yol açabileceği sorunları Cumhuriyet'e değerlendirdi. Kanal İstanbul'un olası depremden etkileneceğini, can ve mal kaybına neden olacağını belirten Prof. Dr. Naci Görür, Kanal İstanbul deprem açısından aksi bir rol oynuyor dedi. "]
    let url = ["https://www.tgrthaber.com.tr/gundem-videolari/atasehirdeki-silahli-saldiri-ani-kamerada","https://www.hurriyet.com.tr/dunya/ingiltere-bu-olayi-konusuyor-olum-dosegindeki-hastasinin-kredi-kartini-calip-alisveris-yapti-41942999","https://www.cumhuriyet.com.tr/haber/bilim-insanlari-madde-madde-acikladi-kanal-istanbul-neden-yapilmamali-1826041"]
    var photo = [News]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        photoDownload()
        
    }
    
    
    func photoDownload() {
        for n in 0..<newsTitleText.count {
            photo.append(News(image: image[n], textTitle: newsTitleText[n], longText: longText[n], url: url[n]))
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newsCell", for: indexPath) as? NewsCollectionViewCell else { return UICollectionViewCell() }
            let photoArray = photo[indexPath.row]
            // 2
            cell.cellImage.image = UIImage(named: "\(photoArray.image)")
            // 3
            cell.cellLabel.text = photoArray.textTitle
            // 4
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let destinationVc = storyboard?.instantiateViewController(withIdentifier: "asadafas") as! DetailViewController
        let photoArray = photo[indexPath.row]
        destinationVc.image = photoArray.image
        destinationVc.titleText = photoArray.textTitle
        destinationVc.longText = photoArray.longText
        destinationVc.url = photoArray.url
        navigationController?.pushViewController(destinationVc, animated: true)
       
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)
}
 
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let gridLayout = collectionViewLayout as! UICollectionViewFlowLayout
    let widthPerItem = collectionView.frame.width / 2 - gridLayout.minimumInteritemSpacing
    return CGSize(width:widthPerItem, height:150)
}
}
