## Étape 1 : Créez un compte Firebase

- Accédez au site web de Firebase à l'adresse [https://firebase.google.com/](https://firebase.google.com/)
- Cliquez sur le bouton "Commencer" ou "Se connecter" pour vous connecter à votre compte Google ou en créer un nouveau.
- Une fois connecté, vous serez redirigé vers la console Firebase.

&nbsp;
## Étape 2 : Créez un nouveau projet

- Dans la console Firebase, cliquez sur le bouton "Ajouter un projet" ou "Créer un projet".
- Donnez un nom à votre projet Firebase et sélectionnez le pays/la région approprié(e).
- Cliquez sur "Continuer" ou "Créer un projet" pour créer votre projet Firebase.

&nbsp;
## Étape 3 : Configurez Firebase dans votre application

1. Sélectionnez la plateforme de votre application (Android, iOS, Web, etc.).
2. Suivez les instructions spécifiques à la plateforme pour configurer votre application Firebase.
    1. Par exemple, pour une application Android, vous devrez télécharger le fichier de configuration google-services.json et l'ajouter à votre projet Android.
    2. Pour une application Web, vous devrez ajouter un script JavaScript spécifique à Firebase à votre code HTML.

&nbsp;
```
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Markdown(data: markdownData),
    ),
  ));
}