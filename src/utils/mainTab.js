import riot from 'riot'
import {mainStore} from './mainStore.js'

class MainTab {
    constructor() {
        riot.observable(this);
        this.events();
    }
    TabChangedEvent(data) {
        mainStore.trigger('MainTabChanged', data)
    }
    events() {
        this.on('TabChanged', this.TabChangedEvent);
    }
}
export const mainTab =  new MainTab();