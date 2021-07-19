# GraphQL

- This folder contains all our GraphQl queries and mutations, along with the respective query/mutation variables.
- The queries file should **ONLY** contain GraphQL queries and their respective variables
- The mutations file should **ONLY** contain GraphQL mutations and their respective variables

## Naming conventions

- All queries and mutations should end with a valid suffix i.e `*Query` and `*Variables`
- Examples of valid query and mutation variable names include:

```dart
const String postMessageMutation = r''''''; // The mutation variable name

Map<String, dynamic> postMessageMutationVariables(  // the corresponding mutation variables
  String replyTo,
  String itemID,
  int sequenceNumber,
  String replyMessage,
  String postedByName,
  String postedByUID,
  String replyTimeStamp,
) {...}
```

## File contents organization

- For easier scoping, all queries and variables should be organized with the query coming first and the variables following. For example:

```dart
const String getFAQQuery = '''
const String registerDeviceToken = r'''
mutation RegisterPushToken($token: String!) {
  registerPushToken(token: $token)
}
''';

Map<String, dynamic> registerDeviceTokenVariables(String deviceToken) {
  return <String, String>{'token': deviceToken};
}
```

## File structure

The structure looks like this:

```md
.
├── mutations.dart
├── queries.dart
└── readme.md

```
