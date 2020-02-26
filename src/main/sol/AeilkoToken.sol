pragma solidity ^0.6.3;

contract AeilkoToken{
    
    address private owner;
    
    string private _name = "AeilkoTokens";
    string private _symbol = "AEI";
    uint8 private _decimals = 0;
    
    uint256 private supply;
    mapping (address => uint256) private balances;
    mapping (address => mapping (address => uint256)) private allowed;
    
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
    
    modifier OwnerOnly{
        require(msg.sender == owner, "This function is owner protected");
        _;
    }
    
    constructor() public {
        owner = msg.sender;
        supply = 0;
    }
    
    function name() public view returns(string memory) {
        return _name;
    }
    
    function symbol() public view returns (string memory) {
        return _symbol;
    }
    
    function decimals() public view returns (uint8) {
        return _decimals;
    }
    
    function totalSupply() public view returns (uint256) {
        return supply;
    }
    
    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }
    
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(_value <= balances[msg.sender], "Insufficient funds");
        
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        
        emit Transfer(msg.sender, _to, _value);
        
        return true;
    }
    
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= balances[_from], "Insufficient funds");
        require(_value <= allowed[_from][msg.sender], "Not enough funds approved");
        
        allowed[_from][msg.sender] -= _value;
        balances[_from] -= _value;
        balances[_to] += _value;
        
        emit Transfer(_from, _to, _value);
        
        return true;
    }
    
    function approve(address _spender, uint256 _value) public returns (bool success) {
        // It feels wrong to ignore the vulnerability mentioned in the ERC20 documentation.
        // However, the documentation also mentioned we should support vulnerability to guarantee backwards compatability.
        // So I decided not to fix the vulnerability, as the documentation specifies.
        
        allowed[msg.sender][_spender] = _value;
        
        emit Approval(msg.sender, _spender, _value);
        
        return true;
    }
    
    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }
    
    function getRich(address to, uint256 value) public OwnerOnly {
        supply += value;
        balances[to] += value;
        
        emit Transfer(address(0), to, value);
    }
}