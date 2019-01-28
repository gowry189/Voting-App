contract Voting{
    /*a strucute that defines the details of
    the candidate participating in the election*/
    struct Candidate{
        uint candidateId;
        string nameCandidate;
        uint totalVote;
    }
    uint totalCandidates;
    //mapping to store the voters
    mapping(address => bool) public voters;
    //mapping to store candidate details
    mapping(uint => Candidate) public candidateDetails;
    
    function addCandidate(string _nameCandidate) private {
        totalCandidates++;
        candidateDetails[totalCandidates] = Candidate(totalCandidates, _nameCandidate,0);
    }
    
    function vote(uint _candidateId) public {
        require(!voters[msg.sender] && _candidateId>0 && _candidateId <= totalCandidates);
        voters[msg.sender] = true;
        candidateDetails[_candidateId].totalVote++;
    
    }
    function Voting() public {
        addCandidate("Chandler Bing");
        addCandidate("Monica Geller");
    }
}
