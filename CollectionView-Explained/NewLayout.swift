//
//  NewLayout.swift
//  CollectionView-Explained
//
//  Created by Hossam on 3/6/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit
class Flow : UICollectionViewFlowLayout {
   
    override func prepare() {
        minimumLineSpacing //In Vertical ;- SpaceBetween rows or in one line =
        minimumInteritemSpacing // SpaceBetween Items In Same Row - - -
        headerReferenceSize //you must set size  and for footer too
    }
}

class layout : UICollectionViewLayout {
    override class var layoutAttributesClass: AnyClass {
        //you must implement this method and return your custome attributes class and this class must confirm to ISEQUAL and Copy protocls :)
        return AnyClass as! AnyClass
    }
    override func prepare() {
        super.prepare()
        //you should make all calculation here , and make it updatable for items or header to invalidate without call the full for loop of it
    }
    
    
    override func layoutAttributesForSupplementaryView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        //try to make it easy and make the header frame here if you use sticky header
    }
    override func layoutAttributesForInteractivelyMovingItem(at indexPath: IndexPath, withTargetPosition position: CGPoint) -> UICollectionViewLayoutAttributes {
        //return attributes to use when start interactive moving item like alpha = 0.5
        return .init()
    }
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        //return point to be after update like move or delete or reload
        return.zero
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        //use it to  make paging effect
        return .zero
    }
    
    override func prepare(forCollectionViewUpdates updateItems: [UICollectionViewUpdateItem]) {
        //use UPDATEITEMS and store its value and depending on action of it ,
        //you use this stored values to make intial position or final position of the item in NEXT FUCTION |?
        /*
         func initialLayoutAttributesForAppearingItem(at: IndexPath) -> UICollectionViewLayoutAttributes?
         Returns the starting layout information for an item being inserted into the collection view.
         
         
         func initialLayoutAttributesForAppearingSupplementaryElement(ofKind: String, at: IndexPath) -> UICollectionViewLayoutAttributes?
         Returns the starting layout information for a supplementary view being inserted into the collection view.
         
         
         func initialLayoutAttributesForAppearingDecorationElement(ofKind: String, at: IndexPath) -> UICollectionViewLayoutAttributes?
         Returns the starting layout information for a decoration view being inserted into the collection view.
         

         
         func finalLayoutAttributesForDisappearingItem(at: IndexPath) -> UICollectionViewLayoutAttributes?
         Returns the final layout information for an item that is about to be removed from the collection view.
         
         
         func finalLayoutAttributesForDisappearingSupplementaryElement(ofKind: String, at: IndexPath) -> UICollectionViewLayoutAttributes?
         Returns the final layout information for a supplementary view that is about to be removed from the collection view.
         
         
         func finalLayoutAttributesForDisappearingDecorationElement(ofKind: String, at: IndexPath) -> UICollectionViewLayoutAttributes?
         Returns the final layout information for a decoration view that is about to be removed from the collection view.

         **/
    }
    
    override func finalizeCollectionViewUpdates() {
        //use thie method to clear the stored values from the previuos fuction
        
    }
    
    override func indexPathsToDeleteForDecorationView(ofKind elementKind: String) -> [IndexPath] {
        print("I DONT kNOW ")
       return  []
    }
    
    override func indexPathsToInsertForDecorationView(ofKind elementKind: String) -> [IndexPath] {
        print("I DINT kNOW ")
        return []
    }
    
    override func targetIndexPath(forInteractivelyMovingItem previousIndexPath: IndexPath, withPosition position: CGPoint) -> IndexPath {
        /** If there are multiple cells at the same location, the method returns the topmost cell—that is, the cell whose zIndex layout attribute value is greatest.

        You can override this method as needed to change how the index path is determined. For example, you might return the index path of the cell that has the lowest zIndex value instead of the highest. If you override this method, you do not need to call super.*/
        return .init()
    }
    
    
    override func invalidateLayout() {
        super.invalidateLayout()
        //call this method to restart calculations of te all layout
    }
    override func invalidateLayout(with context: UICollectionViewLayoutInvalidationContext) {
        //override this method if you have custom contextClass ,
        //for examble you have a custom context , and have a propity say that invalidate every thing
        //in this situation you should do preapre again
        //If you override this method, you must call super at some point in your implementation.
    }
   func  invalidationContext(forBoundsChange newBounds: CGRect) -> UICollectionViewLayoutInvalidationContext{
    // if you use default context , you just define how the invalidation and when is DONE , and use the method of the context
    //for exable , you have a sticky header , you should not recalculate all , all you need to marke this header as invalida by (context.invalidate supplemantaryview ) and the next step context will call attributesForSupplemantry and update the value
    
    }
    
    override func shouldInvalidateLayout(forPreferredLayoutAttributes preferredAttributes: UICollectionViewLayoutAttributes, withOriginalAttributes originalAttributes: UICollectionViewLayoutAttributes) -> Bool {
        //this method called after CELL "preferredLayoutAttributesFitting(_:)" and preferredAttributes
        //use thie method to make autoresize Cell
        
        return true
    }
    
    override func invalidationContext(forPreferredLayoutAttributes preferredAttributes: UICollectionViewLayoutAttributes, withOriginalAttributes originalAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutInvalidationContext {
        //called after the previuous function to provied each cell that you want to update
        //you must creat DIC [IndexPath:Height Value] and update it every time you have a new value and invalidate the cell
        
    }
    
    override func prepare(forAnimatedBoundsChange oldBounds: CGRect) {
     //I DONT KNOW
    }
    override func finalizeAnimatedBoundsChange() {
        //I DONT KNOW
    }
    override func prepareForTransition(to newLayout: UICollectionViewLayout) {
        //preapre the layout to clear caches or memory , and set( init value of the newLayout)
    }
    
    override func prepareForTransition(from oldLayout: UICollectionViewLayout) {
        //preapre the layout , this object is new and come from the OLD LAyout
        //can use it to inial values from previuos values
    }
    
    override func finalizeLayoutTransition() {
//       You can use this method to clean up any data structures or caches created by your implementations of the prepareForTransition(from:) or prepareForTransition(to:) methods.
    }
    
    override var flipsHorizontallyInOppositeLayoutDirection: Bool {
        /*A Boolean value indicating whether the horizontal coordinate system is automatically flipped at appropriate times.*/
        //
        //(if true , we will use the nextFucntion)
        return true
    }
    override var developmentLayoutDirection: UIUserInterfaceLayoutDirection{
        //use thie method to make the collection view left to right , or right to left ->>>>> (leading , trailing) to support arabic for example
        return .leftToRight
    }
    
}
