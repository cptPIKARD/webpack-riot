l-header-state
    .row
        .col-xs-12( class='col-sm-4 col-md-2 col-lg-2')
            .form-group.nomargin
                label.control-label Status
                .input-group(style='background-color:#fff; width: 100%;')
                    div(style='padding:5px; padding-top:2px; padding-left:10px; padding-right:10px; border:1px solid #eee !important; height:40px; width:100%; display:table;')
                        table(width="100%" border="0" cellspacing="0" cellpadding="0")
                            tr
                                td.text-nowrap(align="center" valign="middle")
                                    label.control-label.input-md
                                        input(type='checkbox')
                                        span Closed
                                td.text-nowrap(align="center" valign="middle")
                                    label.control-label.input-md
                                        input(type='checkbox')
                                        span Cancelled
                                td.text-nowrap(align="center" valign="middle")
                                    label.control-label.input-md
                                        input(type='checkbox')
                                        span On Hold
        .col-xs-12( class='col-sm-4 col-md-2 col-lg-2')
            .form-group.nomargin
                label.control-label Priority
                .input-group(style='background-color:#fff; width: 100%;')
                    span.input-group-addon
                        i.fa.fa-sort(aria-hidden="true")
                    select.multiselect-ui.form-control(style='display: none;' multiple="multiple" id="msPriority")
                        option( value='{item.value}' each='{ item in FilterData.Priority }' data-filter='Priority' selected='{item.Selected}' ) {item.name}
        .col-xs-12( class='col-sm-4 col-md-2 col-lg-2')
            .form-group.nomargin
                label.control-label VIP
                .input-group(style='background-color:#fff; width: 100%;')
                    span.input-group-addon
                        i.fa.fa-star-o(aria-hidden="true")
                    select.multiselect-ui.form-control(style='display: none;' multiple="multiple" id="msVIP")
                        option( value='{item.value}' each='{ item in FilterData.Vip }' ) {item.name}
        .col-xs-12( class='col-sm-4 col-md-2 col-lg-2')
            .form-group.nomargin
                label.control-label Loyalty
                .input-group(style='background-color:#fff; width: 100%;')
                    span.input-group-addon
                        i.fa.fa-credit-card(aria-hidden="true")
                    select.multiselect-ui.form-control(style='display: none;' multiple="multiple" id="msLoyalty1")
                        option( value='{item.value}' each='{ item in FilterData.Loyalty }' ) {item.name}
        .col-xs-12( class='col-sm-4 col-md-2 col-lg-2')
            .form-group.nomargin
                label.control-label SR/Case #
                .input-group(style='background-color:#fff; width: 100%;')
                    span.input-group-addon
                        i.fa.fa-hashtag(aria-hidden="true")
                    input.form-control(type='text')
        .col-xs-12( class='col-sm-4 col-md-2 col-lg-2')
            .form-group.nomargin
                label.control-label Room #
                .input-group(style='background-color:#fff; width: 100%;')
                    span.input-group-addon
                        i.fa.fa-bed(aria-hidden="true")
                    input.form-control(type='text')
    .row
        .col-xs-12( class='col-sm-4 col-md-2 col-lg-2')
            .form-group.nomargin
                label.control-label From
                .input-group(style='background-color:#fff; width: 100%;')
                    span.input-group-addon
                        i.fa.fa-calendar-o(aria-hidden="true")
                    input.form-control(type='datetime-local')
        .col-xs-12( class='col-sm-4 col-md-2 col-lg-2')
            .form-group.nomargin
                label.control-label To
                .input-group(style='background-color:#fff; width: 100%;')
                    span.input-group-addon
                        i.fa.fa-calendar-o(aria-hidden="true")
                    input.form-control(type='datetime-local')
        .col-xs-12( class='col-sm-4 col-md-2 col-lg-2')
            .form-group.nomargin
                label.control-label Group By
                .input-group(style='background-color:#fff; width: 100%;')
                    span.input-group-addon
                        i.fa.fa-object-group(aria-hidden="true")
                    select.form-control( id="selGroupping")
                        option( value='{item.value}' each='{ item in FilterData.GroupBy }' ) {item.name}
        .col-xs-12( class='col-sm-4 col-md-2 col-lg-2')
            .form-group.nomargin
                label.control-label Search
                .input-group(style='background-color:#fff; width: 100%;')
                    span.input-group-addon
                        i.fa.fa-search(aria-hidden="true")
                    select.multiselect-ui.form-control(style='display: none;' multiple="multiple" id="msLoyalty")
                        option( value='{item.value}' each='{ item in FilterData.Search }' ) {item.name}
        .col-xs-12( class='col-sm-4 col-md-2 col-lg-2')
            .form-group.nomargin
                label.control-label Delivery
                .input-group(style='background-color:#fff; width: 100%;')
                    span.input-group-addon
                        i.fa.fa-paper-plane(aria-hidden="true")
                    input.form-control(type='text')
        .col-xs-12( class='col-sm-4 col-md-2 col-lg-2')
            .form-group.nomargin
                label.control-label &nbsp;
                button.btn.btn-primary.btn-block.btn-feedback-submit Search
    .clearfix
        br

    script(type='javascript').
        const ctx  = this;
        ctx.FilterData = opts.header;


