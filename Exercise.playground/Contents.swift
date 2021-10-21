import RxSwift
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true


// Exercise: use a Single trait to read a file

  // a little set-up to start us off
  let disposeBag = DisposeBag()

  enum FileReadError: Error {
    case fileNotFound, unreadable, encodingFailed
  }

  
  // MAIN: create a function that will read a text file and return it as a Single
  func loadText(from filename: String) -> Single<String> {
    
    // now create the Single
    return Single.create { single in
      // the subscribe closure of the create method must return a disposable
      // so create one now that will be returned in various situations below
      let disposable = Disposables.create()

      // get the path for the filename, or else add a file not found error onto
      // the Single and return the disposable created above
      guard let path = Bundle.main.path(forResource: filename, ofType: "txt") else {
        single(.error(FileReadError.fileNotFound))
        return disposable
      }

      // get the data from the file at that path, or add an unreadable error onto
      // the Single and return the disposable created above
      guard let data = FileManager.default.contents(atPath: path) else {
        single(.error(FileReadError.unreadable))
        return disposable
      }

      // convert the data to a string; otherwise, add an encoding failed error onto
      // the Single and return the disposable created above
      guard let contents = String(data: data, encoding: .utf8) else {
        single(.error(FileReadError.encodingFailed))
        return disposable
      }

      // if we got this far, add contents as a success...
      single(.success(contents))
      // ... and still return the disposable created above
      return disposable
    }
  }

  // Now let's use all this to read a file of HGTTG quotes
  // See README for more instructions
  
//  loadText(from: "Quotes") ...      // prints out the quotes from the file
//  loadText(from: "fix_bug") ...     // fileNotFound
//  loadText(from: "fix_bugs") ...    // encodingFailed


  
  
  
  




