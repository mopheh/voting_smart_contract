import Text "mo:base/Text";
import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import POLLActorClass "../POLL/poll";
actor Voting{

  var PollsMap = HashMap.HashMap<Principal, POLLActorClass.POLL>(1, Principal.equal, Principal.hash);

  public func addCategory(name:Text, applicants: [Text]): async Principal {
    let newCategory = await POLLActorClass.POLL(name, applicants);

    let newCategoryId = await newCategory.getCanisterId();


    PollsMap.put(newCategoryId, newCategory);

    return newCategoryId;
  };

  public shared(msg) func vote(category:Principal, choice:Text): async Text {
    let voter = msg.caller;

    let pollOpt = PollsMap.get(category);
    if(pollOpt == null) {
      return "No record found"
    };

    let poll = pollOpt!;
    var feedBack = await poll.castVotes(choice);
    return feedBack

  }

};
