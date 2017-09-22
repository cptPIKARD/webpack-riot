service-grid-wrap(id='ServiceRequests' class="tab-pane fade active in {groups.Class}")
    service-sub-tabs
    .widget-box.clearfix.nopadding(each='{group in groups}' style="display: { group.length ? 'block' : 'none'}")
        .widget-box-header.nomarging.header-hpriority.clearfix(data-toggle="collapse" data-target="#{group[0].groupValue + group[0].groupName}" aria-expanded="true")
            h5
                i.fa.fa-angle-double-right(aria-hidden="true")
                | {group[0].groupValue} {group[0].groupName}
                span.badge.badge-hpriority-count {group.length}
        .table-responsive.collapse.in(id="{group[0].groupValue + group[0].groupName}" aria-expanded="true")
            service-grid( service='{ group }' )
            nav(id="context-menu" class="context-menu")
                ul(class="context-menu__items")
                    li(class="context-menu__item")
                        a(href="#" class="context-menu__link" data-action="View") Change Status
                    li(class="context-menu__item")
                        a(href="#" class="context-menu__link" data-action="View") Assign to


    script(type='javascript').
        import {mainStore} from '../utils/mainStore'
        const ctx = this;

        ctx.groups = [];
        ctx.groups.Class = 'hidden';

        mainStore.on('ServiceSubTabChangedDone', function (data) {
            ctx.groups = data;
            ctx.groups.Class = 'showing';
            ctx.update();
        });
        ctx.on('updated', function () {
            $(".table tbody tr").contextmenu(function (e) {
                e.preventDefault();
                $('#context-menu').show();
            });
        });