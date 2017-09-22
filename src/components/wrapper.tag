wrapper
    .loader(class='{data.LoadClass}')
        span.fa.fa-cog.fa-spin
    form.form-horizontal(class='{data.Class}')
        .container-fluid
            l-header
            main-tab
            .tab-content
                service-grid-wrap
                cases-grid-wrap


    script(type='javascript').
        import {mainStore} from '../utils/mainStore'
        const ctx = this;
        ctx.data = {};
        ctx.data.Class = 'hidden';
        ctx.data.LoadClass = 'loading';

        mainStore.on('GetDataForFiltersDone', function (data) {
            ctx.data.Class = 'showing';
            ctx.data.LoadClass = 'loaded';
            ctx.update();
        });