pragma solidity ^0.4.18;

contract Voting{
    //in the contract voting define a datatype structure for storing informations of the voter
    struct voter{
        address voterAddress;
        uint tokensBought;
        bytes32[] tokensUsedPerCandidate;
    }
    //mapping the candidate with the votes he recieved
    mapping(bytes32=>uint)public votesReceived;
    mapping(address=>voter)public votersInfo;
    bytes32[] public candidateList;
    uint totalTokens;
    uint balanceTokens;
    uint tokensPrice;
    
    //constructor which takes in necessary values and initialize all the defined variables
    function Voting(uint tokens, uint pricePerTokens, bytes32[] candidateName){
        totalTokens = tokens;
        balanceTokens = tokens;
        tokensPrice = pricePerTokens;
        candidateList = candidateName;
    }
    
    /*msg.sender gives the money the sender is willing to give. That value divided by the 
    price per token gives the number of tokens the person can buy*/
    function buy() payable returns(uint){
        uint tokensToBuy = msg.value/tokensPrice;
        votersInfo[msg.sender].voterAddress = msg.sender;
        votersInfo[msg.sender].tokensBought += tokensToBuy;
        balanceTokens -= tokensToBuy;
        return tokensToBuy;
    }
    
    
    function totalVotesFor(bytes32 candidate) view returns(uint){
        return votesReceived[candidate];
    }
    
<<<<<<< HEAD
    function voteForCandidate(byte32 candidtae, uint votesInTokens) public{
=======
<<<<<<< HEAD
    function voteForCandidate(bytes32 candidtae, uint votesInTokens) public{
=======
    function voteForCandidate(byte32 candidtae, uint votesInTokens) public{
>>>>>>> 0228fad830bf5d6a30f2519b1bf22073ca8f1e9e
>>>>>>> a3c9d39f6b63d2bee9c6e43e83112f95b708b30d
        uint index = indexOfCandidate(candidate);
        require(index!=uint(-1));
        if(voterInfo[msg.sender].tokensUsedPerCandidate.length==0){
        for(int i=0;i<candidateList.length, i++){
            voterInfo[msg.sender].tokensUsedPerCandidate.push(0);
        }
        uint availableTokens = voteInfo[msg.sender].tokensBought - totalTokensUsed(voterInfo[msg.sender].tokensUsedPerCandidate);
        require(availableTokens >= votesInTokens);
        votesReceived[candidate] += votesInTokens;
        voterInfo[msg.sender].tokensUsedPerCandidate[index] +=votesInTokens;
        }
    } 
    
    function indexOfCandidate(uint candidate) public view returns(uint){
        for(uint i=0; i<candidateList.length, i++){
            if(candidateList[i] == candidate){
                return i;
            }
        }
        return uint(-1);
    }
    
<<<<<<< HEAD
    function totalTokensUsed(uint _tokensUsedPerCandidate) private pure returns(uint) {
=======
<<<<<<< HEAD
    function totalTokensUsed(uint _tokensUsedPerCandidate) private pure returns(uint) {
=======
    function totalTokensUsed(_tokensUsedPerCandidate) private pure returns(uint) {
>>>>>>> 0228fad830bf5d6a30f2519b1bf22073ca8f1e9e
>>>>>>> a3c9d39f6b63d2bee9c6e43e83112f95b708b30d
        uint total = 0;
        for(uint i=0; i<_tokensUsedPerCandidate.length; i++){
            total += _tokensUsedPerCandidate[i];
        }
        return total;
    }
    
    function allCandidate() returns(bytes32[]) {
        return candidateList;
    }
    
    function tokensSold() returns(uint) {
        return totalTokens - balanceTokens;
    }
    
    function voterDetails(address user) view public returns (uint,uint[]) {
        return(voterInfo[user].tokensBought,voterInfo[user].tokensUsedPerCandidate);
    }
    
    function transfer(address account) public{
        account.transfer(this.balance);
    }
}
