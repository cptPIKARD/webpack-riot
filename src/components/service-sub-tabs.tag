service-sub-tabs
    .sub-tab
        ul.nav.nav-tabs.nav-sub-console
            li.active.text-bold(onClick="{ChangeSubTabHandler}")
                a(data-toggle="tab" data-filter="Department" href="#Department")
                    i.fa.fa-angle-double-right(aria-hidden="true") Department
                    span.badge 1
            li.text-bold(onClick="{ChangeSubTabHandler}")
                a(data-toggle="tab" data-filter="DepartmentOverdue" href="#DepartmentOverdue")
                    i.fa.fa-angle-double-right(aria-hidden="true") OVERDUE (DEPARTMENT)
                    span.badge 1
            li.text-bold(onClick="{ChangeSubTabHandler}")
                a(data-toggle="tab" data-filter="Hotels" href="#Hotels")
                    i.fa.fa-angle-double-right(aria-hidden="true") Hotels
                    span.badge 1

    script.
        ChangeSubTabHandler(ev)
        {
            mainStore.trigger('ServiceSubTabChanged', $(ev.currentTarget).find('a').attr('data-filter'));
        }

    script(type = 'javascript').
        import {mainStore} from '../utils/mainStore';