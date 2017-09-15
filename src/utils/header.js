import riot from 'riot'
import {FetchPriorityList, FetchVipList, FetchLoyaltyList, FetchGroupByList, FetchSearchList} from './fetch'
import {mainStore} from './mainStore.js'

export class HeaderStore {
    constructor(tab , initialFiltersData) {
        riot.observable(this);
        this.events();
        this.HeaderName = tab;
        this.FiltersData = new Map( JSON.parse(JSON.stringify( Array.from(initialFiltersData.entries()) )) ); 
    }

    async GetDataForFilters() {
        if( !mainStore.InitialFiltersData.size ) {
            this.CreateFiltersData( await FetchPriorityList(), 'Priority' );
            this.CreateFiltersData( await FetchVipList(), 'Vip' );
            this.CreateFiltersData( await FetchLoyaltyList(), 'Loyalty' );
            this.CreateFiltersData( await FetchGroupByList(), 'GroupBy' );
            this.CreateFiltersData( await FetchSearchList(), 'Search' );
            this.CreateFiltersData( [{name: 'Closed', value: false}, {name: 'Cancelled', value: false}, {name: 'OnHold', value: false}], 'Status' );
            this.CreateFiltersData( {value: ''}, 'SRCase' );
            this.CreateFiltersData( {value: ''}, 'Delivery' );
            this.CreateFiltersData( {value: ''}, 'Room' );
        }
        mainStore.trigger('GetFilterDataDone', this.FiltersData);
    }
    CreateFiltersData(filterItem, name) {
        if( !this.FiltersData.get(name) ) {
            this.FiltersData.set(name, filterItem);
        }
    }
    FilterChanged(data) {
        let filter = this.FiltersData.get(data.filterName);
            if( data.filter == 'input' ) {
                filter.value = data.value;
            }else if( data.filter == 'GroupBy' ) {
                for(let item of filter) {
                    if( item.value == data.value ) {
                        item.Selected = data.checked;
                    }else {
                        item.Selected = false;
                    }
                }
            }else {
                for(let item of filter) {
                    switch ( data.value ) {
                        case 'selectAll':
                            item.Selected = true;
                            break;
                        case 'deselectAll':
                            item.Selected = false;
                            break;
                        case item.value:
                            item.Selected = data.checked;
                            break;
                    }
                    
            }
        }
        this.FiltersData.set(data.filterName, filter);
    }
    events() {
        this.on('GetDataForFilters', this.GetDataForFilters);
        this.on('FilterChanged', this.FilterChanged);
    }
}