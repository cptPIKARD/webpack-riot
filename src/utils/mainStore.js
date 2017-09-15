import {HeaderStore} from './header.js'
import {FetchServiceData} from './fetch.js'
import riot from 'riot'

class MainStore {
    constructor() {
        riot.observable(this);
        this.events();
        this.Headers = new Map();
        this.Layouts = new Map();
        this.InitialFiltersData = new Map();
        this.CurrentView = '#ServiceRequests'; //by default
        this.CurrentSubView = 'Department'; //by default
        this.SetHeader('#ServiceRequests'); //when we first time init application
    }
    SetHeader(tab) {
        if( !this.Headers.get( tab ) ) {
            const headerStore = new HeaderStore(tab, this.InitialFiltersData);
            this.Headers.set(tab, headerStore);
        }
    }
    GetHeader(tab) {
        return this.Headers.get(tab);
    }

    async GetDataFromCrm() {
        if( this.CurrentView == '#ServiceRequests' ) {
            let serviceResponse =  await FetchServiceData();
            this.Layouts.set( this.CurrentView, serviceResponse );
            this.ServiceSubTabChanged( this.CurrentSubView );
        }else if( this.CurrentView == '#Case' ) {
            let caseResponse =  await FetchCaseData();
        }
    }

    GetDataForFilters() {
        let header = this.GetHeader(this.CurrentView);
        header.trigger('GetDataForFilters');
    }
    GetDataForFiltersDone(data) {
        if( !this.InitialFiltersData.size ) {
            this.InitialFiltersData = new Map( JSON.parse(JSON.stringify( Array.from(data.entries()) )) );
        }
        const dataToView = this.MapToObj( data );
        this.trigger('GetDataForFiltersDone', dataToView);
    }

    MainTabChanged(tab) {
        this.CurrentView = tab;
        if( !this.GetHeader(tab) ) {
            this.SetHeader( tab );
        }
        const curHeader = this.GetHeader(tab);
        this.trigger('MainTabChangedDone', curHeader);
    }
    ServiceSubTabChanged(subTab) {
        this.CurrentSubView = subTab;
        let dataLayout = this.Layouts.get( this.CurrentView );

        const FilterSubServices = (service) => service.SubFilter == subTab;
        const MainFilterSubServices = compose(FilterSubServices);
        const subData = this.FilterForSubServices( MainFilterSubServices, dataLayout );
        const groupData = this.GroupingData( subData );

        this.trigger('ServiceSubTabChangedDone', groupData);
        console.log('dataToView ', groupData);
    }
    FilterForSubServices( filters, data ) {
        let res = [];

        for ( let row of data ) {
            let check = filters(row);
            if( check ) {
                res.push(row);
            }
        }

        return res;
    }
    GroupingData( data ) {
        const header = this.GetHeader( this.CurrentView );
        let dataFilters = header.FiltersData.get('GroupBy'),
            selectedGroup = this.GetCurrentGroupFilter( dataFilters );

        if( selectedGroup[0].value == 1 ) {
            return [data];
        }else {
            let groupValues = header.FiltersData.get( selectedGroup[0].name );
            let groupMap = this.CreateMapForGroup( groupValues );

            return this.SetGroupsToData(data, groupMap, selectedGroup[0].name);
        }
    }
    SetGroupsToData( data, groups, groupName ) {
        for(let item of data ) {
            item.groupName = groupName;
            item.groupValue = item[groupName].name;
            let arr = groups.get( item[groupName].value );
            arr.push( item );
            groups.set( item[groupName].value, arr );
        }

        return Array.from( groups.values() );
    } 
    CreateMapForGroup(values) {
        let map = new Map();
        for(let item of values) {
            map.set(item.value, []);
        }
        return map;
    }
    GetCurrentGroupFilter(filters) {
        return filters.filter(function (filter, i) {
            return filter.Selected;
        });
    }

    MapToObj(Map) {
        let obj = Object.create(null);
        for (let [k,v] of Map) {
            obj[k] = v;
        }
        return obj;
    }
    events() {
        this.on('MainTabChanged', this.MainTabChanged);
        this.on('ServiceSubTabChanged', this.ServiceSubTabChanged);

        this.on('GetDataForFilters', this.GetDataForFilters);
        this.on('GetFilterDataDone', this.GetDataForFiltersDone);
        this.on('GetDataFromCrm', this.GetDataFromCrm);
    }
}
export const compose = (...fns) => fns.reduce((f, g) => (...args) => f(g(...args)))
export const mainStore = new MainStore();