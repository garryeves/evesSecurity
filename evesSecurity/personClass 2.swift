//
//  personClass.swift
//  evesSecurity
//
//  Created by Garry Eves on 11/5/17.
//  Copyright © 2017 Garry Eves. All rights reserved.
//

import Foundation
//import CoreData
import CloudKit
import SwiftUI

public struct monthlyPersonFinancialsStruct
{
    var month: String
    var year: String
    var wage: Double
    var hours: Double
}

public class people: NSObject, Identifiable
{
    public let id = UUID()
    public var myPeople:[person] = Array()
    
    public init(teamID: Int64, isActive: Bool)
    {
        super.init()
        
        if currentUser.currentTeam?.people == nil
        {
            currentUser.currentTeam?.people = myCloudDB.getPeople(teamID: teamID, isActive: isActive)
        }
        
        for myItem in (currentUser.currentTeam?.people)!
        {
            let dob: Date = myItem.dob! as Date
            
            var tempFirstName: String = ""
            var tempTitle: String = ""
            if myItem.firstName == nil
            {
                tempFirstName = ""
            }
            else
            {
                tempFirstName = myItem.firstName!
            }
            if myItem.title == nil
            {
                tempTitle = ""
            }
            else
            {
                tempTitle = myItem.title!
            }
            
            let myObject = person(personID: myItem.personID,
                                  name: myItem.name!,
                                  dob: dob,
                                  teamID: myItem.teamID,
                                  gender: myItem.gender!,
                                  note: myItem.note!,
                                  clientID: myItem.clientID,
                                  projectID: myItem.projectID,
                                  canRoster: myItem.canRoster!,
                                  firstName: tempFirstName,
                                  title: tempTitle,
                                  emailOptIn: myItem.emailOptIn,
                                  isActive: myItem.isActive!,
                                  useAllowanceHours: myItem.useAllowanceHours!
                                   )
            myPeople.append(myObject)
        }
        sortArray()
    }
    
//    public init(teamID: Int64, useAllowanceHours: Bool)
//    {
//        super.init()
//        
//        let workingArray = myCloudDB.getPeople(teamID: teamID, useAllowanceHours: true)
//        
//        for myItem in workingArray
//        {
//            let dob: Date = myItem.dob! as Date
//            
//            var tempFirstName: String = ""
//            var tempTitle: String = ""
//            if myItem.firstName == nil
//            {
//                tempFirstName = ""
//            }
//            else
//            {
//                tempFirstName = myItem.firstName!
//            }
//            if myItem.title == nil
//            {
//                tempTitle = ""
//            }
//            else
//            {
//                tempTitle = myItem.title!
//            }
//            let myObject = person(personID: myItem.personID,
//                                  name: myItem.name!,
//                                  dob: dob,
//                                  teamID: myItem.teamID,
//                                  gender: myItem.gender!,
//                                  note: myItem.note!,
//                                  clientID: myItem.clientID,
//                                  projectID: myItem.projectID,
//                                  canRoster: myItem.canRoster!,
//                                  firstName: tempFirstName,
//                                  title: tempTitle,
//                                  emailOptIn: myItem.emailOptIn,
//                                  isActive: true,
//                                  useAllowanceHours: myItem.useAllowanceHours!
//            )
//            myPeople.append(myObject)
//        }
//        sortArray()
//    }
    
    
    public init(teamID: Int64, canRoster: Bool)
    {
        super.init()
        
        if currentUser.currentTeam?.people == nil
        {
            currentUser.currentTeam?.people = myCloudDB.getPeople(teamID: teamID, isActive: true)
        }
        
        var workingArray: [Person] = Array()
        
        for item in (currentUser.currentTeam?.people)!
        {
            if canRoster
            {
                if (item.canRoster == "True")
                {
                    workingArray.append(item)
                }
            }
            else
            {
                workingArray.append(item)
            }
        }
        
        for myItem in workingArray
        {
            let dob: Date = myItem.dob! as Date
            
            var tempFirstName: String = ""
            var tempTitle: String = ""
            if myItem.firstName == nil
            {
                tempFirstName = ""
            }
            else
            {
                tempFirstName = myItem.firstName!
            }
            if myItem.title == nil
            {
                tempTitle = ""
            }
            else
            {
                tempTitle = myItem.title!
            }
            let myObject = person(personID: myItem.personID,
                                  name: myItem.name!,
                                  dob: dob,
                                  teamID: myItem.teamID,
                                  gender: myItem.gender!,
                                  note: myItem.note!,
                                  clientID: myItem.clientID,
                                  projectID: myItem.projectID,
                                  canRoster: myItem.canRoster!,
                                  firstName: tempFirstName,
                                  title: tempTitle,
                                  emailOptIn: myItem.emailOptIn,
                                  isActive: true,
                                  useAllowanceHours: myItem.useAllowanceHours!
            )
            myPeople.append(myObject)
        }
        sortArray()
    }
    
    public init(clientID: Int64, teamID: Int64, onlyActive: Bool)
    {
        super.init()
        
        if currentUser.currentTeam?.people == nil
        {
            currentUser.currentTeam?.people = myCloudDB.getPeople(teamID: teamID, isActive: onlyActive)
        }
        
        var workingArray: [Person] = Array()
        
        for item in (currentUser.currentTeam?.people)!
        {
            if item.clientID == clientID
            {
                workingArray.append(item)
            }
        }
        
        for myItem in workingArray
        {
            let dob: Date = myItem.dob! as Date
            
            var tempFirstName: String = ""
            var tempTitle: String = ""
            if myItem.firstName == nil
            {
                tempFirstName = ""
            }
            else
            {
                tempFirstName = myItem.firstName!
            }
            if myItem.title == nil
            {
                tempTitle = ""
            }
            else
            {
                tempTitle = myItem.title!
            }
            
            let myObject = person(personID: myItem.personID,
                                  name: myItem.name!,
                                  dob: dob,
                                  teamID: myItem.teamID,
                                  gender: myItem.gender!,
                                  note: myItem.note!,
                                  clientID: myItem.clientID,
                                  projectID: myItem.projectID,
                                  canRoster: myItem.canRoster!,
                                  firstName: tempFirstName,
                                  title: tempTitle,
                                  emailOptIn: myItem.emailOptIn,
                                  isActive: myItem.isActive!,
                                  useAllowanceHours: myItem.useAllowanceHours!
            )
            myPeople.append(myObject)
        }
        sortArray()
    }
    
    public init(projectID: Int64, teamID: Int64, onlyActive: Bool)
    {
        super.init()
        
        if currentUser.currentTeam?.people == nil
        {
            currentUser.currentTeam?.people = myCloudDB.getPeople(teamID: teamID, isActive: onlyActive)
        }
        
        var workingArray: [Person] = Array()
        
        for item in (currentUser.currentTeam?.people)!
        {
            if item.projectID == projectID
            {
                workingArray.append(item)
            }
        }
        
        for myItem in workingArray
        {
            let dob: Date = myItem.dob! as Date
            
            var tempFirstName: String = ""
            var tempTitle: String = ""
            if myItem.firstName == nil
            {
                tempFirstName = ""
            }
            else
            {
                tempFirstName = myItem.firstName!
            }
            if myItem.title == nil
            {
                tempTitle = ""
            }
            else
            {
                tempTitle = myItem.title!
            }
            
            let myObject = person(personID: myItem.personID,
                                  name: myItem.name!,
                                  dob: dob,
                                  teamID: myItem.teamID,
                                  gender: myItem.gender!,
                                  note: myItem.note!,
                                  clientID: myItem.clientID,
                                  projectID: myItem.projectID,
                                  canRoster: myItem.canRoster!,
                                  firstName: tempFirstName,
                                  title: tempTitle,
                                  emailOptIn: myItem.emailOptIn,
                                  isActive: myItem.isActive!,
                                  useAllowanceHours: myItem.useAllowanceHours!
            )
            myPeople.append(myObject)
        }
        sortArray()
    }
    
    public func sortArray()
    {
        if myPeople.count > 0
        {
            myPeople.sort
            {
                // Because workdate has time it throws everything out
                
                if $0.name == $1.name
                {
                    return $0.dob < $1.dob
                }
                else
                {
                    return $0.name < $1.name
                }
            }
        }
    }
    
    public func append( _ newItem: person)
    {
        myPeople.append(newItem)
        sortArray()
    }
    
    public func remove(_ personID: Int64)
    {
        var recordCount = 0
        
        for item in myPeople
        {
            if item.personID == personID
            {
                break
            }
            recordCount += 1
        }
        myPeople.remove(at: recordCount)
    }
    
    public var people: [person]
    {
        get
        {
            return myPeople
        }
    }
}

public class person: NSObject, Identifiable
{
    public let id = UUID()
    fileprivate var myPersonID: Int64 = 0
    fileprivate var myClientID: Int64 = 0
    fileprivate var myProjectID: Int64 = 0
    fileprivate var myName: String = ""
    fileprivate var myGender: String = ""
    fileprivate var myNote: String = ""
    fileprivate var myDob: Date = getDefaultDate()
    fileprivate var myAddresses: personAddresses!
    fileprivate var myContacts: personContacts!
    fileprivate var myAddInfo: personAddInfoEntries!
    fileprivate var myTeamID: Int64 = 0
    fileprivate var myCanRoster: String = ""
    public var tempArray: [Any] = Array()
    fileprivate var myFirstName: String = ""
    fileprivate var myTitle: String = ""
    fileprivate var myEmailOptIn: Bool = false
    fileprivate var myIsActive: Bool = true
    fileprivate var mySessions: sessionNotes!
    fileprivate var myuseAllowanceHours: Bool = false
    fileprivate var myMonthlyAllow: [allowanceUnitsitem] = Array()
    fileprivate var myMonthYear: String = ""
    fileprivate var myInvoices: clientInvoices!

    public var personID: Int64
    {
        get
        {
            return myPersonID
        }
    }
    
    public var teamID: Int64
    {
        get
        {
            return myTeamID
        }
    }
    
    public var clientID: Int64
    {
        get
        {
            return myClientID
        }
        set
        {
            myClientID = newValue
            save()
        }
    }
    
    public var projectID: Int64
    {
        get
        {
            return myProjectID
        }
        set
        {
            myProjectID = newValue
            save()
        }
    }
    
    public var lastName: String
    {
        get
        {
            return myName
        }
        set
        {
            myName = newValue
            currentUser.currentTeam?.people = nil
            save()
        }
    }
    
    public var firstName: String
    {
        get
        {
            return myFirstName
        }
        set
        {
            myFirstName = newValue
            currentUser.currentTeam?.people = nil
            save()
        }
    }
    
    public var name: String
    {
        get
        {
            if (myFirstName == "") && (myName == "")
            {
                return("No name entered")
            }
            
            if (myFirstName == "")
            {
                return(myName)
            }

            if (myName == "")
            {
                return(myFirstName)
            }
            
            return "\(myFirstName) \(myName)"
        }
    }
    
    
    public var title: String
    {
        get
        {
            return myTitle
        }
        set
        {
            myTitle = newValue
            save()
        }
    }
    
    public var gender: String
    {
        get
        {
            if myGender == ""
            {
                return "Select"
            }
            else
            {
                return myGender
            }
        }
        set
        {
            myGender = newValue
            save()
        }
    }
    
    public var note: String
    {
        get
        {
            return myNote
        }
        set
        {
            myNote = newValue
            save()
        }
    }
    
    public var dob: Date
    {
        get
        {
            return myDob
        }
        set
        {
            myDob = newValue
            currentUser.currentTeam?.people = nil
            save()
        }
    }
    
    public var addresses: [address]
    {
        get
        {
            if myAddresses == nil
            {
                return []
            }
            else
            {
                return myAddresses.addresses
            }
        }
    }
    
    public var contacts: [contactItem]
    {
        get
        {
            if myContacts == nil
            {
                return []
            }
            else
            {
                return myContacts.contacts
            }
        }
    }
    
    public var addInfo: [personAddInfoEntry]
    {
        get
        {
            if myAddInfo == nil
            {
                return []
            }
            else
            {
                return myAddInfo.personAddEntries
            }
        }
    }
    
    public var dobText: String
    {
        get
        {
            if myDob == getDefaultDate()
            {
                return "Select"
            }
            else
            {
                let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = .short
                
                return dateFormatter.string(from: myDob)
            }
        }
    }
    
    public var canRoster: String
    {
        get
        {
            return myCanRoster
        }
        set
        {
            myCanRoster = newValue
            save()
        }
    }
    
    public var emailOptIn: Bool
    {
        get
        {
            return myEmailOptIn
        }
        set
        {
            myEmailOptIn = newValue
            save()
        }
    }
    
    public var isActive: Bool
    {
        get
        {
            return myIsActive
        }
        set
        {
            myIsActive = newValue
            currentUser.currentTeam?.people = nil
            save()
        }
    }
    
    public var useAllowanceHours: Bool
    {
        get
        {
            return myuseAllowanceHours
        }
        set
        {
            myuseAllowanceHours = newValue
            save()
        }
    }
    
    public var sessions: [sessionNote]
    {
        get
        {
            return mySessions!.notes
        }
    }
    
    public var invoices: clientInvoices?
    {
        get
        {
            return myInvoices
        }
    }
    
    public init(teamID: Int64)
    {
        super.init()
        
        myPersonID = myCloudDB.getNextID("Person", teamID: teamID)
        myTeamID = teamID
        
        currentUser.currentTeam?.people = nil
        save()
    }
    
    public init(teamID: Int64, taskOwner: String)
    {
        super.init()
        
        myPersonID = myCloudDB.getNextID("Person", teamID: teamID)
        myTeamID = teamID
        myName = taskOwner
            
        currentUser.currentTeam?.people = nil
        save()
    }
    
    public init(teamID: Int64, newName: String)
    {
        super.init()
        
        myPersonID = myCloudDB.getNextID("Person", teamID: teamID)
        myTeamID = teamID
        myName = newName
        
        currentUser.currentTeam?.people = nil
        save()
    }
    
    public init(personID: Int64, teamID: Int64)
    {
        super.init()
        
        if currentUser.currentTeam?.people == nil
        {
            currentUser.currentTeam?.people = myCloudDB.getPeople(teamID: teamID, isActive: true)
        }
        
        var myItem: Person!
        
        for item in (currentUser.currentTeam?.people)!
        {
            if item.personID == personID
            {
                myItem = item
                break
            }
        }
     // Gaza update thes to wrap all text with nil check
        if myItem != nil
        {
            myPersonID = myItem.personID
            if myItem.name == nil
            {
                myName = ""
            }
            else
            {
                myName = myItem.name!
            }

            myDob = myItem.dob! as Date
            myTeamID = myItem.teamID
            if myItem.gender == nil
            {
                myGender = ""
            }
            else
            {
                myGender = myItem.gender!
            }

            if myItem.note == nil
            {
                myNote = ""
            }
            else
            {
                myNote = myItem.note!
            }

            myClientID = myItem.clientID
            myProjectID = myItem.projectID
            if myItem.canRoster == nil
            {
                myCanRoster = ""
            }
            else
            {
                myCanRoster = myItem.canRoster!
            }

            if myItem.firstName == nil
            {
                myFirstName = ""
            }
            else
            {
                myFirstName = myItem.firstName!
            }
            if myItem.title == nil
            {
                myTitle = ""
            }
            else
            {
                myTitle = myItem.title!
            }
            myEmailOptIn = myItem.emailOptIn
            myIsActive = myItem.isActive!
            myuseAllowanceHours = myItem.useAllowanceHours!
        }
    }
    
    public init(name: String, teamID: Int64)
    {
        super.init()

        var myItem: Person!
        
        if currentUser.currentTeam?.people == nil
        {
            currentUser.currentTeam?.people = myCloudDB.getPeople(teamID: teamID, isActive: true)
        }
        
        for item in (currentUser.currentTeam?.people)!
        {
            if item.name == name
            {
                myItem = item
                break
            }
        }
        
        if myItem != nil
        {
            myPersonID = myItem.personID
            myName = myItem.name!
            myDob = myItem.dob! as Date
            myTeamID = myItem.teamID
            myGender = myItem.gender!
            myNote = myItem.note!
            myClientID = myItem.clientID
            myProjectID = myItem.projectID
            myCanRoster = myItem.canRoster!
            myIsActive = myItem.isActive!
            myuseAllowanceHours = myItem.useAllowanceHours!
            
            if myItem.firstName == nil
            {
                myFirstName = ""
            }
            else
            {
                myFirstName = myItem.firstName!
            }
            if myItem.title == nil
            {
                myTitle = ""
            }
            else
            {
                myTitle = myItem.title!
            }
            myEmailOptIn = myItem.emailOptIn
        }
    }
    
    public init(personID: Int64,
         name: String,
         dob: Date,
         teamID: Int64,
         gender: String,
         note: String,
         clientID: Int64,
         projectID: Int64,
         canRoster: String,
         firstName: String,
         title: String,
         emailOptIn: Bool,
         isActive: Bool,
         useAllowanceHours: Bool
         )
    {
        super.init()
        
        myPersonID = personID
        myName = name
        myDob = dob
        myTeamID = teamID
        myGender = gender
        myNote = note
        myClientID = clientID
        myProjectID = projectID
        myCanRoster = canRoster
        myFirstName = firstName
        myTitle = title
        myEmailOptIn = emailOptIn
        myIsActive = isActive
        myuseAllowanceHours = useAllowanceHours
    }
    
    public func save()
    {
   //     if currentUser.checkPermission(hrRoleType) == writePermission
   //     {
            let temp = Person(canRoster: myCanRoster, clientID: myClientID, dob: dob, gender: myGender, name: myName, note: myNote, personID: myPersonID, projectID: myProjectID, teamID: myTeamID,
                              firstName: myFirstName,
                              title: myTitle,
                              emailOptIn: myEmailOptIn, isActive: myIsActive, useAllowanceHours: myuseAllowanceHours)
            
            myCloudDB.savePersonRecordToCloudKit(temp)
    //    }
    }
    
    public func delete()
    {
        if currentUser.checkWritePermission(hrRoleType)
        {
            myCloudDB.deletePerson(myPersonID, teamID: myTeamID)
            currentUser.currentTeam?.people = nil
        }
    }
    
    public func deleteAddress(addressType: String)
    {
        for myItem in myAddresses.addresses
        {
            if myItem.addressType == addressType
            {
                myItem.delete()
                break
            }
        }
        
        loadAddresses()
    }
    
    public func loadAddresses()
    {
        myAddresses = personAddresses(personID: myPersonID, teamID: myTeamID)
    }
    
    public func removeContact(contactType: String)
    {
        for myItem in myContacts.contacts
        {
            if myItem.contactType == contactType
            {
                myItem.delete()
                break
            }
        }
        
        loadContacts()
    }
    
    public func loadContacts()
    {
        myContacts = personContacts(personID: myPersonID, teamID: myTeamID)
    }
    
    public func removeAddInfo(addInfoType: String)
    {
        for myItem in myAddInfo.personAddEntries
        {
            if myItem.addInfoName == addInfoType
            {
                myItem.delete()
                break
            }
        }
        
        loadAddInfo()
    }
    
    public func loadAddInfo()
    {
        myAddInfo = personAddInfoEntries(personID: myPersonID, teamID: myTeamID)
    }
    
    public func loadSessions()
    {
        mySessions = sessionNotes(personID: myPersonID, teamID: myTeamID)
    }
    
    public func allowanceHours(_ monthYear: String) -> [allowanceUnitsitem]
    {
        if monthYear == myMonthYear
        {
            return myMonthlyAllow
        }
        else
        {
            let temp = allowanceUnits(teamID: currentUser.currentTeam!.teamID, monthYear: monthYear, personID: myPersonID)
            
            myMonthlyAllow = temp.getRecords(myPersonID)
            
            myMonthYear = monthYear
            
            return myMonthlyAllow
        }
    }
    
    func loadInvoices(_ isActive: Bool)
    {
        myInvoices = clientInvoices(teamID: currentUser.currentTeam!.teamID, personID: myPersonID, isActive: isActive)
    }
}

extension alerts
{
    func personTaskLinkAlerts()
    {
        if currentUser.personTaskLink <= 0
        {
            let alertEntry = alertItem()
            
            alertEntry.displayText = "You need to create a link to a person entry so Actions can be assigned to you."
            alertEntry.name = "Housekeeping"
            alertEntry.source = "PersonTask"
            alertEntry.object = currentUser.personTaskLink
            
            alertList.append(alertEntry)
        }
    }
}

public struct Person {
    public var canRoster: String?
    public var clientID: Int64
    public var dob: Date?
    public var gender: String?
    public var name: String?
    public var note: String?
    public var personID: Int64
    public var projectID: Int64
    public var teamID: Int64
    public var firstName: String?
    public var title: String?
    public var emailOptIn: Bool
    public var isActive: Bool?
    public var useAllowanceHours: Bool?
}

extension CloudKitInteraction
{
    private func populatePerson(_ records: [CKRecord]) -> [Person]
    {
        var tempArray: [Person] = Array()
        
        for record in records
        {
            var personID: Int64 = 0
            if record.object(forKey: "personID") != nil
            {
                personID = record.object(forKey: "personID") as! Int64
            }
            
            var dob = Date()
            if record.object(forKey: "dob") != nil
            {
                dob = record.object(forKey: "dob") as! Date
            }
            
            var teamID: Int64 = 0
            
            if record.object(forKey: "teamID") != nil
            {
                teamID = record.object(forKey: "teamID") as! Int64
            }
            
            var clientID: Int64 = 0
            if record.object(forKey: "clientID") != nil
            {
                clientID = record.object(forKey: "clientID") as! Int64
            }
            
            var projectID: Int64 = 0
            if record.object(forKey: "projectID") != nil
            {
                projectID = record.object(forKey: "projectID") as! Int64
            }
            
            var emailOptIn: Bool = false
            if record.object(forKey: "emailOptIn") != nil
            {
                if record.object(forKey: "emailOptIn") as? String == "True"
                {
                    emailOptIn = true
                }
            }
            
            var active: Bool = true
            if record.object(forKey: "isActive") != nil
            {
                if record.object(forKey: "isActive") as? String == "false"
                {
                    active = false
                }
            }
            
            var useAllowanceHours: Bool = false
            if record.object(forKey: "useAllowanceHours") != nil
            {
                if record.object(forKey: "useAllowanceHours") as? String == "true"
                {
                    useAllowanceHours = true
                }
            }
            
            let tempItem = Person(canRoster: record.object(forKey: "canRoster") as? String,
                                  clientID: clientID,
                                  dob: dob,
                                  gender: record.object(forKey: "gender") as? String,
                                  name: record.object(forKey: "name") as? String,
                                  note: record.object(forKey: "note") as? String,
                                  personID: personID,
                                  projectID: projectID,
                                  teamID: teamID,
                                  firstName: record.object(forKey: "firstName") as? String,
                                  title: record.object(forKey: "title") as? String,
                                  emailOptIn: emailOptIn,
                                  isActive: active,
                                  useAllowanceHours: useAllowanceHours
            )
            
            tempArray.append(tempItem)
        }
        
        return tempArray
    }

    func getPeople(teamID: Int64, isActive: Bool)->[Person]
    {
        var predicate: NSPredicate!

        if isActive
        {
            predicate = NSPredicate(format: "(teamID == \(teamID)) AND (updateType != \"Delete\") AND (isActive != \"false\")")
        }
        else
        {
            predicate = NSPredicate(format: "(teamID == \(teamID)) AND (updateType != \"Delete\")")
        }
        
        let query = CKQuery(recordType: "Person", predicate: predicate)
        let sem = DispatchSemaphore(value: 0)
        fetchServices(query: query, sem: sem, completion: nil)
        
        sem.wait()
        
        let shiftArray: [Person] = populatePerson(returnArray)
        
        return shiftArray
    }

    func getPeople(teamID: Int64, canRoster: Bool)->[Person]
    {
        var predicate: NSPredicate!

        if canRoster
        {
            predicate = NSPredicate(format: "(updateType != \"Delete\") AND (teamID == \(teamID)) AND (canRoster == \"True\") AND (isActive != \"false\")")
        }
        else
        {
            predicate = NSPredicate(format: "(updateType != \"Delete\") AND (teamID == \(teamID)) AND (isActive != \"false\")")
        }

        let query = CKQuery(recordType: "Person", predicate: predicate)
        let sem = DispatchSemaphore(value: 0)
        fetchServices(query: query, sem: sem, completion: nil)
        
        sem.wait()
        
        let shiftArray: [Person] = populatePerson(returnArray)
        
        return shiftArray
    }
    
    func getPeople(teamID: Int64, useAllowanceHours: Bool)->[Person]
    {
        let predicate = NSPredicate(format: "(updateType != \"Delete\") AND (teamID == \(teamID)) AND (useAllowanceHours == \"true\")")
        
        let query = CKQuery(recordType: "Person", predicate: predicate)
        let sem = DispatchSemaphore(value: 0)
        fetchServices(query: query, sem: sem, completion: nil)
        
        sem.wait()
        
        let shiftArray: [Person] = populatePerson(returnArray)
        
        return shiftArray
    }

    func getPeopleForClient(clientID: Int64, teamID: Int64, onlyActive: Bool)->[Person]
    {
        var predicate: NSPredicate!

        if onlyActive
        {
            predicate = NSPredicate(format: "(teamID == \(teamID)) AND (updateType != \"Delete\") AND (clientID == \(clientID)) AND (isActive != \"false\")")
        }
        else
        {
            predicate = NSPredicate(format: "(teamID == \(teamID)) AND (updateType != \"Delete\") AND (clientID == \(clientID))")
        }
        
        let query = CKQuery(recordType: "Person", predicate: predicate)
        let sem = DispatchSemaphore(value: 0)
        fetchServices(query: query, sem: sem, completion: nil)
        
        sem.wait()
        
        let shiftArray: [Person] = populatePerson(returnArray)
        
        return shiftArray
    }

    func getPeopleForProject(projectID: Int64, teamID: Int64, onlyActive: Bool)->[Person]
    {
        var predicate: NSPredicate!
        
        if onlyActive
        {
            predicate = NSPredicate(format: "(teamID == \(teamID)) AND (updateType != \"Delete\") AND (projectID == \(projectID)) AND (isActive != \"false\")")
        }
        else
        {
            predicate = NSPredicate(format: "(teamID == \(teamID)) AND (updateType != \"Delete\") AND (projectID == \(projectID))")
        }
        
        let query = CKQuery(recordType: "Person", predicate: predicate)
        let sem = DispatchSemaphore(value: 0)
        fetchServices(query: query, sem: sem, completion: nil)
        
        sem.wait()
        
        let shiftArray: [Person] = populatePerson(returnArray)
        
        return shiftArray
    }

    func getPersonDetails(personID: Int64, teamID: Int64)->[Person]
    {
        let predicate = NSPredicate(format: "(personID == \(personID)) AND (teamID == \(teamID))")

        let query = CKQuery(recordType: "Person", predicate: predicate)
        let sem = DispatchSemaphore(value: 0)
        fetchServices(query: query, sem: sem, completion: nil)
        
        sem.wait()
        
        let shiftArray: [Person] = populatePerson(returnArray)
        
        return shiftArray
    }

    func getPersonDetails(name: String, teamID: Int64)->[Person]
    {
        let predicate = NSPredicate(format: "(name == \"\(name)\") AND (teamID == \(teamID))")

        let query = CKQuery(recordType: "Person", predicate: predicate)
        let sem = DispatchSemaphore(value: 0)
        fetchServices(query: query, sem: sem, completion: nil)
        
        sem.wait()
        
        let shiftArray: [Person] = populatePerson(returnArray)
        
        return shiftArray
    }

    func deletePerson(_ personID: Int64, teamID: Int64)
    {
        let predicate = NSPredicate(format: "(personID == \(personID)) AND (teamID == \(teamID))")

        let sem = DispatchSemaphore(value: 0)
        
        let query = CKQuery(recordType: "Person", predicate: predicate)
        publicDB.perform(query, inZoneWith: nil, completionHandler: { (records, error) in
            
            self.performPublicDelete(records!)
            
            sem.signal()
        })
        sem.wait()
    }

    func savePersonRecordToCloudKit(_ sourceRecord: Person)
    {
        let sem = DispatchSemaphore(value: 0)
        
        let predicate = NSPredicate(format: "(personID == \(sourceRecord.personID)) AND (teamID == \(sourceRecord.teamID))") // better be accurate to get only the record you need
        let query = CKQuery(recordType: "Person", predicate: predicate)
        publicDB.perform(query, inZoneWith: nil, completionHandler: { (records, error) in
            if error != nil
            {
                NSLog("Error querying records: \(error!.localizedDescription)")
            }
            else
            {
                // Lets go and get the additional details from the context1_1 table
                
                if records!.count > 0
                {
                    let record = records!.first// as! CKRecord
                    // Now you have grabbed your existing record from iCloud
                    // Apply whatever changes you want
                    
                    record!.setValue(sourceRecord.name, forKey: "name")
                    record!.setValue(sourceRecord.dob, forKey: "dob")
                    record!.setValue(sourceRecord.gender, forKey: "gender")
                    record!.setValue(sourceRecord.note, forKey: "note")
                    record!.setValue(sourceRecord.clientID, forKey: "clientID")
                    record!.setValue(sourceRecord.projectID, forKey: "projectID")
                    record!.setValue(sourceRecord.canRoster, forKey: "canRoster")
                    record!.setValue(sourceRecord.firstName, forKey: "firstName")
                    record!.setValue(sourceRecord.title , forKey: "title")

                    if sourceRecord.emailOptIn
                    {
                        record!.setValue("True", forKey: "emailOptIn")
                    }
                    else
                    {
                        record!.setValue("False", forKey: "emailOptIn")
                    }
                    
                    if sourceRecord.isActive!
                    {
                        record!.setValue("true", forKey: "isActive")
                    }
                    else
                    {
                        record!.setValue("false", forKey: "isActive")
                    }
                    
                    if sourceRecord.useAllowanceHours!
                    {
                        record!.setValue("true", forKey: "useAllowanceHours")
                    }
                    else
                    {
                        record!.setValue("false", forKey: "useAllowanceHours")
                    }

                    // Save this record again
                    self.publicDB.save(record!, completionHandler: { (savedRecord, saveError) in
                        if saveError != nil
                        {
                            NSLog("Error saving record: \(saveError!.localizedDescription)")
                            self.saveOK = false
                            sem.signal()
                        }
                        else
                        {
                            if debugMessages
                            {
                                NSLog("Successfully updated record!")
                            }
                            sem.signal()
                        }
                    })
                }
                else
                {  // Insert
                    let record = CKRecord(recordType: "Person")
                    record.setValue(sourceRecord.personID, forKey: "personID")
                    record.setValue(sourceRecord.name, forKey: "name")
                    record.setValue(sourceRecord.dob, forKey: "dob")
                    record.setValue(sourceRecord.gender, forKey: "gender")
                    record.setValue(sourceRecord.note, forKey: "note")
                    record.setValue(sourceRecord.clientID, forKey: "clientID")
                    record.setValue(sourceRecord.projectID, forKey: "projectID")
                    record.setValue(sourceRecord.canRoster, forKey: "canRoster")
                    record.setValue(sourceRecord.firstName, forKey: "firstName")
                    record.setValue(sourceRecord.title , forKey: "title")
                    
                    if sourceRecord.emailOptIn
                    {
                        record.setValue("True", forKey: "emailOptIn")
                    }
                    else
                    {
                        record.setValue("False", forKey: "emailOptIn")
                    }
                    
                    if sourceRecord.isActive!
                    {
                        record.setValue("true", forKey: "isActive")
                    }
                    else
                    {
                        record.setValue("false", forKey: "isActive")
                    }
                    
                    if sourceRecord.useAllowanceHours!
                    {
                        record.setValue("true", forKey: "useAllowanceHours")
                    }
                    else
                    {
                        record.setValue("false", forKey: "useAllowanceHours")
                    }
                    
                    record.setValue(sourceRecord.teamID, forKey: "teamID")
                    
                    self.publicDB.save(record, completionHandler: { (savedRecord, saveError) in
                        if saveError != nil
                        {
                            NSLog("Error saving record: \(saveError!.localizedDescription)")
                            self.saveOK = false
                            sem.signal()
                        }
                        else
                        {
                            if debugMessages
                            {
                                NSLog("Successfully saved record!")
                            }
                            sem.signal()
                        }
                    })
                }
            }
        })
        sem.wait()
    }
    
    func getDeletedPeople(_ teamID: Int64)->[Person]
    {
        let predicate = NSPredicate(format: "(updateType == \"Delete\") AND (teamID == \(teamID))")

        let query = CKQuery(recordType: "Clients", predicate: predicate)
        let sem = DispatchSemaphore(value: 0)
        fetchServices(query: query, sem: sem, completion: nil)
        
        sem.wait()
        
        let shiftArray: [Person] = populatePerson(returnArray)
        
        return shiftArray
    }
}

