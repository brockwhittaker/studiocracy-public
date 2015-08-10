# README

# studiocracy
Studiocracy addresses the difficulty emerging artists have with getting their work noticed by letting them bypass the gallery system and interact directly with their communities. Unlike other art retailers, Studiocracy is a social network first and a marketplace second. We track user engagement through a community voting system and produce data analytics to help artists understand and develop their followings without the pressure to treat their studio like a business. In doing so, we provide buyers and sellers with the context to successfully and knowledgably navigate through the art world and make their voices heard.

* Rails 4.2.0
* Ruby 2.2.1
* Much of the work on this project is done in RubyMine, which you can grab with a student license here: https://www.jetbrains.com/student/

* Running on PostgreSQL -- install Postgres.app to run database locally on Mac

# How to Contribute
* BY CONTRIBUTING TO THIS PROJECT, ALL CONTRIBUTORS AGREE TO THE TERMS LAID OUT IN THE CONTRIBUTOR LICENSE AGREEMENT, FOUND IN THE ROOT OF THE PROJECT.
* You can either set your development environment up locally or use a cloud-based IDE to let you work in your browser. While most of our developers work locally, in-browser IDEs may be a better alternative for users who may not want to go through the effort of installing Linux on a Windows machine. We reccommend Cloud9: https://c9.io/
* FULL STEP-BY-STEP GUIDE ON CLOUD9 SETUP AVAILABLE HERE: https://docs.google.com/document/d/1Iz6dZUZajbmrXTQJi7UUr5DE8zuyPRtfWt_Yc-g2H24/edit?usp=sharing
* First fork and clone this repo and import it into Cloud9. Select Ruby on Rails application. Run bundle install in the command line. Then follow the steps in this post ALMOST exactly. The only thing you need to change is the database name from "sample_app_development" to "studiocracy_development" and do so for all three database names: http://stackoverflow.com/questions/26545746/cloud9-postgres
* You should be set up! If you run into any errors, document them here and ask questions on the Slack.
* See onboarding guides for local setup here:
https://drive.google.com/folderview?id=0BxTarWOIystqflByWkkzSy1VQTNUS2xpT2JsUWlxTThQdVpFdHdRWUdqVXNadHdab0dXQVk&usp=sharing
* Read and follow this SO answer about the Github workflow: http://stackoverflow.com/questions/20956154/whats-the-workflow-to-contribute-to-an-open-source-project-using-git-pull-reque

# Community
* We meet on Sundays at 4 p.m. and Wednesdays at 7 p.m. Arizona time on Google Hangouts. Check the Slack for a link before each meeting.
* We do project management on Taiga.io. You can see our current project status and to-do list here:
 https://tree.taiga.io/project/jcdjulian-studiocracy/
* To become a member on our team on Taiga and receive assignments, make a Taiga account and email julian.deocampo@gmail.com for an invitation
* In Taiga, click "Backlog" to see our current status. Identify which Sprint we're in and click on it to be taken to that iteration's sprint taskboard. Anything under "Open" that is unassigned is up for grabs!
* Issue tracking is handled on Taiga, not Github! Check the Issues section.
* Under backlog, you can view a burndown chart of our tasks this sprint and how close we're getting to the latest release.
* Communication in handled through the studiocracy-public Slack chat. Contact julian.deocampo@gmail.com for Slack access or for troubleshooting

#Gem notes:
* Uses friendly_id to generate string URL tails. Never call user.id, only user.friendly.id
* Uses devise for user authentication
* Users paperclip 4.2.1 for media uploads
* Uses Stripe gem. Stripe keys in file are dummy keys. Real keys will be passed into environment when server starts.

# To deploy for testing

* Fork and clone repository.
* Ensure you have rails, rake, bundler, and ruby installed (look up install guide)
* Run Postgres
* Run rake db:migrate in command line
* run rails s in folder root
* go to http://localhost:3000/

#Project Structure
We operate similar to other companies whose core products are open-source and exist to serve the development of the project. There's studiocracy-public, our open source project that anyone can be a volunteer and work on. Studiocracy, Inc. is the entity that manages and maintains the project, hosts it, and makes sure we have the finances to continue growing it.

In our team, there are three levels of membership. The first is as an open source contributor, which is purely voluntary. These members can contribute to studiocracy-public at their skill level and are not obligated to attend meetings or appear in office. These members are largely unaffiliated with Studiocracy, Inc.

The second role is as a core team member, meaning that this person contributes significantly to the outcome of the company, attends staff meetings and manage the project. These members are considered for equity splits in the company contingent on performing their duties in the company.

The third role is legal employee, which is currently just limited to myself (Julian) for legal purposes. We don't currently have the funding to pay a salary or stipend, but one day we want to be able to move our Core Team Members to full time positions to keep the project growing.

We have Agile-style meetings Wednesday at 7pm and Sundays at 4pm - which you can attend either in person at our office or through Google Hangouts. Anyone is welcome to attend the meetings and participate. During meeting, a contributor can petition a request to be a team member and make their case. The current team members will then discuss and vote after the meeting whether to bring the person into the company.

Equity is handled in a similar way. You make a case for your equity request at meeting and the company will vote on what number they think should be offered.

=======

