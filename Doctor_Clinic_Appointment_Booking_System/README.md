# Doctor Clinic Appointment Booking System

End-to-end appointment management for a clinic — handles booking confirmations, calendar entries, and next-day reminders automatically.

## Triggers

- **Webhook** — fires when a new appointment is submitted
- **Schedule (8AM daily)** — checks for appointments happening tomorrow and sends reminders

## What It Does

### On New Booking (Webhook)
1. **Receives booking data** from a form or external system via webhook
2. **Parses the booking** (patient name, date, time, doctor, etc.)
3. **Saves the appointment** to a Google Sheet
4. **Creates a calendar event** in Google Calendar
5. **Generates a confirmation email** using Groq AI (personalised to the patient)
6. **Sends the confirmation** to the patient via Gmail
7. **Notifies the doctor** with a separate Gmail
8. **Returns a webhook response** to the booking source

### Daily Reminder (8AM Schedule)
1. **Fetches confirmed appointments** from the Google Sheet
2. **Filters for tomorrow's appointments**
3. **Sends a reminder email** to each patient
4. **Notifies the clinic** on Slack

## Integrations

| Service | Purpose |
|---|---|
| Webhook | Receives new booking requests |
| Google Sheets | Stores all appointment records |
| Google Calendar | Creates calendar events for each appointment |
| Groq (LLM) | Generates personalised confirmation emails |
| Gmail | Sends emails to patients and doctors |
| Slack | Clinic-wide notifications for reminders |

## How to Use

Point your booking form or frontend to the webhook URL. Everything else runs automatically — confirmation, calendar entry, and reminders.
