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
      data/
        datasources/
        models/
        repositories/
          payment_repository_impl.dart
      domain/
        entities/
        repositories/
          payment_repository.dart
        usecases/
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