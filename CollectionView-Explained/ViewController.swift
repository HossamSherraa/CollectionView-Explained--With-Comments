//
//  ViewController.swift
//  CollectionView-Explained
//
//  Created by Hossam on 3/6/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource {
   private lazy var collectionView = self.view as! UICollectionView
    let layout = UICollectionViewFlowLayout() // you should make a layout object as global value to make it changes based on layoutSubviews , or in prepare()
    
    override func loadView() {
           self.view = {
               let collection = UICollectionView(frame: .zero, collectionViewLayout: .init())
               collection.dataSource = self
               collection.delegate = self
               collection.backgroundColor = .white
//               collection.register(MyCell.self, forCellWithReuseIdentifier: "Cell")
//               collection.register(MyHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
               return collection
           }()
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.setCollectionViewLayout(.init(), animated: true ) //Change Layout with animation
        
        
        collectionView.setCollectionViewLayout(.init(), animated: true , completion: nil) //chnageLayout With completionBlock and animation
        
        
        collectionView.startInteractiveTransition(to: .init(), completion: nil)//returnValueOf->UICollectionViewTransitionLayout //
       // startInteractiveTransition , you can use it with pan getsureRecognizer , and you must update progress(maxValue 1) value , by state of the gestureMethod , or cancel it if needed , and you can remove this pan geasture after interActive done , and note that ,if the new layout have differet scroll direction , it will have a small lag in the end , so make the newLayout have the same scroll direction
       // func finishInteractiveTransition()
       // Tells the collection view to finish an interactive transition by installing the intended target layout.
       // func cancelInteractiveTransition()
       // Tells the collection view to abort an interactive transition and return to its original layout object.
        
        /***********************/
        
        //Interactive Movemet Of Item
        /**
         func beginInteractiveMovementForItem(at: IndexPath) -> Bool
         Initiates the interactive movement of the item at the specified index path.
         func updateInteractiveMovementTargetPosition(CGPoint)
         Updates the position of the item within the collection view’s bounds.
         func endInteractiveMovement()
         Ends interactive movement tracking and moves the target item to its new location.
         func cancelInteractiveMovement()
         */
        
        //To Use this you should make a long touch gesture and marke the position of the selected cell using indexPathInPoint function
        //update the posiiton of the selected cell in Change State Of The gesture
        //cancel or finish depending on the state of the gesture
        /***********************/
        
        
        
        /*Selection*/
        /**Names  of this method is enough*/
        /**
         var allowsMultipleSelection: Bool
         A Boolean value that determines whether users can select more than one item in the collection view.
         var indexPathsForSelectedItems: [IndexPath]?
         The index paths for the selected items.
         func selectItem(at: IndexPath?, animated: Bool, scrollPosition: UICollectionView.ScrollPosition)
         Selects the item at the specified index path and optionally scrolls it into view.
         func deselectItem(at: IndexPath, animated: Bool)
         Deselects the item at the specified index.
         */
        
        /*************/
       
        /**Locating Items and Views in the Collection View*/
        /**Names  of this method is enough*/
        /*
        func indexPathForItem(at: CGPoint) -> IndexPath?
        Returns the index path of the item at the specified point in the collection view.
        var indexPathsForVisibleItems: [IndexPath]
        An array of the visible items in the collection view.
        func indexPath(for: UICollectionViewCell) -> IndexPath?
        Returns the index path of the specified cell.
        func cellForItem(at: IndexPath) -> UICollectionViewCell?
        Returns the visible cell object at the specified index path.
        func indexPathsForVisibleSupplementaryElements(ofKind: String) -> [IndexPath]
        Returns the index paths of all visible supplementary views of the specified type.
        func supplementaryView(forElementKind: String, at: IndexPath) -> UICollectionReusableView?
        Returns the supplementary view at the specified index path.
        func visibleSupplementaryViews(ofKind: String) -> [UICollectionReusableView]
        Returns an array of the visible supplementary views of the specified kind.
*/
        
        /*********/
        
        /**names is enough*/
        /**
         func layoutAttributesForItem(at: IndexPath) -> UICollectionViewLayoutAttributes?
         Returns the layout information for the item at the specified index path.
         func layoutAttributesForSupplementaryElement(ofKind: String, at: IndexPath) -> UICollectionViewLayoutAttributes?
         Returns the layout information for the specified supplementary view.
         Scrolling an Item Into View
         func scrollToItem(at: IndexPath, at: UICollectionView.ScrollPosition, animated: Bool)
         Scrolls the collection view contents until the specified item is visible.
         Animating Multiple Changes to the Collection View
         func performBatchUpdates((() -> Void)?, completion: ((Bool) -> Void)?)
         Animates multiple insert, delete, reload, and move operations as a group.
         Reloading Content
         var hasUncommittedUpdates: Bool
         A Boolean value indicating whether the collection view contains drop placeholders or is reordering its items as part of handling a drop.
         func reloadData()
         Reloads all of the data for the collection view.
         func reloadSections(IndexSet)
         Reloads the data in the specified sections of the collection view.
         func reloadItems(at: [IndexPath])
         Reloads just the items at the specified index paths.
         Constants
         struct UICollectionView.ScrollPosition
         Constants that indicate how to scroll an item into the visible portion of the collection view.
         typealias UICollectionView.LayoutInteractiveTransitionCompletion
         The completion block called at the end of an interactive transition for a collection view.
         Type Properties
         class let elementKindSectionFooter: String
         class let elementKindSectionHeader: String
         Enumerations
         enum UICollectionView.ElementCategory
         Constants specifying the type of view.
         enum UICollectionView.ScrollDirection
         Constants indicating the direction of scrolling for the layout.

         
         */
    }
    
    
    
    /*DATA SOURCE **/
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return .init()
    }
    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        //you should impelent can move to make interactivly movments
        return false
    }
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        //you must update the value of the data source , you just need to swype values
    }
    
    func indexTitles(for collectionView: UICollectionView) -> [String]? {
        //you can return array of strings to be create easy scroll (like contacts app) A-Z
        return []
    }
    func collectionView(_ collectionView: UICollectionView, indexPathForIndexTitle title: String, at index: Int) -> IndexPath {
        //you should return the indexPath of each Title to be scroll to the location of this indexPath when touch this Title
        return .init()
    }
    
    
    
    
    /**DELEGATE */
    func collectionView(_ collectionView: UICollectionView, transitionLayoutForOldLayout fromLayout: UICollectionViewLayout, newLayout toLayout: UICollectionViewLayout) -> UICollectionViewTransitionLayout {
        // when you start interactivly layout transition , collectionview implement a new layout Layer called "UICollectionViewTransitionLayout"
        // this Layer works as medium layout between two layouts ,
        //for examble , you want the cell to be in one position when start interactivly like kotchena and sprint to new position  , //we will make anew project for this :_)
        
        /**
          A transition layout object lets you customize the behavior of cells and decoration views when transitioning from one layout to the next. Normally, transitioning between layouts causes items to animate directly from their current locations to their new locations. With a transition layout object, you can have objects follow a non linear path, use a different timing algorithm, or move according to incoming touch events.
         */
        
        
        return .init(currentLayout: .init(), nextLayout: .init())
    }
    
    
    func collectionView(_ collectionView: UICollectionView, targetContentOffsetForProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        //use this method to implement PAGING Effect
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, targetIndexPathForMoveFromItemAt originalIndexPath: IndexPath, toProposedIndexPath proposedIndexPath: IndexPath) -> IndexPath {
        /*
         During the interactive moving of an item, the collection view calls this method to see if you want to provide a different index path than the proposed path. You might use this method to prevent the user from dropping the item in an invalid location. For example, you might prevent the user from dropping the item in a specific section.
         */
        .init()
    }
}

