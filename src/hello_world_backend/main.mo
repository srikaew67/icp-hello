import Array "mo:base/Array";

actor {

  // State: An array to store submitted names
  stable var submittedNames: [Text] = [];

  // Function to greet and update submitted names
  public func greet(name: Text): async Text {
    // Add name to the submittedNames array
    submittedNames := Array.append(submittedNames, [name]);
    // Return a greeting
    return "Hello, " # name # " !";
  };

  // Query function to retrieve all submitted names
  public query func getSubmittedNames(): async [Text] {
    return submittedNames;
  };
};

