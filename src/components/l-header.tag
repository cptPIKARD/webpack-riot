l-header
    .container-fluid
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
                        select.multiselect-ui.form-control(style='display: none;' multiple="multiple" id="msPriority" onChange='{ ChangeHandler }')
                            option( value='{item.id}' each='{ item in Priority }' ) {item.name}
                            //option(value="1" selected="selected") Low
                            //option(value="2" selected="selected") Medium
                            //option(value="3" selected="selected") High
            .col-xs-12( class='col-sm-4 col-md-2 col-lg-2')
                .form-group.nomargin
                    label.control-label VIP
                    .input-group(style='background-color:#fff; width: 100%;')
                        span.input-group-addon
                            i.fa.fa-star-o(aria-hidden="true")
                        select.multiselect-ui.form-control(style='display: none;' multiple="multiple" id="msVIP")
                            option(value="1" selected="selected") 1
                            option(value="2" selected="selected") 2
                            option(value="3" selected="selected") 3
                            option(value="3" selected="selected") 4
                            option(value="3" selected="selected") 5
            .col-xs-12( class='col-sm-4 col-md-2 col-lg-2')
                .form-group.nomargin
                    label.control-label VIP
                    .input-group(style='background-color:#fff; width: 100%;')
                        span.input-group-addon
                            i.fa.fa-credit-card(aria-hidden="true")
                        select.multiselect-ui.form-control(style='display: none;' multiple="multiple" id="msLoyalty1")
                            option(value="1" selected="selected") Black
                            option(value="2" selected="selected") Silver
                            option(value="3" selected="selected") Gold
                            option(value="4" selected="selected") Platinum
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
                            option(value="1" selected="selected") No Grouping
                            option(value="2" selected="selected") Priority
                            option(value="3" selected="selected") Time
                            option(value="4" selected="selected") Category
                            option(value="5" selected="selected") Subcategory
                            option(value="6" selected="selected") VIP Tier
                            option(value="7" selected="selected") Loyalty Tier
            .col-xs-12( class='col-sm-4 col-md-2 col-lg-2')
                .form-group.nomargin
                    label.control-label Search
                    .input-group(style='background-color:#fff; width: 100%;')
                        span.input-group-addon
                            i.fa.fa-search(aria-hidden="true")
                        select.multiselect-ui.form-control(style='display: none;' multiple="multiple" id="msLoyalty")
                            option(value="1" selected="selected") SR Service / Case Reason
                            option(value="2" selected="selected") Description
                            option(value="3" selected="selected") Guest Name
                            option(value="4" selected="selected") Status
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
    .col( each='{ item in data  }' )
        p { item.name }


    script.


    script(type='javascript').

        const ctx = this;

        console.log('NODE_ENV ', NODE_ENV);

        ctx.Priority = [
            {name: 'Low'},
            {name: 'Medium'},
            {name: 'High'}
        ];

        ctx.on('mount', function () {
            $('.multiselect-ui').multiselect({
                includeSelectAllOption: true,
                onChange: function (ev) {
                    console.log('ev ', ev);
                },
                onSelectAll: function (ev) {
                    console.log('ev ', ev);
                },
                onDeselectAll: function (ev) {
                    console.log('ev ', ev);
                }
            });
        });
