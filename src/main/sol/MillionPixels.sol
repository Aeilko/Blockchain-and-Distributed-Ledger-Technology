pragma solidity ^0.6.3;

// Sells pixels of itself for an ether a piece.
// Based on the "Million Dollar Homepage" (http://www.milliondollarhomepage.com/)
contract MillionPixels{
    
    struct Pixel{
        bool sold;
        uint8 red;
        uint8 green;
        uint8 blue;
    }
    
    address owner;
    Pixel[1000000] private pixels;
    
    modifier OwnerOnly{
        require(msg.sender == owner, "This function is owner protected");
        _;
    }
    
    constructor() public{
        owner = msg.sender;
    }
    
    function buyPixel(uint16 x, uint16 y, uint8 red, uint8 green, uint8 blue) public payable{
        require(msg.value >= 1 ether, "Each pixel costs 1 ether");
        require(x < 1000 && y < 1000, "Coordinates should be within [0,999]");
        
        Pixel storage p = pixels[x+(1000*y)];
        require(!p.sold, "This pixel has been sold");
        
        p.sold = true;
        p.red = red;
        p.green = green;
        p.blue = blue;
    }
    
    function getPixel(uint16 x, uint16 y) public view returns(uint8, uint8, uint8){
        Pixel memory p = pixels[x+(1000*y)];
        return (p.red, p.green, p.blue);
    }
    
    function withdraw(uint256 amount, address payable to) public OwnerOnly{
        require(amount <= address(this).balance, "Unsufficient balance");
        to.transfer(amount);
    }
    
    function getBalance() public view returns(uint256){
        return address(this).balance;
    }
}