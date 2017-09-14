service-grid
    table.table.table-hover.table-transactions
        thead
            tr
                th(align="left" class="text-nowrap" width="1") SR#
                th(align="left" class="text-nowrap" width="1") ROOM
                th(align="center" class="text-nowrap" width="1") PAX
                th(align="left" class="text-nowrap" width="1") VIP
                th(align="left" class="text-nowrap" width="1") Loyalty
                th(class="text-left col-lg-2") Guest
                th(class="text-left col-lg-2") Qty & Service
                th(class="text-left col-lg-2") Requested By
                th(class="text-left col-lg-2") Assigned To
                th(class="text-left col-lg-2") Case #
                th(class="text-left col-lg-2") Status
                th(align="left" class="text-nowrap" width="1") Time
                th(align="left" class="text-nowrap" width="1") SLA
        tbody
            tr(each='{ item in opts.service }')
                td(align="left" class="text-nowrap" width="1")
                    span.text-nowrap {item.Sr}
                td(align="left" class="text-nowrap" width="1")
                    span.text-nowrap {item.Room}
                td(align="left" class="text-nowrap" width="1")
                    span.text-nowrap
                        strong {item.Pax.Adult} x
                        i.fa.fa-male
                        strong {item.Pax.Child} x
                        i.fa.fa-child
                td(align="center" class="text-nowrap" width="1")
                    span.text-nowrap {item.Vip}
                td(align="left" class="text-nowrap" width="100")
                    span.text-nowrap
                        span.label.label-red.tier-bg-4 {item.Loyalty.name}
                        i.fa.fa-credit-card
                td(class="text-left col-lg-2") {item.Guest}
                td(class="text-left col-lg-2")
                    span.text-nowrap
                        b {item.Services.quantity}x
                        |  {item.Services.name}
                td(class="text-left col-lg-1") {item.RequestedBy}
                td(class="text-left col-lg-1") {item.AssignedTo}
                td(class="text-left col-lg-1") {item.Case }
                td(class="text-left col-lg-1")
                    span.text-nowrap.text-red.text-uppercase {item.Status}
                td(class='text-left text-nowrap')
                    i.fa.fa-calendar {item.Time.date}
                    i.fa.fa-clock-o {item.Time.time}
                td(class='text-left text-nowrap')
                    span.text-nowrap
                    span.label.label-red {item.Sla}
                        i.fa.fa-clock-o
