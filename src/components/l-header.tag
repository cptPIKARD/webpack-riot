l-header
    l-header-state( header='{ FilterData }' )

    script.
        GetDataFromCrm()
        {
            mainStore.trigger('GetDataFromCrm')
        }

    script(type='javascript').

        import {mainStore} from '../utils/mainStore'

        const ctx = this;

        ctx.FilterData = {};
        ctx.FilterData.Class = 'hidden';
        ctx.FilterData.LoadClass = 'loading';

        ctx.on('mount', function () {
            mainStore.trigger('GetDataForFilters');
        });

        mainStore.on('GetDataForFiltersDone', function (data) {
            ctx.FilterData = data;
            ctx.FilterData.Class = 'showing';
            ctx.FilterData.LoadClass = 'loaded';
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
                    const currentView = mainStore.CurrentView,
                            currentHeader = mainStore.GetHeader(currentView),
                            data = {
                                value: 'selectAll',
                                filterName: $(this)[0].$select.attr('id')
                            };
                    currentHeader.trigger('FilterChanged', data);
                },
                onDeselectAll: function (ev) {
                    const currentView = mainStore.CurrentView,
                            currentHeader = mainStore.GetHeader(currentView),
                            data = {
                                value: 'deselectAll',
                                filterName: $(this)[0].$select.attr('id')
                            };
                    currentHeader.trigger('FilterChanged', data);
                }
            });
            $('.multiselect-ui').multiselect('rebuild');
            $('#GroupBy').on('change', function (ev) {
                const currentView = mainStore.CurrentView,
                        currentHeader = mainStore.GetHeader(currentView),
                        data = {
                            checked: true,
                            value: +$(ev.currentTarget).val(),
                            filterName: $(ev.currentTarget).attr('id')
                        };
                currentHeader.trigger('FilterChanged', data);
            })
            $('input.form-control').on('change', function (ev) {
                const currentView = mainStore.CurrentView,
                        currentHeader = mainStore.GetHeader(currentView),
                        data = {
                            filter: 'input',
                            value: $(ev.currentTarget).val(),
                            filterName: $(ev.currentTarget).attr('id')
                        };
                currentHeader.trigger('FilterChanged', data);
            })
        });


        ctx.on('unmount', function () {
            mainStore.off('GetDataForFilters');
        });

