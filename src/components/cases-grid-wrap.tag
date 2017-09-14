cases-grid-wrap(id='Cases' class="tab-pane fade")
    cases-sub-tabs
    .widget-box.clearfix.nopadding
        .widget-box-header.nomarging.header-hpriority.clearfix(data-toggle="collapse" data-target="#hpriority" aria-expanded="true")
            h5 HIGH PRIORITY
                i.fa.fa-angle-double-right(aria-hidden="true")
                span.badge.badge-hpriority-count 2
        .table-responsive.collapse.in(id="hpriority" aria-expanded="true")
            cases-grid( case='{ grid }' )