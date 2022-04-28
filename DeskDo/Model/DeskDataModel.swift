//
//  DeskDataModel.swift
//  DeskDo
//
//  Created by Vendly on 28/04/22.
//

import Foundation

class DeskDataDB {
    
    func insertData() -> [DeskModel] {
        let desk: [DeskModel] = [
            DeskModel (
                deskName: "Work Desk",
                stuffName: "Houseplant",
                deskImg: "work_desk_3"
            ),
            DeskModel (
                deskName: "Play Desk",
                stuffName: "Wall File Holder",
                deskImg: "work_desk_2"
            ),
            DeskModel (
                deskName: "Gaming Desk",
                stuffName: "Stand Monitor",
                deskImg: "gaming_desk_1"
            ),
            DeskModel (
                deskName: "Study Desk",
                stuffName: "Stationery Organizer",
                deskImg: "work_desk_4"
            ),
            DeskModel (
                deskName: "Boss Desk",
                stuffName: "Keyboard External",
                deskImg: "work_desk_6"
            ),
            DeskModel (
                deskName: "Manager Desk",
                stuffName: "Tray Organizer",
                deskImg: "work_desk_8"
            ),
            DeskModel (
                deskName: "Staff Desk",
                stuffName: "Mouse Wireless",
                deskImg: "gaming_desk_2"
            ),
            DeskModel (
                deskName: "Mini Work Desk",
                stuffName: "Monitor",
                deskImg: "work_desk_5"
            ),
            DeskModel (
                deskName: "Youtuber Desk",
                stuffName: "Headset",
                deskImg: "gaming_desk_3"
            ),
            DeskModel (
                deskName: "Student Desk",
                stuffName: "Laptop Stand",
                deskImg: "work_desk_7"
            )
        ]
        
        return desk
    }
    
}
