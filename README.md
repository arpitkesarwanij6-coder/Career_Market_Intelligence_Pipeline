# Career Market Intelligence — AI Job Intake Pipeline V0.1

This is the first working architecture for your V4 workbook.

WORKFLOW
1. Paste a job URL.
2. The server fetches the page.
3. AI extracts and normalizes the job into your V4 schema.
4. Important fields carry evidence/source.
5. Existing master workbook is checked for duplicates.
6. A review page is shown.
7. NOTHING is written to the master until you press "CONFIRM & ADD TO MASTER".
8. A timestamped backup is created before every write.

IMPORTANT
- The included Excel file is your V4 master working copy.
- Keep a separate backup of your original file.
- The app never treats an undisclosed salary as a guessed salary.
- "Unknown" is a valid value.
- External compensation benchmarks should eventually be stored separately from official job-posting facts.

SETUP (Windows)
1. Install Python 3.11+ from python.org.
2. Generate and paste Google api key (Free will work)
3. Paste it in the .env file(No additions punctuation or Bracket needed.)
4. Activate by clicking start.bat file in the folder.
5. Open http://127.0.0.1:8000 (In any browser)
6. you will see the Career_Market_Intelligence page got live.
7. paste any job posting link there then click analyse job.
8. you will see the json finding in the html page then click confirm & add to master.
9. It will be added in the xml/xlsx file in the folder.

PILOT
The five test URLs are in test_urls.txt.

NEXT DEVELOPMENT STEPS
- Add multi-URL batch intake.
- Add source-specific extraction for Amazon/Wellfound/Greenhouse/Lever/Ashby.
- Add a separate web-research/evidence stage.
- Add editable review fields.
- Add stronger duplicate matching.
- Add calculated-field protection and Excel formula validation.
- Add Chrome extension that sends the current tab URL to this local app.
- Add audit log for every approved/rejected record.

DYNAMIC SKILL DISCOVERY (added)
- Every analyzed posting is checked for named technologies not already in the
  fixed 32-skill list (e.g. TypeScript, Kotlin, DynamoDB). These show up in
  the review page under "Others detected", with [+ Add] / [Ignore] buttons.
- Clicking Add or Ignore only updates skill_dictionary.json (a small file
  alongside app.py) — it never changes the workbook's structure by itself.
- skill_dictionary.json tracks: known (already real columns), pending
  (surfaced but no decision yet), ignored (explicitly dismissed), and
  confirmed_for_next_batch (Added, waiting to become real columns).
- When you're ready to actually add tracked columns for everything you've
  confirmed, run:
      python promote_skills.py --dry-run   (preview, changes nothing)
      python promote_skills.py             (backs up, then appends columns)
  New columns are always appended strictly after the last existing column —
  nothing already built (formulas, dashboards, the Skill x Role Heatmap)
  ever shifts position. Restart uvicorn afterward so the AI extraction
  schema picks up the newly-known skills.
- Rows you approved before a skill was promoted will show blank/Unknown for
  that new column — promotion doesn't retroactively re-analyze old postings.

#Additional guidance
Clone full repo and put it in downloads(if not there) then generate a google api key from google ai studio https://aistudio.google.com/api-keys
then paste it in .env (don't change any thing their , just paste raw api key ).
Now click the start bat it will show security warming dialogbox, then click run any then open the 
