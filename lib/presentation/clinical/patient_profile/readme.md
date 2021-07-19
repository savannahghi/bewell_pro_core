# Patient profile

## Technical terms

### Primary patient banner

> The primary patient banner contains the basic information about a patient that the doctor needs in order to give care to a patient.

The information here is intentionally summarized to that the doctor can take a quick glance and focus on what is important: paying attention to the patient

### Secondary patient banner

> The secondary patient banner contains more detailed information about the patient besides their basic information.

The information contained there includes the following:

```md
1. The patient's ongoing `conditions`
2. Any allergies that the patient may have
3. Any current medications that the patient is taking
```

### Patient timeline

The patient timeline contains a historical representation of the patient's past 5 visits organized chronologically.

Initially the medical practitioner is given access to the patient's last 5 visits. If they want to see an extended version they have to manually `Request access to all past visits`.

### Folder structure

```tree
.
├── bewell_patient_profile_page.dart
├── readme.md
└── widgets
    ├── bewell_custom_timeline_painter.dart
    ├── bewell_patient_timeline.dart
    ├── bewell_primary_patient_banner.dart
    ├── bewell_secondary_patient_banner.dart
    ├── end_visit_dialogue_content.dart
    ├── load_more_timeline_records.dart
    ├── patient_banner_bio_info.dart
    ├── patient_known_problems_and_allergies.dart
    ├── patient_timeline_divider_widget.dart
    ├── patient_timeline_record.dart
    ├── retire_helper.dart
    ├── secondary_banner_allergies.dart
    ├── secondary_banner_conditions.dart
    ├── secondary_banner_medication.dart
    ├── secondary_banner_zero_experience.dart
    ├── start_continue_exam_banner.dart
    ├── start_or_continue_exam_wrapper.dart
    └── timeline_widget.dart
```

To generate a folder structure, navigate to this directory and run `tree`
