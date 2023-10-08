import Foundation

// Define a custom Result type with associated errors
typealias Handler<T> = (Result<T, DataError>) -> Void

// Define an enumeration to represent data-related errors
enum DataError: Error {
    case invalidResponse // Invalid HTTP response
    case invalidURL      // Invalid URL format
    case invalidData     // Invalid or corrupted data
    case network(Error?) // Network-related error with optional underlying error
}

// A class responsible for handling network requests and data retrieval
class NetworkManager {

    // Fetch data of a specified type from a given URL asynchronously
    static func fetchSchoolData<T: Decodable>(url: String) async throws -> T {
        // Convert the URL string into a URL object
        guard let url = URL(string: url) else {
            throw DataError.invalidURL
        }

        // Perform an asynchronous data request to the provided URL
        let (data, response) = try await URLSession.shared.data(from: url)

        // Check if the HTTP response status code indicates success (status code 200)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw DataError.invalidResponse
        }

        // Decode the retrieved data into an object of the specified type using JSONDecoder
        return try JSONDecoder().decode(T.self, from: data)
    }

    // Fetch SAT details data of a specified type from a given URL asynchronously
    static func fetchSchoolSATDetailsData<T: Decodable>(url: String) async throws -> T {
        // Convert the URL string into a URL object
        guard let url = URL(string: url) else {
            throw DataError.invalidURL
        }

        // Perform an asynchronous data request to the provided URL
        let (data, response) = try await URLSession.shared.data(from: url)

        // Check if the HTTP response status code indicates success (status code 200)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw DataError.invalidResponse
        }

        // Decode the retrieved data into an object of the specified type using JSONDecoder
        return try JSONDecoder().decode(T.self, from: data)
    }
}
