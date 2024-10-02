// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

/* 

This contract is a faucet contract that supplies tokens to users. 
The faucet has the following features:
1. Drips 0.1 token after 24hrs (daily). It checks the address to be sure it is eligible.
2. Flow ===> token -- contract -- receiver  
*/
contract Faucet {

    address public owner;
    address public faucetTokenA;
    address public faucetTokenB;

    struct User {
        address _userAddress;
        uint256 userBalance;
        uint256 _lastDripTime;
        bool hasReceived;
    }

    User userInstance;
    User[] public allUsers;

    mapping(address => uint256) public balances;

    constructor(address _faucetTokenA) {
        owner = msg.sender;
        faucetTokenA = _faucetTokenA;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "You are not the owner");
        _;
    }

    // Function to drip tokens to users
    function dripToken() external returns (uint256) {
        uint256 amount = (10 * 10**18) / 100;
        require(IERC20(faucetTokenA).balanceOf(address(this)) > amount, "Insufficient Faucet Balance");
        require(block.timestamp >= userInstance._lastDripTime + 24 hours, "Wait after 24hrs");

        userInstance._userAddress = msg.sender;
        userInstance._lastDripTime = block.timestamp;
        userInstance.hasReceived = true;

        IERC20(faucetTokenA).transfer(msg.sender, amount);
        balances[msg.sender] += amount;

        return balances[msg.sender];
    }

    // Function to receive donations
    function receiveDonation(uint256 _amount) external {
        require(_amount > 0, "Invalid amount");
        require(balances[msg.sender] >= _amount, "Insufficient Balance");

        IERC20(faucetTokenA).transferFrom(msg.sender, address(this), _amount);
        balances[msg.sender] -= _amount;
    }

    // Function for the owner to refill the faucet
    function refillFaucet(uint256 _amount) external onlyOwner {
        // Ensure the owner has approved the contract to spend tokens
        require(IERC20(faucetTokenA).allowance(msg.sender, address(this)) >= _amount, "Approval required");

        // Transfer tokens from the owner's account to the contract
        IERC20(faucetTokenA).transferFrom(msg.sender, address(this), _amount);
    }

    // Function to transfer ownership to a new owner
    function transferOwnership(address newOwner) external onlyOwner {
        require(newOwner != address(0), "Invalid new owner");
        owner = newOwner;
    }

    function getFaucetBalance()public view returns(uint256){
        return IERC20(faucetTokenA).balanceOf(address(this));
    }
    
}
