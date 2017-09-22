l-header-state
    .header-state
        .header-data
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
                            select.multiselect-ui.form-control(style='display: none;' multiple="multiple" id="Priority")
                                option( value='{item.value}' each='{ item in opts.header.Priority }' data-filter='Priority' selected='{item.Selected}' ) {item.name}
                .col-xs-12( class='col-sm-4 col-md-2 col-lg-2')
                    .form-group.nomargin
                        label.control-label VIP
                        .input-group(style='background-color:#fff; width: 100%;')
                            span.input-group-addon
                                i.fa.fa-star-o(aria-hidden="true")
                            select.multiselect-ui.form-control(style='display: none;' multiple="multiple" id="Vip")
                                option( value='{item.value}' each='{ item in opts.header.Vip }' data-filter='Vip' selected='{item.Selected}' ) {item.name}
                .col-xs-12( class='col-sm-4 col-md-2 col-lg-2')
                    .form-group.nomargin
                        label.control-label Loyalty
                        .input-group(style='background-color:#fff; width: 100%;')
                            span.input-group-addon
                                i.fa.fa-credit-card(aria-hidden="true")
                            select.multiselect-ui.form-control(style='display: none;' multiple="multiple" id="Loyalty")
                                option( value='{item.value}' each='{ item in opts.header.Loyalty }' data-filter='Loyalty' selected='{item.Selected}' ) {item.name}
                .col-xs-12( class='col-sm-4 col-md-2 col-lg-2')
                    .form-group.nomargin
                        label.control-label SR/Case #
                        .input-group(style='background-color:#fff; width: 100%;')
                            span.input-group-addon
                                i.fa.fa-hashtag(aria-hidden="true")
                            input.form-control(type='text' id='SRCase' value='{ opts.header.SRCase ? opts.header.SRCase.value : "" }')
                .col-xs-12( class='col-sm-4 col-md-2 col-lg-2')
                    .form-group.nomargin
                        label.control-label Room #
                        .input-group(style='background-color:#fff; width: 100%;')
                            span.input-group-addon
                                i.fa.fa-bed(aria-hidden="true")
                            input.form-control(type='text' id='Room' value='{ opts.header.Room ? opts.header.Room.value : ""}')
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
                            select.form-control( id="GroupBy")
                                option( value='{item.value}' each='{ item in opts.header.GroupBy }' data-filter='GroupBy' selected='{item.Selected}' ) {item.name}
                .col-xs-12( class='col-sm-4 col-md-2 col-lg-2')
                    .form-group.nomargin
                        label.control-label Search
                        .input-group(style='background-color:#fff; width: 100%;')
                            span.input-group-addon
                                i.fa.fa-search(aria-hidden="true")
                            select.multiselect-ui.form-control(style='display: none;' multiple="multiple" id="Search")
                                option( value='{item.value}' each='{ item in opts.header.Search }' data-filter='Search' selected='{item.Selected}' ) {item.name}
                .col-xs-12( class='col-sm-4 col-md-2 col-lg-2')
                    .form-group.nomargin
                        label.control-label Delivery
                        .input-group(style='background-color:#fff; width: 100%;')
                            span.input-group-addon
                                i.fa.fa-paper-plane(aria-hidden="true")
                            input.form-control(type='text' id='Delivery' value='{opts.header.Delivery ? opts.header.Delivery.value : ""}')
                .col-xs-12( class='col-sm-4 col-md-2 col-lg-2')
                    .form-group.nomargin
                        label.control-label &nbsp;
                        button.btn.btn-primary.btn-block.btn-feedback-submit(id="Submit" onClick="{GetDataFromCrm}") Search
            .clearfix
                br



    script.
        GetDataFromCrm(ev)
        {
            ev.preventDefault()
            mainStore.trigger('GetDataFromCrm')
        }
    script(type='javascript').
        import {mainStore} from '../utils/mainStore'







