import {PriorityList, VipList, LoyaltyList, GroupBy, SearchList} from '../../static/data/moke'

const delay = ms => new Promise(r => setTimeout(r, ms))

export const FetchPriorityList = async() => {
    if ( NODE_ENV == 'development' ) {
        await  delay(500)
        return PriorityList
    }
}
export const FetchVipList = async() => {
    if ( NODE_ENV == 'development' ) {
        await  delay(500)
        return VipList
    }
}
export const FetchLoyaltyList = async() => {
    if ( NODE_ENV == 'development' ) {
        await  delay(500)
        return LoyaltyList
    }
}
export const FetchGroupByList = async() => {
    if ( NODE_ENV == 'development' ) {
        await  delay(500)
        return GroupBy
    }
}
export const FetchSearchList = async() => {
    if ( NODE_ENV == 'development' ) {
        await  delay(500)
        return SearchList
    }
}