# Content Repurposing Pipeline (Groq)

Automatically repurposes blog posts into new content formats using Groq AI, then saves the output and notifies the team on Slack.

## Trigger

Runs on a schedule every **Monday at 9AM**.

## What It Does

1. **Fetches blog posts** from a Google Sheet where the `Status` column is set to `Ready to Repurpose`
2. **Sends each post to Groq AI** via an LLM chain to generate repurposed content (e.g. social captions, summaries, threads)
3. **Parses the AI response** and formats it for storage
4. **Saves the repurposed content** back to a separate sheet
5. **Notifies Slack** so the team knows new content is ready for review

## Integrations

| Service | Purpose |
|---|---|
| Google Sheets | Source of blog posts + destination for repurposed output |
| Groq (LLM) | AI model that rewrites/repurposes the content |
| Slack | Team notification when content is ready |

## How to Use

1. Add a blog post row to the Google Sheet and set its `Status` to `Ready to Repurpose`
2. Wait for Monday 9AM (or trigger manually in n8n)
3. Check the repurposed content sheet and Slack for results
