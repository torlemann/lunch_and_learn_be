# Lunch and Learn
>
<a name="readme-top"></a>

<!-- [![Contributors][contributors-shield]][contributors-url]
[![Issues][issues-shield]][issues-url] -->


  <!-- <p align="center">
    <a href="https://github.com/IONO-where-to-eat/iono_fe"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/IONO-where-to-eat/iono_fe">View Demo</a>
    ·
    <a href="https://github.com/IONO-where-to-eat/iono_fe/issues">Report Bug</a>
    ·
    <a href="https://github.com/IONO-where-to-eat/iono_fe/issues">Request Feature</a>
  </p> -->

![ruby-image]

Lunch and Learn is a backend rails API, that allows a front-end app to find recipes from a country, as well as provide visual learning resources for that country. Registered users with a valid api key may favorite recipes. Created in a five day sprint.

Created with Rails 5.2.8

## Table of contents

- [Database setup](#database-setup)
- [Endpoints](#endpoints)
- [Query parameters](#query-params)

## <a name="database-setup"></a>Database Setup

Fork and clone the project, then install the required gems with `bundle`. 

```sh
bundle install
```

Setup the database: 

```sh
rails db:{drop,create,migrate}
```
You will need to create API keys to run this back-end server. You will need the following keys: 
- [Edamam](https://www.edamam.com/)
- [Youtube Data API](https://developers.google.com/youtube/v3)
- [Unsplash](https://unsplash.com/documentation#creating-a-developer-account)
- [Geoapify Places](https://apidocs.geoapify.com/playground/places/)

Once you have your keys, set up your environment with 
```sh
bundle exec figaro install
```
 Then add your keys to `config/application.yml`:
```ruby
edamam_app_id: <insert your id>
edamam_app_key: <insert your key>
youtube_key: <insert your key>
geoapify_key: <insert your key>
unsplash_client_id: <insert your key>

```
Start a rails server, and you're ready to query 
```sh
rails s
```
<p align="right">(<a href="#readme-top">back to top</a>)</p>

# <a name="endpoints"></a>Endpoints

## GET /api/v1/recipes
Gets recipes from a single country.

   | Parameter      | Description | Parameter type      | Data type |
   | ----------- | ----------- | ----------- | ----------- |
   | **country** | Optional - specify a country       | query   | String        |

   *If no country parameter is included, recipes for a random country will be returned* 

**Sample response (status 200)**
 ```json
 {
    "data": [
        {
            "id": null,
            "type": "recipe",
            "attributes": {
                "title": "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)",
                "url": "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
                "country": "thailand",
                "image": "https://edamam-product-images.s3.amazonaws.com/web-img/611/611..."
            }
        },
        {
            "id": null,
            "type": "recipe",
            "attributes": {
                "title": "THAI COCONUT CREMES",
                "url": "https://food52.com/recipes/37220-thai-coconut-cremes",
                "country": "thailand",
                "image": "https://edamam-product-images.s3.amazonaws.com/web-img/8cd/8c..."
            }
        },
        {
            "id": null,
            "type": "recipe",
            "attributes": {
                "title": "Sriracha",
                "url": "http://www.jamieoliver.com/recipes/vegetables-recipes/sriracha/",
                "country": "thailand",
                "image": "https://edamam-product-images.s3.amazonaws.com/web-img/cb5..."
            }
        }
    ]
 }
 ```
 <p align="right">(<a href="#readme-top">back to top</a>)</p>

---
 ## GET /api/v1/learning_resources
Gets learning resources from a single country.

   | Parameter      | Description | Parameter type      | Data type |
   | ----------- | ----------- | ----------- | ----------- |
   | **country** | Optional - specify a country       | query   | String        |


**Sample response (status 200)**
 ```json
{
    "data": {
        "id": null,
        "type": "learning_resource",
        "attributes": {
            "country": "laos",
            "video": {
                "title": "A Super Quick History of Laos",
                "youtube_video_id": "uw8hjVqxMXw"
            },
            "images": [
                {
                    "alt_tag": "time lapse photography of flying hot air balloon",
                    "url": "https://images.unsplash.com/photo-154..."
                },
                {
                    "alt_tag": "aerial view of city at daytime",
                    "url": "https://images.unsplash.com/photo-157..."
                }
            ]
        }
    }
 }
 ```
 <p align="right">(<a href="#readme-top">back to top</a>)</p>

---
 ## POST /api/v1/users
Register a new user. For this endpoint, all parameters are required.

   | Parameter      | Description | Parameter type      | Data type |
   | ----------- | ----------- | ----------- | ----------- |
   | **name** | User name       | body   | String        |
   | **email** | User email must be unique  | body   | String        |
   | **password** | Secure password required       | body   | String        |
   | **password_confirmation** | Must match password    | body   | String        |


**Sample response (status 201)**
 ```json
{
    "data": {
        "id": "3",
        "type": "user",
        "attributes": {
            "name": "Athena Dao",
            "email": "athenadao@bestgirlever.com",
            "api_key": "58ec6581e4ce87b5b154332c7bbd6b1c"
        }
    }
}
 ```
 <p align="right">(<a href="#readme-top">back to top</a>)</p>

---
 ## POST /api/v1/favorites
Register a new user. For this endpoint, all parameters are required.

   | Parameter      | Description | Parameter type      | Data type |
   | ----------- | ----------- | ----------- | ----------- |
   | **country** | Country of origin | body   | String        |
   | **recipe_link** | Link to recipe  | body   | String        |
   | **recipe_title** | Secure password required       | body   | String        |
   | **api_key** | Must match a user's API key    | body   | String        |


**Sample response (status 201)**
 ```json

{
    "success": "Favorite added successfully"
}

 ```
 <p align="right">(<a href="#readme-top">back to top</a>)</p>

---
 ## GET /api/v1/favorites
Get a user's favorites

   | Parameter      | Description | Parameter type      | Data type |
   | ----------- | ----------- | ----------- | ----------- |
   | **api_key** | Must match a user's API key    | query   | String        |

**Sample response (status 201)**
 ```json
{
    "data": [
        {
            "id": "1",
            "type": "favorite",
            "attributes": {
                "recipe_title": "recipe title",
                "recipe_link": "recipe url",
                "country": "Benin",
                "created_at": "2022-11-15T17:44:49.306Z"
            }
        },
        {
            "id": "2",
            "type": "favorite",
            "attributes": {
                "recipe_title": "another_url",
                "recipe_link": "some_url",
                "country": "France",
                "created_at": "2022-11-15T21:54:59.105Z"
            }
        }
    ]
}
 ```
 <p align="right">(<a href="#readme-top">back to top</a>)</p>




<!-- Markdown link & img dfn's -->
[ruby-image]: https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white