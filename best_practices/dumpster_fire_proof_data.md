h/t [Dillon Bergin](https://dillonbergin.com/)!

# Philosophy
This is a system to dumpster-fire proof your data work. That means if all else goes wrong, you’ve done your
absolute best to force every decision you make to be rigorous, evidence-based, and transparent. There are no
perfect data, just like there are no perfect sources. And like sources, as with data, you still want to know the
limits of their knowledge and be able to verify what they said.

The goals of the next few pages are:
* __Instill a healthy paranoia__ in you from the moment you start reporting. You should never stop checking,
making sure the numbers you’re spending so much time with are really telling you what you think
they’re telling you.
* __To make you catch small things__ so they don't become big things. You can catch mistakes, but you
shouldn’t publish mistakes. This whole thing is about having a system.
* __Bake bulletproofing into your work__ so this happens on the front end. This is important because:
    1. You don’t want to spend three months working on data for the whole project to fall apart when you realize you made an incorrect assumption.
    2. You absolutely don’t want to do this a week before publication. That last push should be a well-deserved exhale, when you know you’re close and only tying together a few loose ends. The days before publication should absolutely not be a scramble to fact-check everything your story is built upon.

_A final note_
Don’t ever say, “oh that’d be easy” – you’ll screw yourself over later. Nothing is ever easy. You have to be
honest about the time and investment, so you can deliver things on time. And if your editor asks what is taking
you so long, tell them “I’m making sure we don’t make a mistake.”

# Best practices

## Work Clean and Document Clean
* Make three folders: raw data, working data, clean data.
    * This way you can always go back to the source.
    * Be sure to keep working data clearly named and documented by month and by task performed on the data.
* Data Diary
    * Every question, change, or problem confronted when working with the data
    * Keep this up as you work, and be diligent about keeping notes of what you’re doing, even if they’re messy. Messy is fine because they will later go into the Data Log.
* Data Log
    * Written on every Monday, it is assessment of the data diary from last week with less chaos and more take-aways. This is would be the document to show if someone asked, “so what have you been working on?”
    * What did you do with specific data?
    * What are the files you have and where do they live?

## Find your expert(s)
* Reach out to a few different experts who are working on the topic, and see which ones show the most time and interest in your work. It’s important to have an expert for on background in general, but best case scenario is finding that someone who’s available and invested in helping you.
* Best case scenario: You have an open conversation with an expert to poke holes in your reasoning throughout the process.
* Bare minimum: Have an expert who will at least take the time once to go over your methodology and reasoning.

## Co-worker Double-Check
* Have a co-worker who can try to replicate your work in a different programming language and get the same answers.
* If that’s not possible, are there any ways that you could externally double-check your work? Are there any available datasets that would lead to similar conclusions? Are there ways you could replicate your work using a different method?

## Preliminary Findings with Editor
* Once you have the key findings that will drive your story, you want to sit down with your editor as soon as possible. This way you don’t dive into reporting or other work with a big hole in your premise, or even just a miscommunication with your editor about what the story is, waiting on the other side.
* Give them plenty of time to respond. Never assume they are aware of the alleged wrongdoing. It may require some checking.
* Present them the findings and your methodology, so they can point what they think you’ve done
wrong. You don’t have to share anything too detailed that would compromise the story before it’s published, but the rule is never surprise the people in your story. They should know the conclusions, and if possible, how and why you reached them.
* You can do this by saying “This is what the data alleges..” and let them review your data work. “So this is what we did. Do you have any problems with it? Do you challenge it?”

# Understanding your data

## The big three
1. In plain language, what is the question you are trying to understand?
2. What are the quantitative metrics that you will have to be able to know that you’ve answered that question?
3. Assuming we can answer number one effectively, what is the first thing we would do with the data?

## What are you using or making this database for?
* Which type of database is this?
    * A database for reporting (stays internal)
    * A database for analysis (parts make into a final story)
    * A database that is completely outward facing (squeakiest of clean)

## Definitions
* What are your “operational definitions?”
    * What exactly are we talking about when we talk about `x` that we want to measure.
        * i.e. What is an eviction? What parts of the process are there? What is the difference between an eviction in fact and an eviction filed?
    * What counts and what doesn’t ? What is our criteria?
    * What’s our timespan, why have we chosen that?

Balancing efficiency and precision means knowing what you need to be precise about and why. You may not
need 100% precision on every detail.

## Explore the data, interview the data, see what smells
* Check the data, with means, medians, and other summary stats. Are their any outliers?
* What is this group or subset of data? What is its universe?
* Sort columns different ways: Who gets the most? The least? What is the earliest date? Does it make sense?
* Use “group by” queries or pivot tables to check data integrity. Sort them ascending and descending.
* Outline assumptions you have about the data and any limitations you think there could be.
* Data or coding “smells.” What smells? What is sketchy? Where would you have a gut feeling to find a mistake?

## If the data was given to you by an agency
* Always save the email from the source, documenting that you got the data. This is especially helpful later on if PIOs (public information officer) change and the next PIO is hesitant to share the data you can say: "Your office has been sending me this data for years and here’s the receipts".
* Always ask for a record layout or a data dictionary when you request a dataset.
    * “I’m going to be looking at this data and I don’t want to get this wrong. I don’t want assume.”

## Then make a dossier on the data
* How do you know this data is up to date?
* How could this data been recorded differently across the time spans it represents?
* Was this data self-reported?
* Why was this data collected?
* What was its original purpose?
* How was it used?
* How was it updated?
* Do you have the same amount of records that the agency lists?

# Integrity checks

## General checks
* Smells check
* Column by column check
* Common sense check

## Specific checks
* How do I know that I’m not double-counting any of these fields?
* How could this data been recorded differently across the time spans it represents?
* Was this data self-reported?
* How did you verify your matches ? (if you’re joining tables by name, do you have a second index? e.g. names with birthdays)
* Did you type in any data (If so, did someone check this behind you?)
* If you got the data from someone else, make sure you know how many records you should have and that you do have them all.

## Consistency checks
* Data entry (misspellings, etc.)
* Lack of consistency
* Formatting
* Missing information
* Codes
* Leading/trailing spaces

## Outlier checks
* Are there any outliers (low or high) that may be the result of data entry problems or inconsistencies?
* Internal validity checks: missing data – smells of codes or records that are missing, whenever an agency uses “n/a”, is zero a zero or missing value.

## External checks
* Try to include a "compared to what" in your analysis
* What lurking or confounding variables could there be in your analysis?
* What would an exception to your analysis be?
* If possible, run statistical tests on the data. What may look significant to you may not be.

## Final checks
* Double check the visualizations and numbers, and then the actual numbers at the end.
* When story is perfect, around 3 days before publishing, play a game called “There are three errors in this story, let’s go find them.”

# Documentation and Accountability

## Consists of three parts
1. Your data diary and data log.
2. Git and GitHub for version control.
3. Jupyter or Posit/RStudio for data analysis and sharing that analysis, as well as you findings, with colleagues.


