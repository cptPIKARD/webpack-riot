import {PriorityList, VipList, LoyaltyList, GroupBy, SearchList, ServiceRequests} from '../../static/data/moke'

const delay = ms => new Promise(r => setTimeout(r, ms))

export const FetchPriorityList = async() => {
    if ( NODE_ENV == 'development' ) {
        await  delay(500)
        return JSON.parse(JSON.stringify(PriorityList))
    }
}
export const FetchVipList = async() => {
    if ( NODE_ENV == 'development' ) {
        await  delay(500)
        return JSON.parse(JSON.stringify(VipList))
    }
}
export const FetchLoyaltyList = async() => {
    if ( NODE_ENV == 'development' ) {
        await  delay(500)
        return JSON.parse(JSON.stringify(LoyaltyList))
    }
}
export const FetchGroupByList = async() => {
    if ( NODE_ENV == 'development' ) {
        await  delay(500)
        return JSON.parse(JSON.stringify(GroupBy))
    }
}
export const FetchSearchList = async() => {
    if ( NODE_ENV == 'development' ) {
        await  delay(500)
        return JSON.parse(JSON.stringify(SearchList))
    }
}
export const FetchServiceData = async() => {
    if ( NODE_ENV == 'development' ) {
        await  delay(500)
        return JSON.parse(JSON.stringify(ServiceRequests))
    }
}