# Feature Brick

A Mason brick for creating a new feature in Flutter following clean architecture and feature by package structure.

## Usage

```bash
mason make feature_brick --feature_name=payment
```

This will create:
```
lib/
  features/
    payment/
      constants/
        payment_constants.dart
      data/
        datasources/
          payment_remote_datasource.dart
        models/
          payment_model.dart
        repositories/
          payment_repository_impl.dart
      domain/
        repositories/
          payment_repository.dart
        usecases/
          example_payment_usecase.dart
      presentation/
        blocs/
          payment/
            payment_bloc.dart
            payment_event.dart
            payment_state.dart
        pages/
          payment_page.dart
        widgets/
```

## After Creation

1. Run `flutter pub run build_runner build --delete-conflicting-outputs` to generate freezed files
2. Update dependency injection in `lib/core/di/injection_container.dart`
3. Add routing in `lib/core/router/app_router.dart`
4. Implement your business logic
5. Remove TODO comments and example code

## Variables

| Variable | Description | Default | Type |
|----------|-------------|---------|------|
| `feature_name` | The name of your feature | N/A | `string` |

## Setup

1. Install Mason CLI:
```bash
dart pub global activate mason_cli
```

2. Add this brick:
```bash
mason add feature_brick --path bricks/feature_brick
```

3. Generate a new feature:
```bash
mason make feature_brick
``` 