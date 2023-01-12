const apiKey = '1567a7f85ee7cc55e7393d5fff815752';
// const apiToken =
//     'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5NzdjOTM5OTU0YTllMDM5N2ZmN2M2YTk1ZjVmMTcxZiIsInN1YiI6IjYyNTkxYWE5ZDA1YTAzMDA5ZDRlMWVmNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.rzWxoAQ7OJh6RK5nWjkxI_8y-2uU8VidzHF7K-l5UMQ';
const tmdb = 'https://api.themoviedb.org/3';
const query = '&language=en-US&query=a&page=1&include_adult=false';
const query2 =
    '&language=en-US&sort_by=popularity.desc&page=1&timezone=America%2FNew_York&include_null_first_air_dates=false&with_watch_monetization_types=flatrate&with_status=0&with_type=0';
const withoutQuery = '&language=en-US&page=1';
const adultFalse = '$withoutQuery/&query=a&include_adult=false';
