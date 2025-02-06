# Homey take home assignment

## Designing the app

I always try to have in mind the JTBD (jobs to be done) framework approach when trying to figure what are the main motivations to develop any feature.

That said I tried to identify the core job and its main tasks:Main Job: enable users to track and manage the progress of a project through a conversation history

Main tasks: 
1. Leaving comments: Users need to communicate updates, ideas, or feedback.
2. Changing the status of the project: Users need to reflect the current state of the project (e.g., "In Progress," "Completed," “Archived”).

After this I would then inquiry my colleagues in order to dig deeper into context, motivations and desired outcomes of the users. I center my questions around key topics.

## Interviewing the team
The following is a brief session of Q&A between me and my team:

### 1- Users
**Me:** Who are the primary users of this app? How are they addressing the problem at the moment?

**Team:** the primary users are project managers and team members. They currently use spreadsheets to track project updates, which is disorganized

**Me:** Should there be a project owner with management rights?

**Team:** Eventually we may need some permission/ability system but right now the teams are sharing everything on a spreadsheet and do not show any reason to untrust their colleagues , so that is not a priority right now.

### 2 - Project

**Me:** What kind of projects will this app be used for and typically how many people collaborate on a project?

**Team:** This app will be used for house selling projects. Teams typically consist of 3-5 people.

**Me:** Any specific workflows or stages that the projects go through?

**Team:** Usually the status are: “Not started”, “In progress”, “On hold”, “In review”, “Completed” and “Archived”

### 3 - Comments

**Me:** What kind of information is included on the comments? Should the comments support attachments?

**Team:** Users will leave comments to share updates, ask questions, and document decisions. Attachments are not necessary initially.

**Me:** Should the users be able to delete or edit their own comments? 

**Team:** Yes.

### 4 - Project Status

**Me:** I’ll assume that the status of the project are the same you mentioned before, but who can change the project status?

**Team:** Yes, the status should be the same as mentioned before. We don’t need a permission system right now but we need to guarantee that only the project manager can change the project status. 

**Me:** Should status trigger a notification or send some kind of warning to the other team members?

**Team:** No need at this point.

### 5 - Conversation History
**Me:** How should the conversation history be displayed? In what order? Grouped by anything in particular?

**Team:** The history should be displayed in chronological order with clear indicators for status changes.

**Me:** Should the user be able to filter or search the project history?

**Team:** It would be a nice to have, but low priority right now.

**Me:** Is there a need to export the conversation history?

**Team:** Not at the moment.

### 6 - Integration
**Me:** Will there be a need to integrate with other tools? Slack, Jira?

**Team:** No integrations are needed at this point.

### 7- Scalability
**Me:** How many projects and users do you expect to support initially and how that might grow over time?

**Team:**  The app should be scalable to support more users and projects in the future.

### 8- Success metrics
**Me:** How will we measure the success of the app?

**Team:** Success will be measured by user adoption and positive feedback from the team.
 

## Core features

Based on the answers here’s how I intend to design the app:
1. Commenting System:
    * Users can leave comments with text.
    * Comments are timestamped and attributed to the user who posted them.
    * Users can edit or delete their own comments.
2. Status Changes:
    * Project managers can update the project status.
    * Status changes are logged in the conversation history with a timestamp and the name of the user who made the change.
3. Conversation History:
    * The history is displayed in chronological order.
    * Status changes are highlighted (e.g., with a different color or icon).




### Pedro Cioga - November 2024
