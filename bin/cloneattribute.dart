import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:dart_appwrite/models.dart';

void main(List<String> arguments) async {
  Client client = Client()
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('66491cd097') // Your project ID
      .setKey('XXX'); // Your Api key

  Databases databases = Databases(client);
  String databaseId = '6640dcf00018f6322ff1';
  String collectionId = '664b77910039dba8d036';

  String sourceAttribute = "message";
  String targetAttribute = "message2";

  DocumentList documents = await databases.listDocuments(
    databaseId: databaseId,
    collectionId: collectionId,
    queries: [
      Query.limit(2000),
    ],
  );

  try {
    AttributeString result = await databases.createStringAttribute(
      databaseId: databaseId,
      collectionId: collectionId,
      key: targetAttribute,
      size: 1002,
      xrequired: false,
      xdefault: '',
      array: false,
      encrypt: false,
    );
  } on AppwriteException catch (e) {
    print(e.message);
  }

  for (Document document in documents.documents) {
    print("${document.data[sourceAttribute]} transferred.");

    Document result = await databases.updateDocument(
      databaseId: databaseId,
      collectionId: collectionId,
      documentId: document.$id,
      data: {targetAttribute: document.data[sourceAttribute]},
    );
  }
}
