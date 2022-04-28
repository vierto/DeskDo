//
//  DeskDoItem+CoreDataProperties.swift
//  DeskDo
//
//  Created by Vendly on 28/04/22.
//
//

import Foundation
import CoreData


extension DeskDoItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DeskDoItem> {
        return NSFetchRequest<DeskDoItem>(entityName: "DeskDoItem")
    }

    @NSManaged public var deskName: String?
    @NSManaged public var imgDesk: Data?
    @NSManaged public var stuffName: String?

}

extension DeskDoItem : Identifiable {

}
