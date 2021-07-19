## Object serialization

Healthcloud is no small application. It therefore demands of an efficient way to serialize its objects so that they
may work for both mobile and evironments.

### How serialization is used on Healthcloud

Healthcloud redux `state` object is stored locally for predicatable persistence unlike storing it in the device RAM.
This effort of predicatable persistence was brought by the need to have the user "logged in", even when the application
is removed from stack. In layman, equivalent to closing the app entirely.

Our root state [`AppState`](https://github.com/savannahinformatics/healthcloud/blob/develop/lib/redux/app/app_state.dart#L11)
is itself a composition of other state objects. We therefore need a way, to desmantle this object-of-objects, into
simple types that can be stored in `SQLITE` (mobile), `Localstorage` (Web)

We use [buit_value library](https://pub.dev/packages/built_value) for this effort. Take your time to go through it's
documentation.

The things to note and been keen about are as follows;

- State objects must to serialized
- Serialization is made easy by `built_value`

### Steps

1. Create an Abstract object that implements `Built`

2. Add your object serializer getter

3. Optionaly, include helpers with the signature `toJson` and `fromJson`

4. Add you new created object to the serializers (Example 5)

5. Run

```sh
  flutter pub run build_runner build --delete-conflicting-outputs
```

to generate bindings for your object

6. If you later on change anything on your object, do step 5

### Examples

- [AppState](https://github.com/savannahinformatics/healthcloud/blob/develop/lib/redux/app/app_state.dart#L11)
- [UserState](https://github.com/savannahinformatics/healthcloud/blob/develop/lib/redux/authentication/models/user_state.dart#L9)
- [UserProfile](https://github.com/savannahinformatics/healthcloud/blob/develop/lib/shared/constants/types/user_profile.dart#L11)
- [WorkstationObj](https://github.com/savannahinformatics/healthcloud/blob/develop/lib/shared/constants/types/workstation_obj.dart#L12)
- [Serializers](https://github.com/savannahinformatics/healthcloud/blob/develop/lib/redux/serializers/serializers.dart#L14)
