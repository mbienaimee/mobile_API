## README

# ALL COUNTRIES EXPLORATION

A Flutter application that allows users to search for countries and view detailed information about them using a RESTful API.

## Table of Contents

- Features
- API Reference
- Installation
- Usage




## Features

- Search for country by name.
- View detailed information about each country, including:
  - name
  - region
  - subregion
  - capital
  - population
  - Flagurl
  - languages
  - currencies


-The design is responsive in all kind of screens.
-Correct data that was restrieved from RESTful Api.



## Installation

To run this app locally, follow these steps:

1. **Clone  repository:**
   ```bash
   git clone https://github.com/mbienaimee/mobile_API.git
   ```

2. **Navigate to the project directory:**
   ```bash
   cd countries_search
   ```

3. **Install dependencies:**
   Make sure you have Flutter installed on your machine. Then run:
   ```bash
   flutter pub get
   ```

4. **Run the app:**
   Connect your device or start an emulator, then execute:
   ```bash
   cd countrie_search
   flutter run
   ```

## Usage

1. Run app on your device.
2. see the list of all countries that is on your first screen.
3. When you do not want to keep searching you can search on app bar
4. click n search Icon and type the name of country you want to see
5. Get all detals on specified country
6. click on back Icon when you want to come on the first page that list all countries


## API Reference

This app uses the following RESTful API:

- **Base URL:** `https://restcountries.com/v3.1/`
  
### Endpoints

1. **Get all countries:**
   - **Endpoint:** `/all`
   - **Method:** GET
   - **Description:** Get the list of all countries.

2. **Get country by name:**
   - **Endpoint:** `/name/{country}`
   - **Method:** GET
   - **Description:** Retrieves details of a specific country by its name.

### Example Request

To get details about a specific country (e.g.Rwanda):

```http
GET https://restcountries.com/v3.1/name/south%20africa
```

### Example Response

```json
[
    {
        "name": {
            "common": "South Africa",
            "official": "Republic of South Africa"
        },
        "capital": "Pretoria",
        "population": 59308690,
        "area": 1219090,
        "languages": {
            "eng": "English",
            "afr": "Afrikaans"
        },
        "currencies": {
            "ZAR": {
                "name": "South African rand",
                "symbol": "R"
            }
        },
        "flags": {
            "png": "https://flagcdn.com/w320/za.png"
        }
    }
]
```

