l-header
    l-header-state( header={ FilterData } )

    script.

    script(type='javascript').

        import {mainStore} from '../utils/mainStore'

        const ctx = this,
            currentView = mainStore.CurrentView,
            currentHeader = mainStore.GetHeader( currentView ),
            currentHeaderData = currentHeader.FiltersData;

        ctx.FilterData = currentHeaderData.size ? currentHeaderData : [];

        ctx.on('mount', function () {
            currentHeader.trigger('GetDataForFilters');
        });
        currentHeader.on('GetDataForFiltersDone', function (data) {
            ctx.FilterData = data;
            ctx.update();
            console.log('data ', data);
        });
        mainStore.on('MainTabChangedDone', function (header) {
            header.trigger('GetDataForFilters');
        });
        ctx.on('unmount', function () {
            currentHeader.off('GetDataForFilters');
        });
        ctx.on('updated', function () {
            $('.multiselect-ui').multiselect({
                includeSelectAllOption: true,
                onChange: function (ev) {
                    const obj = {
                        value: +$(ev).val(),
                        filterName: +$(ev).val()
                    }
                    currentHeader.trigger('FilterChanged');
                },
                onSelectAll: function (ev) {
                    console.log('ev ', ev);
                },
                onDeselectAll: function (ev) {
                    console.log('ev ', ev);
                }
            });
        })

