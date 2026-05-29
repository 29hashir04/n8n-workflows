# Lead Follow-Up Email Automation

Runs a 3-email AI-written follow-up sequence over 5 days whenever a new lead comes in, with zero manual effort required.

## Trigger

**Webhook** — fires when a new lead is captured (from a form, CRM, or landing page).

## What It Does

1. **Receives lead data** via webhook (name, email, context, etc.)
2. **Saves the lead** to a Google Sheet for tracking
3. **Sends Email 1 immediately** — Groq AI writes a personalised intro email and sends it via Gmail
4. **Waits 2 days**
5. **Sends Email 2 on Day 2** — Groq AI writes a follow-up with a different angle
6. **Waits 3 more days**
7. **Sends Email 3 on Day 5** — Groq AI writes a final nudge email
8. **Marks the sequence complete** in the Google Sheet
9. **Notifies Slack** that the full sequence has been sent
10. **Returns a webhook response** to the originating system

## Email Schedule

| Email | Timing | Purpose |
|---|---|---|
| Email 1 | Immediately | Introduction / first touch |
| Email 2 | Day 2 | Follow-up / value add |
| Email 3 | Day 5 | Final nudge / CTA |

## Integrations

| Service | Purpose |
|---|---|
| Webhook | Entry point for new leads |
| Google Sheets | Lead tracking and sequence status |
| Groq (LLM) | Writes personalised emails for each lead |
| Gmail | Sends the emails |
| Slack | Notifies when sequence completes |

## How to Use

Send a POST request to the webhook with lead details (name, email, any context you want the AI to personalise with). The rest is fully automated.
