import 'package:get/get.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys {
    return {
      'en': {
        'home': 'Home',
        'search': 'Search',
        'albums': 'Albums',
        'welcome_to': 'Welcome to ',
        'welcome_description':
            'Explore the top categories, find yourself inside.',
        'no_results_found_for': "No results found for '@field'",
        'sort_the_albums': 'Sort the Albums',
        'sort_name_asc': 'Sort by Name (Ascending)',
        'sort_name_desc': 'Sort by Name (Descending)',
        'sort_date_asc': 'Sort by Date (Ascending)',
        'sort_date_desc': 'Sort by Date (Descending)',
        'shuffle': 'Shuffle',
        'song_count_and_price': r'@count songs for $@price',
        'error': 'Error',
        'connect_timeout_error':
            "Couldn't fetch Top 100 Albums.\nPlease check your connection.",
        'receive_timeout_error':
            "Couldn't fetch Top 100 Albums.\nPlease try again.",
        'response_error': 'Somethig wrong with the server. (@status_code)',
      },
    };
  }
}
