# Support Ticket Triage

Watches your support inbox, uses Groq AI to classify and prioritise incoming tickets, logs them, and alerts the right people — instantly escalating anything critical.

## Trigger

**Gmail** — monitors the support inbox for new emails in real time.

## What It Does

1. **Watches the support inbox** for new incoming emails via Gmail trigger
2. **Extracts key data** from the email (sender, subject, body, timestamp)
3. **Sends to Groq AI** for triage — AI classifies priority (critical / high / normal / low) and summarises the issue
4. **Parses the triage result** and structures it for logging
5. **Logs the ticket** to a Google Sheet (with AI-assigned priority and summary)
6. **Notifies the team on Slack** with ticket details and priority level
7. **If critical** — sends an immediate email alert to flag it for urgent attention

## Priority Escalation

| Priority | Action |
|---|---|
| Normal / Low / High | Logged to sheet + Slack notification |
| Critical | Logged + Slack + immediate email alert |

## Integrations

| Service | Purpose |
|---|---|
| Gmail (trigger) | Watches the support inbox for new emails |
| Groq (LLM) | Classifies priority and summarises the issue |
| Google Sheets | Logs all tickets with AI triage data |
| Slack | Team notification for every new ticket |
| Gmail (send) | Email alert for critical tickets |

## How to Use

Activate the workflow in n8n. Any email that arrives in the connected Gmail inbox is automatically triaged — no manual review needed unless the AI flags it as critical.
