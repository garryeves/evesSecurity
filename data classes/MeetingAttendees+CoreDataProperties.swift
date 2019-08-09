//
//  MeetingAttendees+CoreDataProperties.swift
//  
//
//  Created by Garry Eves on 30/3/18.
//
//

import Foundation
import CoreData


extension MeetingAttendees {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MeetingAttendees> {
        return NSFetchRequest<MeetingAttendees>(entityName: "MeetingAttendees")
    }

    @NSManaged public var attendenceStatus: String?
    @NSManaged public var email: String?
    @NSManaged public var meetingID: String?
    @NSManaged public var name: String?
    @NSManaged public var personID: Int64
    @NSManaged public var teamID: Int64
    @NSManaged public var type: String?
    @NSManaged public var updateTime: NSDate?
    @NSManaged public var updateType: String?

}
