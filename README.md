# Clone Attribute in Collection

The main purpose of this script is for attribute properties that cannot be changed in Appwrite. 

Bu script'in asıl amacı Appwrite'ta değiştirilemeyen attribute özellikleri içindir. 

## Steps
### Step 1
Set project variables
```dart
Client client = Client()
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('66491cd097') // Your project ID
      .setKey('XXX'); // Your Api key

Databases databases = Databases(client);
String databaseId = '6640dcf00018f6322ff1';
String collectionId = '664b77910039dba8d036'
```

### Step 2
Set source and target
```dart
String sourceAttribute = "message";
String targetAttribute = "message2";
```

### Step 3
```bash
dart pub get
```

### Step 4
```bash
dart run
```


