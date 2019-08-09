//
//  ReportingMonth+CoreDataProperties.swift
//  
//
//  Created by Garry Eves on 30/3/18.
//
//

import Foundation
import CoreData


extension ReportingMonth {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ReportingMonth> {
        return NSFetchRequest<ReportingMonth>(entityName: "ReportingMonth")
    }

    @NSManaged public var monthName: String?
    @NSManaged public var monthStartDate: NSDate?
    @NSManaged public var teamID: Int64
    @NSManaged public var updateTime: NSDate?
    @NSManaged public var updateType: String?
    @NSManaged public var yearName: String?

}
