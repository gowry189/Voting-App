contract Voting{
    /*a strucute that defines the details of
    the candidate participating in the election*/
    struct Candidate{
        uint id;
        string name;
        uint totalVote;
    }
    uint totalCandadates;
    //mapping to store the voters
    mapping(address => bool) public voters;
    //mapping to store candidate details
    mapping(address => Candidate) public candidateDetails;
}
