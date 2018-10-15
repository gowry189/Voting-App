pragma solidity ^0.4.18;

contract Voting {

    /* a mappig is done with candidate name stored in array with the vote count of each*/ 
    mapping(bytes32 => uint8) public votesReceived; 
    bytes32[] public candidateList;
    
    /* a constructor to initialize the candidate list with candidate name*/
    function Voting (bytes32 [] candidateNames) {
        candidateList = candidateNames;
    }
    
    /*function which return the total number of votes a candidate has obtained*/
    function totalVotesFor(bytes32 candidate) view public returns(uint8){
        require (validCandidate(candidate));
        return votesReceived[candidate] += 1;
    }
    
    
    /*function that incremnet the vote count*/
    function voteForCandidate(bytes32 candidate) public {
        require(validCandidate(candidate));
        votesReceived[candidate] += 1;
    }
    
    /*function which check whether a candadate is valid or not*/
    function validCandidate(bytes32 candidate) view public returns(bool) {
        for(uint i=0; i<candidateList.length; i++) {
            if(candidateList[i] == candidate) {
                return true;
            }
        }
        return false;

    }
}
