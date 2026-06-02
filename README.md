# Athena

Athena is an Android application focused on academic tracking, personal organization, and study data analysis.

The project's goal is to help students centralize important aspects of their routine in a single platform, recording events such as study sessions, sleep, mood, location, and project progress.

The project is built around a simple principle:

> Students own their data.

All recorded information should remain accessible, exportable, and reusable by the user in spreadsheets, AI tools, data analysis platforms, or any other external system.

---

# Project Philosophy

Athena is built around a few core principles:

- Users own their data.
- Important data should never be lost during updates.
- Everything should work offline.
- The application should not depend on external servers.
- The structure must remain flexible enough to support years of usage.
- The system should be prepared for future extensions and plugins.
- The database is the most valuable asset of the project.

---

# Planned Features

## Study Tracking

- Unlimited hierarchical structure
- Folders and subfolders
- Projects
- Study sessions
- Built-in timer
- Manual study session registration
- Tasks and subtasks
- Project completion and restoration
- Statistics and visualizations

Example:

```text
Entrance Exam
├── Mathematics
│   ├── Mathematics I
│   ├── Mathematics II
│   └── Mathematics III
│
├── Physics
└── Chemistry
```

---

## Sleep Tracking

Simple workflow:

- Go to Sleep
- Wake Up
- Sleep Interrupted

The system automatically calculates:

- Sleep duration
- Weekly averages
- Monthly averages

---

## Mood Tracking

Quick emotional state logging.

Examples:

- Excellent
- Good
- Neutral
- Bad
- Very Bad

With support for multiple tags:

- Motivated
- Tired
- Anxious
- Stressed
- Sleepy

And optional notes.

---

## Location Tracking

Automatic geofence-based monitoring.

Examples:

- Home
- Preparatory School
- Library

Recorded events:

```text
07:02 Left Home

07:51 Arrived at Preparatory School

12:31 Left Preparatory School

13:10 Arrived Home
```

---

## Agenda

Deadline and planning management.

Supports:

- Specific due dates
- Someday / No deadline

Views:

- Today
- This Week
- Upcoming
- Overdue

---

## Data Export

Users will be able to export data as:

- Excel (.xlsx)
- CSV
- Full SQLite database backup

---

# Architecture

## Technology Stack

- Flutter
- Riverpod
- GoRouter
- Drift
- SQLite
- Geolocator
- fl_chart

---

## Project Structure

```text
lib/

├── core/
│
├── data/
│   ├── database/
│   ├── repositories/
│   └── models/
│
├── features/
│   ├── study/
│   ├── sleep/
│   ├── mood/
│   ├── location/
│   ├── statistics/
│   ├── export/
│   └── agenda/
│
├── routes/
│
├── shared/
│
├── widgets/
│
└── main.dart
```

---

# Core Model

The foundation of Athena is a hierarchical tree structure.

All study-related entities are represented as a `Node`.

Examples:

- Folder
- Subject
- Course
- Semester
- Project

All of them are stored using the same structure.

This allows:

- Unlimited depth
- Easy reorganization
- Statistics at any hierarchy level

---

# Item States

No item is physically deleted.

Available states:

```text
active
completed
archived
```

Completed items disappear from the main workspace but remain accessible and can be restored at any time.

---

# Database

The project uses:

- SQLite
- Drift

The database will be versioned through migrations.

Goals:

- Continuous evolution
- Backward compatibility
- Data preservation

---

# Getting Started

## Flutter

Verify your installation:

```bash
flutter doctor
```

Install dependencies:

```bash
flutter pub get
```

Run the project:

```bash
flutter run
```

---

## GitHub Codespaces

Athena is designed to work well with GitHub Codespaces.

For web development:

```bash
flutter run -d web-server --web-hostname 0.0.0.0 --web-port 8080
```

After launching, open the forwarded Codespaces port.

---

# Initial Structure

- `lib/main.dart`
- `lib/app.dart`
- `lib/core/app_theme.dart`
- `lib/routes/app_router.dart`
- `lib/features/study/study_screen.dart`
- `lib/data/models/node.dart`
- `lib/data/repositories/node_repository.dart`
- `lib/data/database/app_database.dart`

This initial foundation already includes:

- Riverpod `ProviderScope` configuration
- Initial navigation using GoRouter
- `Node` model for the study hierarchy
- In-memory repository for flow validation
- Initial Drift database structure
- Modular architecture prepared for long-term growth

---

# Roadmap

## Phase 1

- Flutter infrastructure
- Riverpod
- Drift
- Database migrations

## Phase 2

- Hierarchical study structure
- Node CRUD
- Completion and restoration

## Phase 3

- Study timer
- Study sessions

## Phase 4

- Sleep tracking

## Phase 5

- Mood tracking

## Phase 6

- Location tracking

## Phase 7

- Agenda

## Phase 8

- Statistics and analytics

## Phase 9

- Data export

---

# Long-Term Vision

Athena is not intended to be just another study timer.

The long-term goal is to become a personal academic observation and analytics platform built around local-first, portable, user-controlled data.

The system should remain extensible, modular, and capable of supporting future community-driven extensions while preserving the integrity and ownership of user data.