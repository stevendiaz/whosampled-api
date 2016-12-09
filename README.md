# whosampled-api

#### Initial thoughts
An API for fetching songs that other songs have sampled. I want to use a fresh stack so I can learn new things. As of the time of this post, I think I'm going with Ruby & Sinatra for the framework, Nokogiri for the HTML parsing, and some noSQL database for the caching. 

Songs can both be sampled in other songs and have samples. Ideally, this API would have endpoints for both at once or just one of the two. 
The response would look something like this
```
{
  song: "Father Stretch My Hands Pt. 1",
  artist: "Kanye West",
  year: 2016,
  contains_samples: [
    {
      song: "Father I Stretch My Hands",
      artist: "Pastor T. L. Barrett"
      year: 1976
    },
    {
      song: "Jumpman"
      artist: "Drake & Future"
      year: 2015
    }
  ]
  was_sampled: []
}
```
