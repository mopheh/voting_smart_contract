import Principal "mo:base/Principal";
actor class POLL(category: Text, applicants: [Text], votes: [Principal]) = this {

    var catergoryName = category;
    let names = applicants;
    let voters = votes;


    public query func getCategory(): async Text{
        return category;
    };


    public query func getApplicants(): async [Text] {
        return applicants
    };


    public query func getVotes(): async [Principal] {
        return voters;
    };
    public query func getCanisterId(): async Principal {
        return Principal.fromActor(this);
    }
}
