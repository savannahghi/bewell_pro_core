# CHANGELOG

## 1.0.4-nullsafety

- fix: modify home page to accept feed content callbacks

## 1.0.3-nullsafety

- chore: update dependencies

## 1.0.2

- refactor: change `CoreState`

## 1.0.1

- refactor: change `AppState` with `CoreState`

## 1.0.0

- feat: initial implementation of `bewell_pro_core`

## ^0.9.0

Features:

chore: app linting
chore: setup ios Continuous Deployment pipeline
refactor: add variables below all queries
refactor: move recording doctor into a shared and testable function
refactor: cleaned up the patient exam diagnosis file
refactor: place all app constants in one folder
feat: upgrade outdated flutter packages
refactor: Refactored the clinical forms files
feat: implement proper versioning
refactor: refactor all user feedback strings to use constants from shared utils
feat : merge googleaction with apple login action
feat : retire email/pwd login
chore:typos on database_mobile_documentation
chore: remove commented code from add_nhif.dart
chore: delete lifecycle_manager.dart
refactor: refactor add test modal
refactor: completely removed the patient exam styles file
feat: improve post visit survey
feat: prevent users from registering themselves as next of kin
refactor: Allow decimals while adding temperature

Bugfixes:

fix: increase CI test running time to 20 minutes
fix: fix getWidth function
fix: renaming of variable dummyPhotodata to defaultPhotoData
fix: made the diagnosis tab look expandable
fix: keyboard not popping up upon dismiss
fix: adding missing drug routes
fix : defensive programming
fix: place all theme data in one file
fix: Handled nulls and deserialization errors
fix: adding of diagnosis via quick access
fix: zero state for tests
fix: fix retire problems and allergies in small screen
fix: start visit
fix: trim email input
fix: respiratory drawer handling double values
fix: update test environment endpoints

Features:

feat: update the post-survey page ui

Bugfixes:

fix: switch from sendOtpQuery to generateAndEmailOtpQuery api
fix: prevent keyboard from obstructing email textField
fix: update validation rules in patient history
fix: responsiveness of drawers in the event of problems, allergies and conditions with long names
fix: add a timer to control resending of emails when verifying
fix: fix patient registration
fix: fix null patient name when retiring tests
fix: add image source selector when taking photos
fix: fix email regexp in extra information
