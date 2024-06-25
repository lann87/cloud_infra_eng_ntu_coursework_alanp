Assignment1.3 - individual.
To learn more about networking communication, let's try the HTTPS protocol and how it's used differently.

Install Postman: https://www.postman.com/. Explore MARVEL API https://developer.marvel.com/documentation/getting_started
Create an HTTPS call to at least 3 available API on MARVEL, and paste the results here:

First API call result - Thanos
```sh
{
    "code": 200,
    "status": "Ok",
    "copyright": "© 2024 MARVEL",
    "attributionText": "Data provided by Marvel. © 2024 MARVEL",
    "attributionHTML": "<a href=\"http://marvel.com\">Data provided by Marvel. © 2024 MARVEL</a>",
    "etag": "dacdb44bfbab59a79910bdd0045083394b08b326",
    "data": {
        "offset": 0,
        "limit": 20,
        "total": 1,
        "count": 1,
        "results": [
            {
                "id": 1009652,
                "name": "Thanos",
                "description": "The Mad Titan Thanos, a melancholy, brooding individual, consumed with the concept of death, sought out personal power and increased strength, endowing himself with cybernetic implants until he became more powerful than any of his brethren.",
                "modified": "2016-05-05T15:35:19-0400",
                "thumbnail": {
                    "path": "http://i.annihil.us/u/prod/marvel/i/mg/6/40/5274137e3e2cd",
                    "extension": "jpg"
                },
                "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009652",
                "comics": {
                    "available": 297,
                    "collectionURI": "http://gateway.marvel.com/v1/public/characters/1009652/comics",
                    "items": [
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/12651",
                            "name": "Alpha Flight (1983) #111"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/5078",
                            "name": "Annihilation (2006) #2"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/5529",
                            "name": "Annihilation (2006) #4"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/3985",
                            "name": "Annihilation: Prologue (2006)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/4108",
                            "name": "Annihilation: Silver Surfer (2006) #1"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/4218",
                            "name": "Annihilation: Silver Surfer (2006) #2"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/4315",
                            "name": "Annihilation: Silver Surfer (2006) #3"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/4470",
                            "name": "Annihilation: Silver Surfer (2006) #4"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/4822",
                            "name": "Annihilation: The Nova Corps (2006) #1"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/29198",
                            "name": "Avengers (2010) #12"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/6981",
                            "name": "Avengers (1963) #125"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/7131",
                            "name": "Avengers (1963) #260"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/32477",
                            "name": "Avengers & the Infinity Gauntlet (2010) #1"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/32479",
                            "name": "Avengers & the Infinity Gauntlet (2010) #2"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/32481",
                            "name": "Avengers & the Infinity Gauntlet (2010) #3"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/32483",
                            "name": "Avengers & the Infinity Gauntlet (2010) #4"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/32993",
                            "name": "AVENGERS & THE INFINITY GAUNTLET GN-TPB (Trade Paperback)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/66397",
                            "name": "Avengers & The Infinity Gauntlet (Trade Paperback)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/6943",
                            "name": "Avengers Annual (1967) #7"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/41354",
                            "name": "Avengers Assemble (2012) #3"
                        }
                    ],
                    "returned": 20
                },
                "series": {
                    "available": 144,
                    "collectionURI": "http://gateway.marvel.com/v1/public/characters/1009652/series",
                    "items": [
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/2116",
                            "name": "Alpha Flight (1983 - 1994)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/3613",
                            "name": "Annihilation (2006 - 2007)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/1077",
                            "name": "Annihilation: Prologue (2006)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/1078",
                            "name": "Annihilation: Silver Surfer (2006)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/1115",
                            "name": "Annihilation: The Nova Corps (2006)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/9085",
                            "name": "Avengers (2010 - 2012)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/1991",
                            "name": "Avengers (1963 - 1996)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/9859",
                            "name": "Avengers & the Infinity Gauntlet (2010)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/24044",
                            "name": "Avengers & The Infinity Gauntlet (2018)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/10035",
                            "name": "AVENGERS & THE INFINITY GAUNTLET GN-TPB (2011)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/1988",
                            "name": "Avengers Annual (1967 - 1994)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/15373",
                            "name": "Avengers Assemble (2012 - 2014)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/27690",
                            "name": "AVENGERS BY BRIAN MICHAEL BENDIS: THE COMPLETE COLLECTION VOL. 3 TPB (2017)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/23143",
                            "name": "Avengers by Jonathan Hickman Omnibus Vol. 1 (2017)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/31307",
                            "name": "Avengers Mech Strike (2021)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/24135",
                            "name": "Avengers vs. Thanos (2018)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/20555",
                            "name": "Avengers: Celestial Quest (2001)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/22468",
                            "name": "AVENGERS: THE COMPLETE CELESTIAL MADONNA SAGA TPB (2017)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/26494",
                            "name": "Black Order: The Warmasters Of Thanos (2019)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/690",
                            "name": "Captain Marvel (2000 - 2002)"
                        }
                    ],
                    "returned": 20
                },
                "stories": {
                    "available": 323,
                    "collectionURI": "http://gateway.marvel.com/v1/public/characters/1009652/stories",
                    "items": [
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/694",
                            "name": "Cover #694",
                            "type": "cover"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/695",
                            "name": "Interior #695",
                            "type": "interiorStory"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/1412",
                            "name": "Cover #1412",
                            "type": "cover"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/1413",
                            "name": "Interior #1413",
                            "type": "interiorStory"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/1602",
                            "name": "Cover #1602",
                            "type": "cover"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/1603",
                            "name": "Interior #1603",
                            "type": "interiorStory"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/1800",
                            "name": "Cover #1800",
                            "type": "cover"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/1801",
                            "name": "Interior #1801",
                            "type": "interiorStory"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/1842",
                            "name": "Cover #1842",
                            "type": "cover"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/1843",
                            "name": "Interior #1843",
                            "type": "interiorStory"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/2253",
                            "name": "Cover #2253",
                            "type": "cover"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/2254",
                            "name": "Interior #2254",
                            "type": "interiorStory"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/2436",
                            "name": "Cover #2436",
                            "type": "cover"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/2437",
                            "name": "Interior #2437",
                            "type": "interiorStory"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/2438",
                            "name": "Cover #2438",
                            "type": "cover"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/2439",
                            "name": "Interior #2439",
                            "type": "interiorStory"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/2440",
                            "name": "Cover #2440",
                            "type": "cover"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/2441",
                            "name": "Interior #2441",
                            "type": "interiorStory"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/2442",
                            "name": "Cover #2442",
                            "type": "cover"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/2443",
                            "name": "Interior #2443",
                            "type": "interiorStory"
                        }
                    ],
                    "returned": 20
                },
                "events": {
                    "available": 8,
                    "collectionURI": "http://gateway.marvel.com/v1/public/characters/1009652/events",
                    "items": [
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/events/229",
                            "name": "Annihilation"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/events/235",
                            "name": "Blood and Thunder"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/events/315",
                            "name": "Infinity"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/events/29",
                            "name": "Infinity War"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/events/319",
                            "name": "Original Sin"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/events/295",
                            "name": "Realm of Kings"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/events/271",
                            "name": "Secret Wars II"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/events/294",
                            "name": "The Thanos Imperative"
                        }
                    ],
                    "returned": 8
                },
                "urls": [
                    {
                        "type": "detail",
                        "url": "http://marvel.com/comics/characters/1009652/thanos?utm_campaign=apiRef&utm_source=a93d4a590ea422ca5eef8dfd3b01f1ea"
                    },
                    {
                        "type": "wiki",
                        "url": "http://marvel.com/universe/Thanos?utm_campaign=apiRef&utm_source=a93d4a590ea422ca5eef8dfd3b01f1ea"
                    },
                    {
                        "type": "comiclink",
                        "url": "http://marvel.com/comics/characters/1009652/thanos?utm_campaign=apiRef&utm_source=a93d4a590ea422ca5eef8dfd3b01f1ea"
                    }
                ]
            }
        ]
    }
}
```

Second API call result - Galactus
```sh
{
    "code": 200,
    "status": "Ok",
    "copyright": "© 2024 MARVEL",
    "attributionText": "Data provided by Marvel. © 2024 MARVEL",
    "attributionHTML": "<a href=\"http://marvel.com\">Data provided by Marvel. © 2024 MARVEL</a>",
    "etag": "22ee5d03adef67f10c9146e0fec6b171aab84811",
    "data": {
        "offset": 0,
        "limit": 20,
        "total": 1,
        "count": 1,
        "results": [
            {
                "id": 1009312,
                "name": "Galactus",
                "description": "",
                "modified": "2014-09-30T16:47:03-0400",
                "thumbnail": {
                    "path": "http://i.annihil.us/u/prod/marvel/i/mg/5/03/528d31a791308",
                    "extension": "jpg"
                },
                "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009312",
                "comics": {
                    "available": 244,
                    "collectionURI": "http://gateway.marvel.com/v1/public/characters/1009312/comics",
                    "items": [
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/48172",
                            "name": "Hunger (2013) #1"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/48174",
                            "name": "Hunger (2013) #2"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/12638",
                            "name": "Alpha Flight (1983) #10"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/12639",
                            "name": "Alpha Flight (1983) #100"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/4788",
                            "name": "Annihilation (2006) #1"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/5655",
                            "name": "Annihilation (2006) #5"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/5795",
                            "name": "Annihilation (2006) #6"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/5976",
                            "name": "Annihilation: Heralds of Galactus (2007) #1"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/6175",
                            "name": "Annihilation: Heralds of Galactus (2007) #2"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/4218",
                            "name": "Annihilation: Silver Surfer (2006) #2"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/4315",
                            "name": "Annihilation: Silver Surfer (2006) #3"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/4470",
                            "name": "Annihilation: Silver Surfer (2006) #4"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/66602",
                            "name": "Annihilation: The Complete Collection Vol. 1 (Trade Paperback)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/29207",
                            "name": "Avengers (2010) #4"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/34139",
                            "name": "Avengers (2010) #5"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/17754",
                            "name": "Avengers (1996) #12"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/7131",
                            "name": "Avengers (1963) #260"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/7132",
                            "name": "Avengers (1963) #261"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/12402",
                            "name": "Avengers Forever (1998) #10"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/1033",
                            "name": "Avengers Legends Vol. I: Avengers Forever (Trade Paperback)"
                        }
                    ],
                    "returned": 20
                },
                "series": {
                    "available": 117,
                    "collectionURI": "http://gateway.marvel.com/v1/public/characters/1009312/series",
                    "items": [
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/2116",
                            "name": "Alpha Flight (1983 - 1994)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/3613",
                            "name": "Annihilation (2006 - 2007)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/1864",
                            "name": "Annihilation: Heralds of Galactus (2007)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/1078",
                            "name": "Annihilation: Silver Surfer (2006)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/24256",
                            "name": "Annihilation: The Complete Collection Vol. 1 (2018)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/3621",
                            "name": "Avengers (1996 - 1997)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/9085",
                            "name": "Avengers (2010 - 2012)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/1991",
                            "name": "Avengers (1963 - 1996)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/2111",
                            "name": "Avengers Forever (1998 - 1999)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/93",
                            "name": "Avengers Legends Vol. I: Avengers Forever (2002)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/994",
                            "name": "Bullet Points (2006 - 2007)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/2424",
                            "name": "Bullet Points (2007)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/33955",
                            "name": "Clobberin' Time (2023 - Present)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/21004",
                            "name": "Damage Control (1991)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/2002",
                            "name": "Daredevil (1964 - 1998)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/7696",
                            "name": "Dark Reign: Zodiac (2009)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/11518",
                            "name": "Deadpool Team-Up (2010 - 2011)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/9045",
                            "name": "Deadpool Team-Up (2009 - 2011)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/12988",
                            "name": "Deadpool Team-Up Vol. 3 (2010 - Present)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/24296",
                            "name": "Doctor Strange (2018 - 2019)"
                        }
                    ],
                    "returned": 20
                },
                "stories": {
                    "available": 267,
                    "collectionURI": "http://gateway.marvel.com/v1/public/characters/1009312/stories",
                    "items": [
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/694",
                            "name": "Cover #694",
                            "type": "cover"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/898",
                            "name": "Fantastic Four (1998) #520",
                            "type": "cover"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/899",
                            "name": "1 of 5 - Galactus",
                            "type": "interiorStory"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/922",
                            "name": "Fantastic Four (1998) #518",
                            "type": "cover"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/923",
                            "name": "AVENGERS DISASSEMBLED TIE-IN! \"FOURTITUDE\" PART 2 (OF 3) With public opinion of the FF at an all-time low and with all of Manhat",
                            "type": "interiorStory"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/924",
                            "name": "Fantastic Four (1998) #519",
                            "type": "cover"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/925",
                            "name": "AVENGERS DISASSEMBLED TIE-IN! \"FOURTITUDE\" FINALE! PART 3 (OF 3) Galactus the World-Eater is coming to Earth to choose one of th",
                            "type": "interiorStory"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/1412",
                            "name": "Cover #1412",
                            "type": "cover"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/1842",
                            "name": "Cover #1842",
                            "type": "cover"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/2253",
                            "name": "Cover #2253",
                            "type": "cover"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/2442",
                            "name": "Cover #2442",
                            "type": "cover"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/2446",
                            "name": "Cover #2446",
                            "type": "cover"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/5286",
                            "name": "1 of 1 - Thor",
                            "type": "interiorStory"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/5590",
                            "name": "1 of 5 XLS",
                            "type": "cover"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/5592",
                            "name": "2 of 5 XLS",
                            "type": "cover"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/5594",
                            "name": "3 of 5 XLS",
                            "type": "cover"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/5596",
                            "name": "4 of 5 XLS",
                            "type": "cover"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/5598",
                            "name": "5 of 5 XLS",
                            "type": "cover"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/5612",
                            "name": "1 of 5 -",
                            "type": "cover"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/5614",
                            "name": "Bullet Points (2006) #2",
                            "type": "cover"
                        }
                    ],
                    "returned": 20
                },
                "events": {
                    "available": 10,
                    "collectionURI": "http://gateway.marvel.com/v1/public/characters/1009312/events",
                    "items": [
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/events/314",
                            "name": "Age of Ultron"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/events/229",
                            "name": "Annihilation"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/events/234",
                            "name": "Avengers Disassembled"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/events/318",
                            "name": "Dark Reign"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/events/302",
                            "name": "Fear Itself"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/events/29",
                            "name": "Infinity War"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/events/255",
                            "name": "Initiative"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/events/336",
                            "name": "Secret Empire"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/events/270",
                            "name": "Secret Wars"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/events/271",
                            "name": "Secret Wars II"
                        }
                    ],
                    "returned": 10
                },
                "urls": [
                    {
                        "type": "detail",
                        "url": "http://marvel.com/comics/characters/1009312/galactus?utm_campaign=apiRef&utm_source=a93d4a590ea422ca5eef8dfd3b01f1ea"
                    },
                    {
                        "type": "wiki",
                        "url": "http://marvel.com/universe/Galactus?utm_campaign=apiRef&utm_source=a93d4a590ea422ca5eef8dfd3b01f1ea"
                    },
                    {
                        "type": "comiclink",
                        "url": "http://marvel.com/comics/characters/1009312/galactus?utm_campaign=apiRef&utm_source=a93d4a590ea422ca5eef8dfd3b01f1ea"
                    }
                ]
            }
        ]
    }
}
```

Third API call result - Onslaught
```sh
{
    "code": 200,
    "status": "Ok",
    "copyright": "© 2024 MARVEL",
    "attributionText": "Data provided by Marvel. © 2024 MARVEL",
    "attributionHTML": "<a href=\"http://marvel.com\">Data provided by Marvel. © 2024 MARVEL</a>",
    "etag": "9033a87f99e64bddd408e734265498c843fed024",
    "data": {
        "offset": 0,
        "limit": 20,
        "total": 1,
        "count": 1,
        "results": [
            {
                "id": 1009483,
                "name": "Onslaught",
                "description": "",
                "modified": "2014-04-29T14:14:34-0400",
                "thumbnail": {
                    "path": "http://i.annihil.us/u/prod/marvel/i/mg/6/60/535febc427605",
                    "extension": "jpg"
                },
                "resourceURI": "http://gateway.marvel.com/v1/public/characters/1009483",
                "comics": {
                    "available": 46,
                    "collectionURI": "http://gateway.marvel.com/v1/public/characters/1009483/comics",
                    "items": [
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/7395",
                            "name": "Cable (1993) #21"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/7451",
                            "name": "Cable (1993) #72"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/65466",
                            "name": "Captain America by Mark Waid, Ron Garney & Andy Kubert (Hardcover)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/8686",
                            "name": "Excalibur (1988) #99"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/8564",
                            "name": "Excalibur (1988) #100"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/5589",
                            "name": "Heroes Reborn: Iron Man (Trade Paperback)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/9255",
                            "name": "Incredible Hulk (1962) #444"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/16330",
                            "name": "Iron Man (1996) #11"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/23388",
                            "name": "Onslaught Epilogue (1997) #1"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/17472",
                            "name": "Onslaught Reborn (Trade Paperback)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/5532",
                            "name": "Onslaught Reborn (2006) #1"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/5658",
                            "name": "Onslaught Reborn (2006) #2"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/5797",
                            "name": "Onslaught Reborn (2006) #3"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/5956",
                            "name": "Onslaught Reborn (2006) #4"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/6193",
                            "name": "Onslaught Reborn (2006) #5"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/38067",
                            "name": "Onslaught Unleashed (2010) #1"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/37960",
                            "name": "Onslaught Unleashed (2010) #1 (LIEFELD VARIANT B)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/38057",
                            "name": "Onslaught Unleashed (2010) #1 (LIEFELD VARIANT A)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/38069",
                            "name": "Onslaught Unleashed (2010) #2"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/38066",
                            "name": "Onslaught Unleashed (2010) #3"
                        }
                    ],
                    "returned": 20
                },
                "series": {
                    "available": 27,
                    "collectionURI": "http://gateway.marvel.com/v1/public/characters/1009483/series",
                    "items": [
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/1995",
                            "name": "Cable (1993 - 2002)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/23810",
                            "name": "Captain America by Mark Waid, Ron Garney & Andy Kubert (2017)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/2011",
                            "name": "Excalibur (1988 - 1998)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/1814",
                            "name": "Heroes Reborn: Iron Man (2006)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/2021",
                            "name": "Incredible Hulk (1962 - 1999)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/13577",
                            "name": "Iron Man (1996 - 1998)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/6680",
                            "name": "Onslaught Epilogue (1997)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/1090",
                            "name": "Onslaught Reborn (2006 - 2007)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/3304",
                            "name": "Onslaught Reborn (2008 - Present)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/13602",
                            "name": "Onslaught Unleashed (2010 - 2011)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/15490",
                            "name": "ONSLAUGHT UNLEASHED HC (2011)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/2057",
                            "name": "Onslaught: Marvel Universe (1996)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/3900",
                            "name": "Onslaught: X-Men  (1996)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/1987",
                            "name": "The Amazing Spider-Man (1963 - 1998)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/2258",
                            "name": "Uncanny X-Men (1963 - 2011)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/2098",
                            "name": "X-Factor (1986 - 1998)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/3633",
                            "name": "X-Force (1991 - 2004)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/3643",
                            "name": "X-Man (1995 - 2000)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/2265",
                            "name": "X-Men (1991 - 2001)"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/24107",
                            "name": "X-Men Gold Vol. 0: Homecoming (2018)"
                        }
                    ],
                    "returned": 20
                },
                "stories": {
                    "available": 41,
                    "collectionURI": "http://gateway.marvel.com/v1/public/characters/1009483/stories",
                    "items": [
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/5982",
                            "name": "ONSLAUGHT REBORN (2006) #1",
                            "type": "cover"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/5984",
                            "name": "ONSLAUGHT REBORN (2006) #2",
                            "type": "cover"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/5986",
                            "name": "ONSLAUGHT REBORN (2006) #3",
                            "type": "cover"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/7829",
                            "name": "ONSLAUGHT REBORN (2006) #4",
                            "type": "cover"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/7835",
                            "name": "ONSLAUGHT REBORN (2006) #5",
                            "type": "cover"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/8286",
                            "name": "ONSLAUGHT REBORN (2006) #4",
                            "type": "cover"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/19051",
                            "name": "Cable Vision",
                            "type": ""
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/19053",
                            "name": "Dancing In the Dark",
                            "type": ""
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/22144",
                            "name": "Onslaught Impact 1: Re-Creating Havok in McCoy's Image",
                            "type": "cover"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/22161",
                            "name": "Brotherhood",
                            "type": "interiorStory"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/22407",
                            "name": "London's Burning",
                            "type": "interiorStory"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/22666",
                            "name": "Fire with Fire",
                            "type": "interiorStory"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/24210",
                            "name": "\"...Our Regularly Scheduled Program...\"",
                            "type": "interiorStory"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/24330",
                            "name": "Broken Pillars",
                            "type": "interiorStory"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/26051",
                            "name": "ONSLAUGHT: MARVEL UNIVERSE (1996) #1",
                            "type": "cover"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/28180",
                            "name": "The Other Shoe...",
                            "type": "interiorStory"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/28185",
                            "name": "...Apocalypse Lives! (Onslaught Phase One)",
                            "type": "interiorStory"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/28188",
                            "name": "Onslaught Phase 2: Metamorphosis",
                            "type": "cover"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/29240",
                            "name": "In the Clutches of Onslaught",
                            "type": "cover"
                        },
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/29242",
                            "name": "The Secret Revealed !",
                            "type": "cover"
                        }
                    ],
                    "returned": 20
                },
                "events": {
                    "available": 1,
                    "collectionURI": "http://gateway.marvel.com/v1/public/characters/1009483/events",
                    "items": [
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/events/154",
                            "name": "Onslaught"
                        }
                    ],
                    "returned": 1
                },
                "urls": [
                    {
                        "type": "detail",
                        "url": "http://marvel.com/characters/1657/onslaught?utm_campaign=apiRef&utm_source=a93d4a590ea422ca5eef8dfd3b01f1ea"
                    },
                    {
                        "type": "wiki",
                        "url": "http://marvel.com/universe/Onslaught_%28entity%29?utm_campaign=apiRef&utm_source=a93d4a590ea422ca5eef8dfd3b01f1ea"
                    },
                    {
                        "type": "comiclink",
                        "url": "http://marvel.com/comics/characters/1009483/onslaught?utm_campaign=apiRef&utm_source=a93d4a590ea422ca5eef8dfd3b01f1ea"
                    }
                ]
            }
        ]
    }
}
```
