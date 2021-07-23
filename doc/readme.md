# bewell_pro_core

`# bewell_pro_core` is a home for `BeWell Professional Community Edition`'s base package. It's one among many other open source libraries that make up the wider ecosystem of software made and open sourced by `Savannah Informatics Limited`.

## How to setup and run unit, widget and integration tests locally

### Unit Tests

To run unit and widget tests, you will require to install `lcov` by running `sudo apt-get install lcov` in the terminal. Finally, run the following commands in the terminal:

1. From the root folder, run `flutter test --coverage test/`

2. Run `genhtml -o coverage coverage/lcov.info`

3. To view the coverage, open the html file generated at `coverage/index.html` with your preferred browser.

## Pull request commit messages convention

Our convention for a good commit message consists of a **header**, a **body** and a **footer**.

### Message header

The message header is a single line that contains short and clear description of the change.

The following are **message header** examples that describe the kind of change that a commit is providing.

- **feat** (feature)
- **fix** (bug fix)
- **docs** (documentation)
- **style** (formatting, missing semi colons, …)
- **refactor**
- **test** (when adding missing tests)
- **chore** (maintain)

#### Header subject

This is a very short description of the change.

- use imperative, present tense: “change” not “changed” nor “changes”
- don't capitalize first letter
- no dot (.) at the end

#### Example of a good commit header

```dart
docs: healthcloud commit message convention
```

### Message body

Separated with the **Message Header** by a line break, the message body contains paragraphs of changes. Follow below conventions.

- use imperative, present tense: “change” not “changed” nor “changes”
- includes motivation for the change and contrasts with previous behavior
- don't capitalize first letter
- no dot (.) at the end

### Message footer

The footer should contain any information about Breaking Changes which should start with the word BREAKING CHANGE: with a space or two newlines. The rest of the commit message is then the description of the change, justification and migration notes. It is also the place to reference GitLab issues that this commit Closes.

#### Example of a good commit footer

```dart
BREAKING CHANGE: isolate scope bindings definition has changed and
    the inject option for the directive controller injection was removed.

Closes #392
```

#### Example of a good commit message

```dart
docs: add healthcloud convention to readme

Couple of typos fixed:
- indentation
- syntax highlighting
- start periodic checking
- missing brace

Closes #03
```

### NOTE

1. The **commit message header** can be used in solitary with a clear subject on issues with elementary changes.
2. To close an issue automatically include the footer with a reference to the GitLab issue as demonstrated above.

## Packages import

Packages imported in every dart file follow this order;

```dart
1 . Dart imports
2 . Flutter imports
3 . Third-party packages
4 . Our own packages
5 . Relative files
```

All the imports MUST be separated by a blank line. See example below. A good example, using the `lib/features/login/pages/login_page.dart` file

```dart
// flutter package imports
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

// third party imports
import 'package:redux/redux.dart';

// Be.Well Pro imports
import 'package:bewell_pro_core/presentation/login/redux/models/login_viewmodel.dart';
import 'package:bewell_pro_core/presentation/login/widgets/login_page_content.dart';
import 'package:bewell_pro_core/redux/models/core_state.dart';
```
