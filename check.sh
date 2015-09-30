#!/usr/bin/env python
import mechanize
import re
from os import path

USERNAME=''
PASSWORD=''

for center,mindate,maxdate in [('4412', 0, 201509011245)]:
    br = mechanize.Browser()
    br.open("https://goes-app.cbp.dhs.gov/main/goes")
    br.select_form(nr=0)
    br["username"] = USERNAME
    br["password"] = PASSWORD
    br.submit()

    br.follow_link(text='Enter')

    data = br.response().read()

    br.select_form('ApplicationActionForm')
    br.form.set_all_readonly(False)
    br['actionFlag'] = 'existingApplication'
    br['homepageProgramIndex'] = '0'
    resp = br.submit()

    br.select_form('ConfirmationForm')
    br.form.set_all_readonly(False)
    br['actionFlag'] = 'reschedule'
    resp = br.submit()

    br.select_form('ApplicationActionForm')
    br.form.set_all_readonly(False)
    br['forwardFlag'] = 'next'
    br['selectedEnrollmentCenter'] = [center]
    resp = br.submit()

    data = resp.get_data()

    matches = re.findall(r"'scheduleForm', 'scheduleForm:schedule1', '(\d{12})'", data)
    first = matches[0]
    timeformat = first[:4]+'-'+first[4:6]+'-'+first[6:8]+'T'+first[8:10]+':'+first[10:12]
    first = int(first)

    if (mindate < first < maxdate):
        print 'New appt avail', timeformat, center 
