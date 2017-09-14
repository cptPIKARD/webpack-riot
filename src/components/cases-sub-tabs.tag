cases-sub-tabs
    .sub-tab
        ul.nav.nav-tabs.nav-sub-console
            li.active.text-bold(onClick="{ChangeSubTabHandler}")
                a(data-toggle="tab" href="#Open")
                    i.fa.fa-angle-double-right(aria-hidden="true") Open
                    span.badge 1
            li.text-bold(onClick="{ChangeSubTabHandler}")
                a(data-toggle="tab" href="#Pending")
                    i.fa.fa-angle-double-right(aria-hidden="true") Pending
                    span.badge 1
            li.text-bold(onClick="{ChangeSubTabHandler}")
                a(data-toggle="tab" href="#Celebrate")
                    i.fa.fa-angle-double-right(aria-hidden="true") Celebrate
                    span.badge 1

    script.
        ChangeSubTabHandler(ev)
        {
            mainTab.trigger('SubTabChanged', $(ev.currentTarget).find('a').attr('href'));
        }

    script(type = 'javascript').
        import {mainTab} from '../utils/mainTab'