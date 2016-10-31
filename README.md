scenario week 4:

As much of the build process and deployment as possible should be automated
Outcomes: Understanding/practical experience of configuring a VM on AWS for specific roles
Understanding and practical experience of deploying an application
Appreciation of how automation can be achieved and some of the tools available

EC2

Development platofrm
Precisely configured with specific set of tools and versions, easily reproducible


Staging platofrm
Confirm that application can be deployed
Miics production environment but also configured for testing and logging
Avoids risks of direct deployment to production


Production platform
Stripped down to essential software everything else removed


VCS
github/gitlab.cs.ucl.ac.uk
Part of automation: our tool shall clone all the code automatically


successful git branching model
http://nvie.com/posts/a-successful-git-branching-model/

http://nvie.com/files/Git-branching-model.pdf

--> Build independent of IDE (use build tool like maven/gradle/~~~~)


# The task at hand
quick link to moodle: https://moodle.ucl.ac.uk/course/view.php?id=18729&section=7
Design straightforward web app (simple citation store)
**QUICKLY BUILD THE WEBAPP**
## Webapp spec
https://moodle.ucl.ac.uk/pluginfile.php/3127075/mod_resource/content/3/comp204p-sw1-spec.pdf

Goals:
1. Configure staging and production server
2. Create webapp with basic spec including DB
3. Script deployment of app to servers
4. Support automatic restart if the server crsahes/restarts
5. Devise a way to backup/restore DB on production server
   -> Find out ways to backup the data (every two hours etc)
   - Store multiple versions since DB may be corrupted
