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
2. Open PowerShell in this folder.
3. Create a virtual environment:
   python -m venv .venv
4. Activate:
   .venv\Scripts\Activate.ps1
5. Install dependencies:
   pip install -r requirements.txt
6. Copy .env.example to .env and put your OpenAI API key in it.
7. Start:
   uvicorn app:app --reload
8. Open:
   http://127.0.0.1:8000

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

SECURITY
Never put an API key inside frontend JavaScript or inside the Excel file.
Keep .env local and never commit it to Git.
