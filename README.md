# Shortly

Shorten URLs using service Store and fetch  shortened URLs in Flutter.

## Design Pattern

- I have used MVVM design pattern becuase it seprates UI from logic, seperate unit tests are easier and code is event driven.

## Dependcies

Below dependencies are used:
 - dio: networking
 - retrofit, get_it: for setup locator service.
 - progress_dialog: to show progress dialog
 - sqflite: For database management
 - path_provider, provider: for managing path and language
 - flutter_svg: to show SVG images

## Project Structure

 - Project is divided into respective folders as the folder name describes.
 - There is commons folder which have global app constans, colors, fonts, widgets, config file and common utility functions.
 - assets folder has all the images, fonts and env files(app URLs).
 - i18n manages texts used inside the app.
 - all UI related functionality is done in features folder. in current case there is one UI, so there is one folder named "shorten".
 
## Logic

 - App uses Retrofit to to implement api service with Dio client.
 - Service folder inside feature has API service to shorten URLs and database service to store, and fetch URLs. There is functionality implemented to delete and update URLs as well but not used in the UI.
  - View Model calls API service to shorten URL and store shorted URL.
  - In the views, widgets are created to gain reusability. Footer and marketing flow widgets are segregated from main UI. Similarly other widgets can be segregated, I avoided for the time being.

## Testing 

- I have included basic unit and UI tests as well.
