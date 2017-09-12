import {HeaderStore} from './header.js'
import riot from 'riot'

class MainStore {
    constructor() {
        riot.observable(this);
        this.events();
        this.Headers = new Map();
        this.CurrentView = '#ServiceRequests'; //by default
        this.SetHeader('#ServiceRequests'); //when we first time init application
    }
    SetHeader(tab) {
        if( !this.Headers.get( tab ) ) {
            const headerStore = new HeaderStore();
            this.Headers.set(tab, headerStore);
        }
    }
    GetHeader(tab) {
        return this.Headers.get(tab);
    }

    MainTabChanged(tab) {
        this.CurrentView = tab;
        if( !this.GetHeader(tab) ) {
            this.SetHeader( tab );
        }
        const curHeader = this.GetHeader(tab);
        this.trigger('MainTabChangedDone', curHeader);
    }

    events() {
        this.on('MainTabChanged', this.MainTabChanged);
    }
}

export const mainStore = new MainStore();