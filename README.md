# globalentry
Global Entry queue check script

    It's written in Python (2.6), and you'll need mechanize installed for it to work. 
    There's also a bit that looks like this: "('4412', 0, 201509011245)". You need to change "7160" to whatever enrollment center you want it to check. You can find that by looking at the HTML for the dropdown list when you go to schedule an appointment. The 0 is the soonest date it will report. You can probably leave that as 0. 201509011245 is the maximum date to report. It looks ugly, but it's really just year, month, day, hour, minute. You'll want to change that to whatever your current appointment date is. That way it only reports appointments that are sooner than yours. That bit is actually a list, so you can technically add more than one enrollment center by making it look something like this: [('4412', 0, 201509011245), ('4413', 0, 201509011245)] where 4412 is the first center ID and 4413 is the second.
    I run this on Linux with cron. I rely on cron to e-mail me the output.
    I tend to treat Python like the shell scripting language bash and tcsh should have been. So this is more of a script than an app, and it's not exactly good code. If I was redoing it with the intention of giving it away, there's some things I would clean up like not using mechanize at all. Like I said before, I was being lazy when I wrote it several years ago.
