service-grid-wrap(id='ServiceRequests' class="tab-pane fade active in")
    service-sub-tabs
    .widget-box.clearfix.nopadding(each='{group in groups}' style="display: { group.length ? 'block' : 'none'}")
        .widget-box-header.nomarging.header-hpriority.clearfix(data-toggle="collapse" data-target="#{group[0].groupValue + group[0].groupName}" aria-expanded="true")
            h5
                i.fa.fa-angle-double-right(aria-hidden="true")
                | {group[0].groupValue} {group[0].groupName}
                span.badge.badge-hpriority-count {group.length}
        .table-responsive.collapse.in(id="{group[0].groupValue + group[0].groupName}" aria-expanded="true")
            service-grid( service='{ group }' )


    script(type='javascript').
        import {mainStore} from '../utils/mainStore'
        const ctx = this;

        ctx.groups = [];

        mainStore.on('ServiceSubTabChangedDone', function (data) {
            ctx.groups = data;
            ctx.update();
        });