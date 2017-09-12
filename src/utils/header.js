import riot from 'riot'
import {FetchPriorityList, FetchVipList, FetchLoyaltyList, FetchGroupByList, FetchSearchList} from './fetch'

export class HeaderStore {
    constructor() {
        riot.observable(this);
        this.events();
        this.FiltersData = new Map();
    }

    async GetDataForFilters() {
        if( !this.FiltersData.size ) {
            this.CreateFiltersData( await FetchPriorityList(), 'Priority' );
            this.CreateFiltersData( await FetchVipList(), 'Vip' );
            this.CreateFiltersData( await FetchLoyaltyList(), 'Loyalty' );
            this.CreateFiltersData( await FetchGroupByList(), 'GroupBy' );
            this.CreateFiltersData( await FetchSearchList(), 'Search' );
        }
        const data = this.MapToObj( this.FiltersData );
        this.trigger('GetDataForFiltersDone', data);
        
    }
    CreateFiltersData(filterItem, name) {
        if( !this.FiltersData.get(name) ) {
            this.FiltersData.set(name, filterItem);
        }
    }
    
    MapToObj(Map) {
        let obj = Object.create(null);
        for (let [k,v] of Map) {
            obj[k] = v;
        }
        return obj;
    }
    events() {
        this.on('GetDataForFilters', this.GetDataForFilters);
    }
}