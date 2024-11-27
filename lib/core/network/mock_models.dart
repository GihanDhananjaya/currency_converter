class MockModels{
  ///Endpoint : location/data
  static const String locationDataResponse = '''{
  "success": true,
  "message": "Location Data Success",
  "output": {
    "location_name": "Sigiriya",
    "description": "Sigiriya, often referred to as the Lion Rock, is a renowned archaeological and historical site located in the central Matale District of Sri Lanka. ",
    "tag" : "Historical",
    "tags": [
      {
        "tag_category_id": 1,
        "category": "Location Tags",
        "tag_id": 1,
        "tag": "Historical"
      }
    ],
    "province_id": 1,
    "province": "North Central Province",
    "city_id": 2,
    "city": "Matale",
    "distance":1200,
    "duration":120,
    "thumbnail": "https://ichef.bbci.co.uk/images/ic/1376xn/p0b7n6dm.jpg.webp",
    "latitude": 7.9570327,
    "longitude": 80.7576821,
    "visiting_duration": 190,
    "visit_start_time": "06:30 AM",
    "visit_end_time": "05:30 PM",
    "daily_visitors": "100-200",
    "safety_level": "Medium",
    "contact_number": null,
    "website": "https://sigiriyafortress.com/sigiriya-opening-hours-sigiriya-ticket-prices/",
    "warning_availability": 1,
    "warning_type_id": 1,
    "warning_data": "Pay attention to your surroundings and any potential hazards. Avoid distractions, especially when performing tasks that require your full attention",
    "open_close_availability": 1,
    "available_hours": [
      {
        "day": "Monday",
        "is_open": 1,
        "start_time": "06:30 AM",
        "end_time": "05:30 PM"
      },
      {
        "day": "Tuesday",
        "is_open": 1,
        "start_time": "06:30 AM",
        "end_time": "05:30 PM"
      },
      {
        "day": "Wednesday",
        "is_open": 1,
        "start_time": "06:30 AM",
        "end_time": "05:30 PM"
      },
      {
        "day": "Thursday",
        "is_open": 1,
        "start_time": "06:30 AM",
        "end_time": "05:30 PM"
      },
      {
        "day": "Friday",
        "is_open": 1,
        "start_time": "06:30 AM",
        "end_time": "05:30 PM"
      },
      {
        "day": "Saturday",
        "is_open": 0,
        "start_time": "06:30 AM",
        "end_time": "05:30 PM"
      },
      {
        "day": "Sunday",
        "is_open": 0,
        "start_time": "06:30 AM",
        "end_time": "05:30 PM"
      }
    ],
    "ticket_availability": 1,
    "tickets": [
      {
        "ticket_type_id": 1,
        "ticket_type": "Any",
        "value": "36",
        "currency": "USD"
      }
    ],
    "season_availability": 0,
    "season_start_date": "2024-12-01",
    "season_end_date": "2025-01-31",
    "location_reachability": [
      {
        "reachability_type_id": 2,
        "reachability": "Walking"
      }
    ],
    "parking_availability": [
      {
        "parking_type_id": 1,
        "parking_type": "Bikes & Scooters"
      },
      {
        "parking_type_id": 2,
        "parking_type": "Cars & Vans"
      }
    ],
    "washroom_availability": 1,
    "shops_availability": -1,
    "gallery": [
      {
        "id": 1,
        "image_url": "https://ichef.bbci.co.uk/images/ic/1376xn/p0b7n6dm.jpg.webp",
        "credit_by": "Paradise Guide"
      },
      {
        "id": 2,
        "image_url": "https://ichef.bbci.co.uk/images/ic/1376xn/p0b7n6d9.jpg.webp",
        "credit_by": "Paradise Guide"
      },
      {
        "id": 3,
        "image_url": "https://ichef.bbci.co.uk/images/ic/1376xn/p0b7n6d7.jpg.webp",
        "credit_by": "Paradise Guide"
      },
      {
        "id": 4,
        "image_url": "https://ichef.bbci.co.uk/images/ic/1376xn/p0b7n6cj.jpg.webp",
        "credit_by": "Paradise Guide"
      },
      {
        "id": 5,
        "image_url": "https://ichef.bbci.co.uk/images/ic/1376xn/p0b7n6cd.jpg.webp",
        "credit_by": "Paradise Guide"
      }
    ]
  }
}''';

  static const String cityAllResponse = '''{
  "success":true,
  "message":"City Success",
  "output":[
    {
      "city_id":1,
      "city":"Galle",
      "district_id" : 1,
      "district" : "Galle",
      "province_id": 1,
      "province":"Southern",
      "location_count": 42
    },
    {
      "city_id":2,
      "city":"Matara",
      "district_id" : 2,
      "district" : "Matara",
      "province_id": 1,
      "province":"Southern",
      "location_count": 34
    },
    {
      "city_id":3,
      "city":"Tangalle",
      "district_id" : 1,
      "district" : "Galle",
      "province_id": 1,
      "province":"Southern",
      "location_count": 12
    },
    {
      "city_id":4,
      "city":"Unawatuna",
      "district_id" : 1,
      "district" : "Galle",
      "province_id": 1,
      "province":"Southern",
      "location_count": 6
    },
    {
      "city_id":5,
      "city":"Mirissa",
      "district_id" : 2,
      "district" : "Matara",
      "province_id": 1,
      "province":"Southern",
      "location_count": 4
    },
    {
      "city_id":6,
      "city":"Hikkaduwa",
      "district_id" : 1,
      "district" : "Galle",
      "province_id": 1,
      "province":"Southern",
      "location_count": 8
    },
    {
      "city_id":7,
      "city":"Weligama",
      "district_id" : 2,
      "district" : "Matara",
      "province_id": 1,
      "province":"Southern",
      "location_count": 11
    }
   ]
}
  ''';

  static const String locationAllResponse = '''{
  "success": true,
  "message": "Location List Success",
  "output": [
    {
      "location_id": 1,
      "location_name": "Adams Peak",
      "tag": "Historical",
      "season_start_date": "2024-12-12",
      "season_end_date": "2024-05-31",
      "thumbnail": "https://www.ceylonexpeditions.com/medias/destination_places/big/110/sri-pada-adam-s-peak-sri-lanka.jpg",
      "province": "Sabaragamuwa",
      "city": "Ratnapura",
      "distance": 200,
      "status": 3
    },
    {
      "location_id": 2,
      "location_name": "Nine Arches",
      "tag": "Mountain",
      "season_start_date": "2024-06-12",
      "season_end_date": "2024-08-31",
      "thumbnail": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPb3JOuCCMIf90Dbnrmx14mwVcmR75RdOHrgjh-ClZ5A&s",
      "province": "Uva",
      "city": "Ella",
      "distance": 1200,
      "status": 3
    },
    {
      "location_id": 3,
      "location_name": "Ella Rock",
      "tag": "Mountain",
      "season_start_date": "2024-01-12",
      "season_end_date": "2024-05-31",
      "thumbnail": "https://www.srilankatravelandtourism.com/places-sri-lanka/ella/ella-images/ella-4-sri-lanka.jpg",
      "province": "Uva",
      "city": "Ella",
      "distance": 3200,
      "status": 3
    },
    {
      "location_id": 4,
      "location_name": "Temple of Tooth",
      "tag": "Historical",
      "season_start_date": "2024-05-12",
      "season_end_date": "2024-08-31",
      "thumbnail": "https://whc.unesco.org/uploads/thumbs/site_0450_0020-1200-630-20151105154018.jpg",
      "province": "Central",
      "city": "Kandy",
      "distance": 800,
      "status": 3
    }
  ]
}

  ''';

  static const String nearestCityResponse = '''{
  "success": true,
  "message": "Nearest City Data Success",
  "output": {
    "city_id": 1,
    "city": "Ella",
    "province_id" : 1,
    "province" : "Uwa"
  }
}
  ''';


  static const String provinceAllResponse = '''{
  "success":true,
  "message":"Province Success",
  "output":[
    {
      "province_id":1,
      "province":"Western"
    },
    {
      "province_id":2,
      "province":"Sabaragamu"
    }
   ]
}
  ''';

  static const String dashboardAPIResponse = '''{
  "success": true,
  "message": "Dashboard Data Success",
  "output": {
    "dashboard_image" : "https://whc.unesco.org/uploads/thumbs/site_0450_0020-1200-630-20151105154018.jpg",
    "top_places": [
      {
      "location_id": 1,
      "location_name": "Adams Peak",
      "tag": "Historical",
      "season_start_date": "2024-12-12",
      "season_end_date": "2024-05-31",
      "thumbnail": "https://www.ceylonexpeditions.com/medias/destination_places/big/110/sri-pada-adam-s-peak-sri-lanka.jpg",
      "province": "Sabaragamuwa",
      "city": "Ratnapura",
      "distance": 200,
      "status": 3
    },
    {
      "location_id": 2,
      "location_name": "Nine Arches",
      "tag": "Mountain",
      "season_start_date": "2024-06-12",
      "season_end_date": "2024-08-31",
      "thumbnail": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPb3JOuCCMIf90Dbnrmx14mwVcmR75RdOHrgjh-ClZ5A&s",
      "province": "Uva",
      "city": "Ella",
      "distance": 1200,
      "status": 3
    },
    {
      "location_id": 3,
      "location_name": "Ella Rock",
      "tag": "Mountain",
      "season_start_date": "2024-01-12",
      "season_end_date": "2024-05-31",
      "thumbnail": "https://www.srilankatravelandtourism.com/places-sri-lanka/ella/ella-images/ella-4-sri-lanka.jpg",
      "province": "Uva",
      "city": "Ella",
      "distance": 3200,
      "status": 3
    },
    {
      "location_id": 4,
      "location_name": "Temple of Tooth",
      "tag": "Historical",
      "season_start_date": "2024-05-12",
      "season_end_date": "2024-08-31",
      "thumbnail": "https://whc.unesco.org/uploads/thumbs/site_0450_0020-1200-630-20151105154018.jpg",
      "province": "Central",
      "city": "Kandy",
      "distance": 800,
      "status": 3
    }
    ],
    "seasonal_places": [
      {
      "location_id": 1,
      "location_name": "Adams Peak",
      "tag": "Historical",
      "season_start_date": "2024-12-12",
      "season_end_date": "2024-05-31",
      "thumbnail": "https://www.ceylonexpeditions.com/medias/destination_places/big/110/sri-pada-adam-s-peak-sri-lanka.jpg",
      "province": "Sabaragamuwa",
      "city": "Ratnapura",
      "distance": 200,
      "status": 3
    },
    {
      "location_id": 2,
      "location_name": "Nine Arches",
      "tag": "Mountain",
      "season_start_date": "2024-06-12",
      "season_end_date": "2024-08-31",
      "thumbnail": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPb3JOuCCMIf90Dbnrmx14mwVcmR75RdOHrgjh-ClZ5A&s",
      "province": "Uva",
      "city": "Ella",
      "distance": 1200,
      "status": 3
    },
    {
      "location_id": 3,
      "location_name": "Ella Rock",
      "tag": "Mountain",
      "season_start_date": "2024-01-12",
      "season_end_date": "2024-05-31",
      "thumbnail": "https://www.srilankatravelandtourism.com/places-sri-lanka/ella/ella-images/ella-4-sri-lanka.jpg",
      "province": "Uva",
      "city": "Ella",
      "distance": 3200,
      "status": 3
    },
    {
      "location_id": 4,
      "location_name": "Temple of Tooth",
      "tag": "Historical",
      "season_start_date": "2024-05-12",
      "season_end_date": "2024-08-31",
      "thumbnail": "https://whc.unesco.org/uploads/thumbs/site_0450_0020-1200-630-20151105154018.jpg",
      "province": "Central",
      "city": "Kandy",
      "distance": 800,
      "status": 3
    }
    ]
  }
}
  ''';

}



