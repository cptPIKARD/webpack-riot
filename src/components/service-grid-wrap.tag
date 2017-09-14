service-grid-wrap(id='ServiceRequests' class="tab-pane fade active in")
    service-sub-tabs
    .widget-box.clearfix.nopadding
        .widget-box-header.nomarging.header-hpriority.clearfix(data-toggle="collapse" data-target="#hpriority" aria-expanded="true")
            h5 HIGH PRIORITY
                i.fa.fa-angle-double-right(aria-hidden="true")
                span.badge.badge-hpriority-count 2
        .table-responsive.collapse.in(id="hpriority" aria-expanded="true")
            service-grid( service='{ grid }' )


    script(type='javascript').
        import {mainStore} from '../utils/mainStore'
        const ctx = this;

        ctx.grid = [];

        mainStore.on('ServiceSubTabChangedDone', function (data) {
            ctx.grid = data;
            ctx.update();
        });