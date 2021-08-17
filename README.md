# Rick & Morty iOS

<img src="assets/rm.svg" width="300"/>



![Xcode Version](https://img.shields.io/badge/XCode-12.5-blue?logo=xcode&labelColor=3E81BC&color=brightgreen&logoColor=white&style=flat-square) ![Swift Version](https://img.shields.io/badge/Swift-5.4-blue?logo=swift&labelColor=orange&color=brightgreen&logoColor=white&style=flat-square) ![iOS Version](https://img.shields.io/badge/-14.5-blue?logo=ios&labelColor=lightgray&color=brightgreen&logoColor=white&style=flat-square)

## Overview

This project makes use of the [Rick & Morty API](https://rickandmortyapi.com) to display all informations about the *Characters* and the *Locations* of the series. The app, entirely written with the [SwiftUI](https://developer.apple.com/xcode/swiftui/) framework, follows the MVVM architecture  and is intented to be a showcase of some powerful iOS development techniques.

<img src="assets/characters.png" width="32%"/> <img src="assets/locations.png" width="32%"/> <img src="assets/rick.png" width="32%"/>

## Features

#### Pagination 

New data are requested only when needed, in order to limit network requests.

<img src="assets/characters.gif" width="49%"/> <img src="assets/locations.gif" width="49%"/>

#### Asynchronous Image Load

For a non-blocking app experience, images are loaded asynchronously and displayed only when they're ready.

<img src="assets/async-characters.png" width="49%"/> <img src="assets/async-rick.png" width="49%"/>



#### Dark Mode

<img src="assets/characters-dark.png" width="49%"/> <img src="assets/locations-dark.png" width="49%"/>

#### Memory safety

No longer visible images are freed up in order to save memory. Its usage remains almost constant.

<img src="assets/memory.gif" width="60%" /> <img src="assets/memory-scroll.gif" width="30%" />

#### GraphQL

The app uses the [GraphQL](https://graphql.org) technology in order to offer a lightwheight and powerful way to fetch the APIs. 

[Apollo](https://www.apollographql.com) client has been used for this project.

```graphql
query AllLocations($page : Int) {
    locations(page: $page) {
        info {
            next
        }
        results {
            id
            name
            type
            dimension
            residents {
                id
                name
                species
                type
                status
                gender
                image
            }
        }
    }
}
```

#### Extensive Use of Generics

The app makes a strong usage of generic types.

The model class `APIResponse`, which represents the response of a GraphQL query, is defined as shown below:

```swift
class APIResponse<T:Decodable> : Decodable {
    let info : Info
    let results : [T]
}
```

`ViewModel` class, which represent a generic view-model blueprint, is defined as shown below:

```swift
class ViewModel<T:Equatable> : ObservableObject, ViewModelProtocol {
    
    @Published var items : [T] = []
    var next : Int?
    
    func shouldLoad(_ item : T) {
        guard let last = items.last else {return}
        if item == last, next != nil {
            fetchMany()
        }
    }
    
    func fetchMany() { fatalError("Abstract Method") }

}
```

To perform a GraphQL query, there's only one exposed function: `perform<T, U>(query: T, completion: @escaping ((APIResponse<U>) -> ())) where T : GraphQLQuery, U : Decodable `, whose query and return type are defined at runtime.

Some examples of usage:

```swift
ApolloManager.perform(query: MyGraphQLQueryOne()) { (response : APIResponse<MyReturnDataOne>) in
		// Do something one
}

ApolloManager.perform(query: MyGraphQLQueryTwo(param: param)) { (response : APIResponse<MyReturnDataTwo>) in
		// Do something two
}
```



## To Do

- [ ] **Search Bar** to search characters and filter them by attributes 
- [ ] Include informations about **Episodes**
- [ ] **Tests**

<br/>

---

☕ **Antonio Pantaleo dev**
