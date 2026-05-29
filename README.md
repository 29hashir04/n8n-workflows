# n8n Workflows

AI-powered automation workflows built with n8n and Groq. Each folder contains a `workflow.json` (importable into n8n) and a `README.md` explaining what the automation does.

## Workflows

| Workflow | Trigger | Description |
|---|---|---|
| [Content Repurposing Pipeline](./Content_Repurposing_Pipeline_Groq/) | Schedule (Mon 9AM) | Repurposes blog posts into new formats using Groq AI and notifies Slack |
| [Doctor Clinic Appointment Booking](./Doctor_Clinic_Appointment_Booking_System/) | Webhook + Schedule | Full appointment flow — booking confirmation, calendar entry, and daily reminders |
| [Lead Follow-Up Email Automation](./Lead_Follow-Up_Email_Automation/) | Webhook | 3-email AI-written follow-up sequence sent over 5 days to new leads |
| [Review Response Automation](./Review_Response_Automation_Groq/) | Webhook | Drafts AI responses to customer reviews and routes to Slack for approval |
| [Support Ticket Triage](./Support_Ticket_Triage/) | Gmail | Classifies and prioritises support emails with AI, escalates critical tickets instantly |

## Stack

- **n8n** — workflow automation engine
- **Groq** — LLM provider for all AI steps
- **Google Sheets** — data storage and tracking
- **Gmail** — sending and receiving emails
- **Google Calendar** — event management
- **Slack** — team notifications and approvals

## Importing a Workflow

1. Open n8n
2. Go to **Workflows → Import**
3. Upload the `workflow.json` from any folder
4. Add your credentials and activate
