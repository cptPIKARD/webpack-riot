l-header
    l-header-state( header='{ FilterData }' )

    script.

    script(type='javascript').

        import {mainStore} from '../utils/mainStore'

        const ctx = this;

        ctx.FilterData = [];

        ctx.on('mount', function () {
            mainStore.trigger('GetDataForFilters');
        });

        mainStore.on('GetDataForFiltersDone', function (data) {
            ctx.FilterData = data;
            ctx.update();
        });

        mainStore.on('MainTabChangedDone', function (header) {
            header.trigger('GetDataForFilters');
        });

        ctx.on('updated', function () {
            $('.multiselect-ui').multiselect({
                includeSelectAllOption: true,
                onChange: function (ev, checked) {
                    const currentView = mainStore.CurrentView,
                            currentHeader = mainStore.GetHeader(currentView),
                            data = {
                                    value: +$(ev).val(),
                                    checked: checked,
                                    filterName: $(ev).attr('data-filter')
                                };
                    currentHeader.trigger('FilterChanged', data);
                },
                onSelectAll: function (ev) {
                    console.log('ev ', ev);
                },
                onDeselectAll: function (ev) {
                    console.log('ev ', ev);
                }
            });
            $('.multiselect-ui').multiselect('rebuild');
        });


        ctx.on('unmount', function () {
            mainStore.off('GetDataForFilters');
        });

