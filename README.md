Basic weather app demonstrating SwiftUI implementation with MVVM.

- Using WeatherStack API to fetch current/forecast weather (https://weatherstack.com)
- Added some unit tests to showcase the flow.

**Improvements:**
- Environment could be used instead of injecting client.
- Environment variable can be managed by build configurations and targets.
- Views can depend on a viewmodel state variable rather than multiple @Published.
- We could use latest Swift concurrency (@Observable) if we have to support only latest iOS.
- Improve code coverage by testing all the features.
  
