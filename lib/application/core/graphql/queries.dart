import 'package:bewell_pro_core/application/core/services/helpers.dart';
import 'package:bewell_pro_core/domain/clinical/entities/patient_connection.dart';
import 'package:user_feed/user_feed.dart';

const String resumeWithPinQuery = r'''
query ResumeWithPIN($pin: String!) {
  resumeWithPIN(pin: $pin)
}
 ''';

const String getFAQQuery = r'''
query GetFaq ($flavour: Flavour!){
    getFaqsContent (flavour: $flavour){
        id
        createdAt
        excerpt
        featureImage
        html
        publishedAt
        slug
        title
        readingTime
        tags {
            id
            name
            slug
        }
    }
}
''';

Map<String, dynamic> getFAQQueryVariables() {
  return <String, dynamic>{'flavour': Flavour.PRO.name};
}

Map<String, dynamic> getFeedQueryVariables() {
  return <String, dynamic>{
    'flavour': Flavour.PRO.name,
    'persistent': 'BOTH',
    'isAnonymous': false,
  };
}

// Feed content query
const String getFeedContentQuery = r'''
query GetFeed(
  $flavour: Flavour!
  $persistent: BooleanFilter!
  $status: Status
  $visibility: Visibility
  $expired: BooleanFilter
  $filterParams: FilterParamsInput
  $isAnonymous: Boolean!
) {
  getFeed(
    flavour: $flavour
    persistent: $persistent
    status: $status
    visibility: $visibility
    expired: $expired
    filterParams: $filterParams
    isAnonymous: $isAnonymous
  ) {
    uid
    flavour
    isAnonymous
    actions {
      id
      sequenceNumber
      name
      actionType
      handling
      allowAnonymous
    }
    nudges {
      id
      sequenceNumber
      visibility
      status
      title
      text
      actions {
        id
        sequenceNumber
        name
        actionType
        handling
        allowAnonymous
      }
      groups
      users
      links {
        id
        url
        linkType
      }
      notificationChannels
    }
    items {
      id
      sequenceNumber
      expiry
      persistent
      status
      visibility
      label
      icon {
        id
        url
        linkType
      }
      author
      tagline
      label
      timestamp
      summary
      text
      links {
        id
        url
        linkType
        thumbnail
        title
      }
      actions {
        id
        sequenceNumber
        name
        actionType
        handling
        allowAnonymous
      }
      conversations {
        id
        sequenceNumber
        text
        replyTo
        postedByUID
        postedByName
        timestamp
      }
    }
  }
}
''';

/// --------------------------------------------------------------------
/// CLINICAL QUERIES
/// --------------------------------------------------------------------

const String listConceptsQuery = r'''
query ListConcepts(
  	$org: String!, $source: String!, $verbose: Boolean!, 
    $q: String, $conceptClass: String, $includeRetired: Boolean,
    $includeMappings: Boolean, $includeInverseMappings: Boolean,
    $sortAsc: String, $locale: String
) {
  listConcepts(
    org: $org, 
    source:$source,
    verbose: $verbose,
    q: $q,
    conceptClass: $conceptClass,
    includeRetired: $includeRetired,
    includeMappings: $includeMappings,
    includeInverseMappings: $includeInverseMappings,
    sortAsc: $sortAsc,
    locale: $locale
  )
}
''';

Map<String, dynamic> listConceptsQueryVariables(
    String searchParam, String conceptClass) {
  return <String, dynamic>{
    'org': 'CIEL',
    'source': 'CIEL',
    'q': searchParam,
    'conceptClass': conceptClass,
    'verbose': false,
    'includeRetired': false,
    'includeMappings': false,
    'includeInverseMappings': false,
    'sortAsc': 'bestMatch',
    'locale': 'en'
  };
}

const String findVitalsQuery = r'''
query SearchObservations($params: Map!) {
  searchFHIRObservation(params: $params) {
    edges {
      node {
        ID
      Status
      Code {
        Text
        Coding {
          Display
          Code
          System
          UserSelected
        }
      }
      ValueQuantity {
        Value
        Unit
        System
        Code
      }
      ReferenceRange {
        Text
        Low {
          Value
          Unit
          System
          Code
        }
        High {
          Value
          Unit
          System
          Code
        }
        Type {
          Text
          Coding {
            Code
            UserSelected
            System
            Display
          }
        }
      }
      Interpretation {
        Text
        Coding {
          Display
          Code
          System
          UserSelected
        }
      }
      Category {
        Text
        Coding {
          Code
          System
          Display
          UserSelected
        }
      }
      Issued
      EffectiveInstant
      Subject {
        Reference
        Type
        Display
      }
      Encounter {
        Reference
        Type
        Display
        }
      }
    }
	}
}
''';

const String searchFHIRServiceRequest = r'''
query SearchFHIRServiceRequests($params: Map!) {
  searchFHIRServiceRequest(params: $params) {
    edges {
      node {
        ID
        Status
        Intent
        Priority
        Subject {
          Reference
          Type
          Display
        }
        Encounter {
          Reference
          Type
          Display
        }
        SupportingInfo{
          ID
          Reference
          Display
        }
        Requester{
          Display
        }
        Code{
          Coding{
            Display
            Code
          }
        }
        Category {
          Text
          Coding {
            System
            Code
            Display
            UserSelected
          }
        }
      }
    }
  }
}
''';

Map<String, dynamic> searchFHIRServiceRequestVariables() {
  final PatientInfo patientInfo = getPatientInfo();
  return <String, dynamic>{
    'params': <String, dynamic>{
      'patient': patientInfo.patientReference,
      'encounter': patientInfo.encounterReference
    }
  };
}

const String fetchVisitSummaryQuery = r'''
query VisitSummary($encounterID: String!) { 
  visitSummary(encounterID: $encounterID)
}
''';

Map<String, dynamic> fetchVisitSummaryVariables() {
  final PatientInfo patientInfo = getPatientInfo();
  return <String, dynamic>{'encounterID': patientInfo.encounterId};
}

const String searchCompositionQuery = r'''
query SearchCompositions($params: Map!) {
  searchFHIRComposition(params: $params) {
    edges {
      node {
        ID
        Status
        Type {
          Text
          Coding {
            System
            Code
            Display
            UserSelected
          }
        }
        Category {
          Text
          Coding {
            System
            Code
            Display
            UserSelected
          }
        }
        Author {
          Reference
          Display
        }
        Title
        Section {
          Title
          Text {
            Status
            Div
          }
        }
      }
    }
  }
}
''';

/// [findPatients] used in patient identification
const String findPatientsQuery = r'''
query FindPatientByMSISDN($msisdn: String!) {
findPatientsByMSISDN(msisdn: $msisdn) {
  edges {
    hasOpenEpisodes
    node {
      ID
      Active
      Gender
      BirthDate
      Telecom{
        System
        Value
      }
      Name {
        Given
        Family
        Use
        Text
        Prefix
        Suffix
        Period  {
          Start
          End
        }
      }
      Photo{
        ID
        ContentType
        Language
        Data
        URL
        Size
        Hash
        Title
      }
    }
  }
}
}
  ''';

Map<String, dynamic> findPatientsQueryVariables(String phoneNumber) {
  return <String, dynamic>{
    'msisdn': phoneNumber,
  };
}

// get the patient's open episodes of care
const String getOpenEpisodesOfCare = r'''
query getOpenEpisodeOfCares($id: ID!) {
  getPatient(id: $id) {
    hasOpenEpisodes
    openEpisodes{
      ID
    }
  }
}
''';

const String searchRelatedPersonByMSISDN = r'''
query FindPatient($search: String!) {
  findPatients(search:$search){
    edges{     
      node{
        ID
        Active
        Name{
          Text
          Family
          Given
        }
        Telecom{
          Value
        }
        Gender
        BirthDate
      }
    }   
  }
}
''';

Map<String, dynamic> searchRelatedPersonVariables(
    Map<String, dynamic> payload) {
  return <String, dynamic>{'search': payload['param']};
}

const String findPatientExistingMedicationQuery = r'''
query SearchMedicationRequests($params: Map!) {
  searchFHIRMedicationRequest(params: $params) {
    edges {
      node {
        ID
        Status
        Intent
        Priority
        Subject {
          Reference
          Type
          Display
        }
        MedicationCodeableConcept{
          Text
          Coding{
            System
            Code
            Display
            UserSelected
          }
        }
        DosageInstruction{
          Text
          PatientInstruction
        }
        Requester{
          Display
        }
        Encounter {
          Reference
          Type
          Display
        }
        SupportingInformation {
          ID
          Reference
          Display
        }
        AuthoredOn
        Note{
          AuthorString
        }
      }
    }
  }
}
''';

Map<String, dynamic> findPatientExistingMedicationVariables() {
  final PatientInfo patientInfo = getPatientInfo();
  return <String, dynamic>{
    'params': <String, dynamic>{
      'patient': patientInfo.patientReference,
    }
  };
}

const String findPatientExistingAllergiesQuery = r'''
query FindPatientExistingAllergies($params: Map!) {
  searchFHIRAllergyIntolerance(params: $params) {
    edges {
      node {
        ID
        Type
        RecordedDate
        Category
        Criticality
        ClinicalStatus{
          Text
          Coding{
            System
            Code
            Display
            UserSelected
          }
        }
        VerificationStatus{
          Text
          Coding{
            System
            Code
            Display
            UserSelected
          }
        }
        Patient{
          Reference
          Type
          Display
        }
        Code {
          Text
          Coding {
            Code
            System
            Display
          }
        }
        Encounter{
          Reference
          Type
          Display
        }
        Asserter{
          Display
        }
        Note{
          AuthorString
          Text
        }
        Reaction{
          Description
          Severity
          Substance{
            Text
            Coding {
              System
              Code
              Display
              UserSelected
            }
          }
          Manifestation {
            Text
            Coding {
              Code
              Display
            }
          }
        }
        Recorder{
          Display
        }
      }
    }
  }
}
''';

Map<String, dynamic> findPatientExistingAllergiesVariables() {
  final PatientInfo patientInfo = getPatientInfo();

  return <String, dynamic>{
    'params': <String, dynamic>{
      'patient': patientInfo.patientReference,
      'encounter': patientInfo.encounterReference
    }
  };
}

const String findPatientsExistingConditionsQuery = r'''
query PatientsExistingCondition($params: Map!) {
  searchFHIRCondition(params: $params) {
    edges {
      node {
        ID
        RecordedDate
        ClinicalStatus{
          Text
          Coding{
            System
            Code
            Display
            UserSelected
          }
        }
        VerificationStatus{
          Text
          Coding{
            System
            Code
            Display
            UserSelected
          }
        }
        Category{
          Text
          Coding{
            System
            Code
            Display
            UserSelected
          }
        }
        Subject{
          Reference
          Type
          Display
        }
        Encounter{
          Reference
          Type
          Display
        }
        Evidence{
          Detail{
            Display
          }
        }
        Asserter{
          Display
        }
        Note{
          AuthorString
          Text
        }
        Severity{
          ID
          Coding{
            Display
          }
          Text
        }
        OnsetString
        Recorder{
          Display
        }
        Code{
          Coding{
            System
            Code
            Display
            UserSelected
          }
          Text
        }
      }
    }
  }
}
''';

Map<String, dynamic> findPatientsExistingConditionVariables() {
  final PatientInfo patientInfo = getPatientInfo();
  return <String, dynamic>{
    'params': <String, dynamic>{
      'patient': patientInfo.patientReference,
      'encounter': patientInfo.encounterReference
    }
  };
}

const String searchEncounterQuery = r'''
query SearchFHIREncounter($params: Map!) {
  searchFHIREncounter(params: $params) {
    edges {
      node {
        ID
      }
    }
  }
}
 ''';

const String countTimelineQuery = r'''
query PatientTimelineWithCount($episodeID: String!, $count: Int!){
  patientTimelineWithCount(episodeID: $episodeID, count: $count)
}
 ''';

Map<String, dynamic> countTimelineQueryVariables(String episodeID, int count) {
  return <String, dynamic>{'episodeID': episodeID, 'count': count};
}

const String problemAllergySummaryQuery = r'''
query ProblemAllergySummary($patientID: String!) {
	problemSummary(patientID: $patientID)
  allergySummary(patientID: $patientID)
}
''';

Map<String, dynamic> problemAllergySummaryQueryVariables() {
  final PatientInfo patientInfo = getPatientInfo();
  return <String, dynamic>{
    'patientID': patientInfo.patientId,
  };
}
