main-tab
    ul.nav.nav-tabs.nav-console
        li.active.text-bold( onClick="{ChageTabHandler}")
            a(data-toggle="tab" href="#ServiceRequests")
                i.fa.fa-angle-double-right(aria-hidden="true") SERVICE REQUESTS
                span.badge 1
        li.text-bold( onClick="{ChageTabHandler}")
            a(data-toggle="tab" href="#Cases")
                i.fa.fa-angle-double-right(aria-hidden="true") CASES
                span.badge 2
    .clearfix
        br


    script.
        ChageTabHandler(ev)
        {
            mainTab.trigger('TabChanged', $(ev.currentTarget).find('a').attr('href'));
        }

    script(type='javascript').
        import {mainTab} from '../utils/mainTab'
        const ctx = this;
