import riot from 'riot'
import {FetchPriorityList, FetchVipList, FetchLoyaltyList, FetchGroupByList, FetchSearchList} from './fetch'
import {mainStore} from './mainStore.js'

export class HeaderStore {
    constructor(tab) {
        riot.observable(this);
        this.events();
        this.HeaderName = tab;
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
        mainStore.trigger('GetFilterDataDone', data);
    }
    CreateFiltersData(filterItem, name) {
        if( !this.FiltersData.get(name) ) {
            this.FiltersData.set(name, filterItem);
        }
    }
    FilterChanged(data) {
        let filter = this.FiltersData.get(data.filterName);
        for(let item of filter) {
            if(item.value == data.value) {
                item.Selected = data.checked;
            }
        }
        this.FiltersData.set(data.filterName, filter);
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
        this.on('FilterChanged', this.FilterChanged);
    }
}