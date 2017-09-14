export const PriorityList = [
    {
        name: 'Low',
        value: 1
    },
    {
        name: 'Medium',
        value: 2
    },
    {
        name: 'High',
        value: 3
    }
]
export const VipList = [
    {
        name: '1',
        value: 1
    },
    {
        name: '2',
        value: 2
    },
    {
        name: '3',
        value: 3
    },
    {
        name: '4',
        value: 4
    },
    {
        name: '5',
        value: 5
    }
]
export const LoyaltyList = [
    {
        name: 'Black',
        value: 1
    },
    {
        name: 'Silver',
        value: 2
    },
    {
        name: 'Gold',
        value: 3
    },
    {
        name: 'Platinum',
        value: 4
    }
]
export const GroupBy = [
    {
        name: 'No Grouping',
        value: 1
    },
    {
        name: 'Priority',
        value: 2
    },
    {
        name: 'Time',
        value: 3
    },
    {
        name: 'Category',
        value: 4
    },
    {
        name: 'Subcategory',
        value: 5
    },
    {
        name: 'VIP Tier',
        value: 6
    },
    {
        name: 'Loyalty Tier',
        value: 7
    }
]
export const SearchList = [
    {
        name: 'SR Service / Case Reason',
        value: 1
    },
    {
        name: 'Description',
        value: 2
    },
    {
        name: 'Guest Name',
        value: 3
    },
    {
        name: 'Status',
        value: 4
    }
]
export const ServiceRequests = [
    {
        Sr: 'SR-678900000',
        Room: 125,
        Pax: {
            Adult: 2,
            Child: 1
        },
        Vip: '1',
        Loyalty: {
            name: 'Black',
            value: 1
        },
        Guest: 'Vladimir Putin',
        Services: {
            name: 'Small Face Towel',
            quantity: 2
        },
        RequestedBy: 'John Doe',
        AssignedTo: 'Mithilesh Kumar',
        Case: 'CS-32423-32342',
        Status: 'IN PROGRESS',
        Time: {
            date: '10/08/2017',
            time: '13:34'
        },
        Sla: '',
        StatusService: {
            name: 'Closed',
            value: 1
        },
        Priority: {
            name: 'Low',
            value: 1
        },
        SubFilter: 'Department'
    },
    {
        Sr: 'SR-678900000',
        Room: 225,
        Pax: {
            Adult: 2,
            Child: 0
        },
        Vip: '1',
        Loyalty: {
            name: 'Black',
            value: 1
        },
        Guest: 'Optimus Prime',
        Services: {
            name: 'Small Face Towel',
            quantity: 2
        },
        RequestedBy: 'John Doe',
        AssignedTo: 'Ozzy Osborn',
        Case: 'CS-32423-67342',
        Status: 'IN PROGRESS',
        Time: {
            date: '10/08/2017',
            time: '13:34'
        },
        Sla: '',
        StatusService: {
            name: 'Cancelled',
            value: 2
        },
        Priority: {
            name: 'Medium',
            value: 2
        },
        SubFilter: 'Department'
    },
    {
        Sr: 'SR-678900000',
        Room: 125,
        Pax: {
            Adult: 1,
            Child: 1
        },
        Vip: '1',
        Loyalty: {
            name: 'Gold',
            value: 3
        },
        Guest: 'Optimus Prime',
        Services: {
            name: 'Whisky',
            quantity: 5
        },
        RequestedBy: 'Sam Smith',
        AssignedTo: 'Ozzy Osborn',
        Case: 'CS-32423-67342',
        Status: 'IN PROGRESS',
        Time: {
            date: '10/08/2017',
            time: '13:34'
        },
        Sla: '',
        StatusService: {
            name: 'Cancelled',
            value: 2
        },
        Priority: {
            name: 'Medium',
            value: 2
        },
        SubFilter: 'Department'
    },
    {
        Sr: 'SR-678900000',
        Room: 232,
        Pax: {
            Adult: 2,
            Child: 2
        },
        Vip: '1',
        Loyalty: {
            name: 'Gold',
            value: 3
        },
        Guest: 'Optimus Prime',
        Services: {
            name: 'Whisky',
            quantity: 10
        },
        RequestedBy: 'Sam Smith',
        AssignedTo: 'John Lennon',
        Case: 'CS-32423-67342',
        Status: 'IN PROGRESS',
        Time: {
            date: '10/08/2017',
            time: '13:34'
        },
        Sla: '',
        StatusService: {
            name: 'Cancelled',
            value: 2
        },
        Priority: {
            name: 'High',
            value: 3
        },
        SubFilter: 'DepartmentOverdue'
    },
    {
        Sr: 'SR-678900000',
        Room: 554,
        Pax: {
            Adult: 2,
            Child: 1
        },
        Vip: '1',
        Loyalty: {
            name: 'Gold',
            value: 3
        },
        Guest: 'John Wick',
        Services: {
            name: 'Whisky',
            quantity: 10
        },
        RequestedBy: 'Sam Smith',
        AssignedTo: 'Ozzy Osborn',
        Case: 'CS-88423-67342',
        Status: 'IN PROGRESS',
        Time: {
            date: '10/08/2017',
            time: '13:34'
        },
        Sla: '',
        StatusService: {
            name: 'On Hold',
            value: 3
        },
        Priority: {
            name: 'High',
            value: 3
        },
        SubFilter: 'Hotels'
    }
]