//
//  ViewController.swift
//

import UIKit

class ViewController: UIViewController {
    
    struct Item {
        let image: UIImage
        let title: String
        let subtitle: String?
        let price: String?
        let likeCount: Int?
    }
    
    
    func safeImage(systemName: String) -> UIImage {
        if let image = UIImage(systemName: systemName) {
            return image
        } else {
            return UIImage()
        }
    }
    
    lazy var items1: [Item] = [
        Item(image: safeImage(systemName: "wallet.pass"), title: "모던 지갑", subtitle: "프리미엄 가죽 제품", price: "1,500원", likeCount: 25),
        Item(image: safeImage(systemName: "bed.double"), title: "이중 침대", subtitle: "편안한 잠을 위해", price: "200,000원", likeCount: 13),
        Item(image: safeImage(systemName: "tv"), title: "스마트 티비", subtitle: "고화질 4K 해상도", price: "300,000원", likeCount: 8),
        Item(image: safeImage(systemName: "headphones"), title: "프리미엄 헤드폰", subtitle: "고급 오디오 품질", price: "100,000원", likeCount: 40)
    ]
    
    lazy var items2: [Item] = [
        Item(image: safeImage(systemName: "fork.knife"), title: "스테인리스 식기세트", subtitle: "우아한 디자인", price: "30,000원", likeCount: 15),
        Item(image: safeImage(systemName: "cup.and.saucer"), title: "세라믹 컵 세트", subtitle: "고급 차 컬렉션", price: "45,000원", likeCount: 22),
        Item(image: safeImage(systemName: "tray"), title: "우드 서빙 트레이", subtitle: "자연스러운 분위기", price: "25,000원", likeCount: 30),
        Item(image: safeImage(systemName: "blender"), title: "고성능 믹서기", subtitle: "강력한 모터", price: "150,000원", likeCount: 5)
    ]
    
    lazy var items3: [Item] = [
        Item(image: safeImage(systemName: "laptopcomputer"), title: "최신형 노트북", subtitle: "빠르고 강력한 성능", price: "2,000,000원", likeCount: 18),
        Item(image: safeImage(systemName: "printer"), title: "무선 프린터", subtitle: "편리한 무선 인쇄", price: "150,000원", likeCount: 11),
        Item(image: safeImage(systemName: "gamecontroller"), title: "게임 컨트롤러", subtitle: "혁신적인 조작감", price: "80,000원", likeCount: 34),
        Item(image: safeImage(systemName: "camera"), title: "디지털 카메라", subtitle: "고화질 사진 촬영", price: "500,000원", likeCount: 21)
    ]
    
    
    
    var collectionView0: UICollectionView!
    var collectionView1: UICollectionView!
    var collectionView2: UICollectionView!
    lazy var stackView: UIStackView = {
            let sv = UIStackView()
            sv.axis = .vertical
            sv.distribution = .fill
            sv.alignment = .fill
            sv.spacing = 10
            sv.translatesAutoresizingMaskIntoConstraints = false
            return sv
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView0 = createCollectionView(scrollDirection: .vertical)
        collectionView1 = createCollectionView(scrollDirection: .horizontal)
        collectionView2 = createCollectionView(scrollDirection: .vertical)
        
        stackView.addArrangedSubview(collectionView0)
        stackView.addArrangedSubview(collectionView1)
        stackView.addArrangedSubview(collectionView2)
                
        
        collectionView0.register(VerticalCollectionViewCell.self, forCellWithReuseIdentifier: "VerticalCollectionViewCell")
        collectionView1.register(HorizontalCollectionViewCell.self, forCellWithReuseIdentifier: "HorizontalCollectionViewCell")
        collectionView2.register(VerticalCollectionViewCell.self, forCellWithReuseIdentifier: "VerticalCollectionViewCell")
        
        collectionView0.dataSource = self
        collectionView0.delegate = self
        collectionView1.dataSource = self
        collectionView1.delegate = self
        collectionView2.dataSource = self
        collectionView2.delegate = self
        
        view.addSubview(stackView)

        
        
        stackView.spacing = 10
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        configureCollectionViews()
    }
    private func configureCell(collectionView: UICollectionView, indexPath: IndexPath, item: Item) -> UICollectionViewCell {
        if collectionView == collectionView1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorizontalCollectionViewCell", for: indexPath) as? HorizontalCollectionViewCell else {
                fatalError("Unable to dequeue HorizontalCollectionViewCell")
            }
            // Configure HorizontalCollectionViewCell
            cell.imageView.image = item.image
            cell.titleLabel.text = item.title
            cell.priceLabel.text = item.price
            if let likeCount = item.likeCount {
                cell.likeCountLabel.text = "\(likeCount)"
            }
            cell.imageView.contentMode = .scaleAspectFit
            cell.setNeedsLayout()
            return cell
        } else {
            // collectionView0 and collectionView2 use VerticalCollectionViewCell
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VerticalCollectionViewCell", for: indexPath) as? VerticalCollectionViewCell else {
                fatalError("Unable to dequeue VerticalCollectionViewCell")
            }
            // Configure VerticalCollectionViewCell
            cell.imageView.image = item.image
            cell.titleLabel.text = item.title
            cell.priceLabel.text = item.price
            if let likeCount = item.likeCount {
                cell.likeCountLabel.text = "\(likeCount)"
            }
            cell.imageView.contentMode = .scaleAspectFit
            cell.setNeedsLayout()
            return cell
        }
    }

    
    private func createCollectionView(scrollDirection: UICollectionView.ScrollDirection) -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scrollDirection
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }
    
    private func configureCollectionViews() {
        let totalAvailableHeight = view.frame.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom - (stackView.spacing * 2)
        let heightForCollectionView1: CGFloat = 200 // Fixed height for horizontal collectionView
        let heightForCollectionView0And2 = (totalAvailableHeight - heightForCollectionView1) / 2 // Remaining height split between the two vertical collection views
        
        collectionView0.translatesAutoresizingMaskIntoConstraints = false
        collectionView1.translatesAutoresizingMaskIntoConstraints = false
        collectionView2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView0.heightAnchor.constraint(equalToConstant: heightForCollectionView0And2),
            collectionView1.heightAnchor.constraint(equalToConstant: heightForCollectionView1),
            collectionView2.heightAnchor.constraint(equalToConstant: heightForCollectionView0And2)
        ])
        
        // Adjust contentInset if necessary to avoid overlapping
        collectionView0.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        collectionView1.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        collectionView2.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        
        collectionView0.backgroundColor = .white
        collectionView1.backgroundColor = .white
        collectionView2.backgroundColor = .white
    }
}

// Conforming to UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case collectionView0:
            return items1.count
        case collectionView1:
            return items2.count
        case collectionView2:
            return items3.count
        default:
            return 0
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item: Item
        
        switch collectionView {
        case collectionView0:
            item = items1[indexPath.row]
        case collectionView1:
            item = items2[indexPath.row]
        case collectionView2:
            item = items3[indexPath.row]
        default:
            fatalError("Unexpected Collection View")
        }
        
        return configureCell(collectionView: collectionView, indexPath: indexPath, item: item)
    }

}

// Conforming to UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionView1 {
            // Size for horizontal scrolling cells in collectionView1
            return CGSize(width: 200, height: collectionView.frame.height)
        } else {
            // Full width for vertical scrolling cells in collectionView0 and collectionView2
            let width = collectionView.frame.width - collectionView.contentInset.left - collectionView.contentInset.right
            let height: CGFloat = 300 // Fixed height or calculate dynamically
            return CGSize(width: width, height: height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10 // Adjust line spacing as needed
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10 // Adjust inter item spacing as needed
    }
    
}


