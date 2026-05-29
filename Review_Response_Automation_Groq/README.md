# Review Response Automation (Groq)

Automatically drafts AI-written replies to customer reviews and routes them to Slack for human approval before publishing.

## Trigger

**Webhook** — fires when a new review is received (from a review platform, CRM, or scraper).

## What It Does

1. **Receives the review** via webhook (reviewer name, rating, review text, platform, etc.)
2. **Parses the review data** and extracts key fields
3. **Generates a response** using Groq AI — tailored to the tone and content of the review
4. **Parses and formats** the AI-generated response
5. **Logs the review and draft response** to a Google Sheet
6. **Posts to Slack for approval** — team can review the draft before it goes live
7. **Returns a webhook response** to the originating system

## Integrations

| Service | Purpose |
|---|---|
| Webhook | Receives incoming reviews |
| Groq (LLM) | Drafts contextual, personalised responses |
| Google Sheets | Logs all reviews and draft replies |
| Slack | Human approval step before publishing |

## How to Use

Send a POST request to the webhook with the review details. A draft response will appear in your Slack channel — approve, edit, or discard before posting publicly.
