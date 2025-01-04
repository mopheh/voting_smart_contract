import Principal "mo:base/Principal";
import Array "mo:base/Array";
import Text "mo:base/Text";
import HashMap "mo:base/HashMap";
actor class POLL(category: Text, applicants: [Text]) = this {

    var categoryName = category;
    let names:[Text] = applicants;
    var voters: [Principal] = [];


    let voteCounts = HashMap.HashMap<Text, Nat>(10, Text.equal, Text.hash);


    public query func getCategory(): async Text{
        return categoryName;
    };


    public query func getApplicants(): async [Text] {
        return names;
    };


    public query func getVotes(): async [Principal] {
        return voters;
    };

    private func isPrincipalInArray(principal: Principal, arr: [Principal]): Bool {
        for (p in arr) {
            if (p == principal) {
                return true;
            };
        };
        return false;
    };

    public shared(msg) func castVotes(choice: Text): async Text {
        let votes = await getVotes();
        if(isPrincipalInArray(msg.caller, votes)) {
            return "You have already voted"
        };


        voters := Array.append<Principal>(voters, [msg.caller]);
        switch(voteCounts.get(choice)) {
          case null {
            let choices = await getApplicants();
            if (Array.any<Text>(names, func (p) { p == choice })) {
                voteCounts.put(choice, 1);
                return "Vote cast successfully!"
            };
            return "Invalid Applicant";

          };
          case(?currentVotes) {voteCounts.put(choice, currentVotes + 1); 
                return "Vote cast successfully!";}
        };
    };

    public query func getCanisterId(): async Principal {
        return Principal.fromActor(this);
    }
}
